//
//  ViewController.swift
//  VKClient
//
//  Created by Daniil on 12.10.2021.
//

import UIKit
import WebKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }

    let session = Session.instance

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginTextField: UITextField!

    @IBOutlet weak var vkclientImage: UIImageView!

    @IBOutlet weak var vkclientLabel: UILabel!

    @IBOutlet weak var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8006884"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]

        let request = URLRequest(url: urlComponents.url!)
        webView.load(request)

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00).cgColor, UIColor(red: 0.45, green: 0.68, blue: 1.00, alpha: 1.00).cgColor, UIColor(red: 0.21, green: 0.54, blue: 1.00, alpha: 1.00).cgColor]
        gradientLayer.locations = [0, 0.6, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.6)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        gradientLayer.frame = self.view.bounds
        gradientLayer.zPosition = 0
        self.view.layer.addSublayer(gradientLayer)

        loginTextField.layer.zPosition = 1
        passwordTextField.layer.zPosition = 1
        enterButton.layer.zPosition = 1
        vkclientImage.layer.zPosition = 1
        vkclientLabel.layer.zPosition = 1

        enterButton.layer.cornerRadius = 7

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapFunction))
        self.view.addGestureRecognizer(tapRecognizer)
    }

    @objc func tapFunction() {
        self.view.endEditing(true)
    }

    @IBAction func pressEnterButton(_ sender: UIButton) {
        //guard let login = loginTextField.text,
        //  //           let password = passwordTextField.text
        //  //     else {return}
        //
        //  //     if login == "admin", password == "1234" {
        loginTextField.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        loginTextField.textColor = .white
        passwordTextField.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        passwordTextField.textColor = .white
        //
        performSegue(withIdentifier: "toMainViewSegue", sender: nil)
        //    //       } else {
        //    //           loginTextField.backgroundColor = #colorLiteral(red: 0.7556071914, green: 0.256195526, blue: 0.2288467514, alpha: 1)
        //    //           loginTextField.textColor = .white
        //    //           passwordTextField.backgroundColor = #colorLiteral(red: 0.7556071914, green: 0.256195526, blue: 0.2288467514, alpha: 1)
        //    //           passwordTextField.textColor = .white
        //    //       }
        return
    }
}

extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }

        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
            var dict = result
            let key = param[0]
            let value = param[1]
            dict[key] = value
            return dict
        }

        session.token = params["access_token"]!

        AF.request("https://api.vk.com/method/friends.get", parameters: [
            "v": "5.131",
            "lang": "en",
            "order": "hints",
            "count": "5",
            "fields": "domain",
            "access_token": session.token
            ]).responseJSON { data in
            print(data.value)
        }
        
        AF.request("https://api.vk.com/method/photos.get", parameters: [
            "v": "5.131",
            "album_id": "profile",
            "rev": "1",
            "extended": "1",
            "count": "5",
            "access_token": session.token
            ]).responseJSON { data in
            print(data.value)
        }
        
        AF.request("https://api.vk.com/method/groups.get", parameters: [
            "v": "5.131",
            "count": "5",
            "lang": "en",
            "extended": "1",
            "access_token": session.token
            ]).responseJSON { data in
            print(data.value)
        }
        
        AF.request("https://api.vk.com/method/groups.search", parameters: [
            "v": "5.131",
            "q": "panorama",
            "type": "group",
            "count": "5",
            "access_token": session.token
            ]).responseJSON { data in
            print(data.value)
        }
        
        decisionHandler(.cancel)
        webView.removeFromSuperview()
    }
}


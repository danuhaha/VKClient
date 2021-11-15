//
//  ViewController.swift
//  VKClient
//
//  Created by Daniil on 12.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginTextField: UITextField!

    @IBOutlet weak var vkclientImage: UIImageView!

    @IBOutlet weak var vkclientLabel: UILabel!

    @IBOutlet weak var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

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


    @IBAction func enterButtonPressed(_ sender: UIButton) {
//       guard let login = loginTextField.text,
//             let password = passwordTextField.text
//       else {return}

//       if login == "admin", password == "1234" {
        loginTextField.backgroundColor = #colorLiteral(red: 0.4862985015, green: 0.696264565, blue: 0.9745907187, alpha: 1)
        loginTextField.textColor = .white
        passwordTextField.backgroundColor = #colorLiteral(red: 0.4862985015, green: 0.696264565, blue: 0.9745907187, alpha: 1)
        passwordTextField.textColor = .white

        performSegue(withIdentifier: "toMainViewSegue", sender: nil)
        //       } else {
        //           loginTextField.backgroundColor = #colorLiteral(red: 0.7556071914, green: 0.256195526, blue: 0.2288467514, alpha: 1)
        //           loginTextField.textColor = .white
        //           passwordTextField.backgroundColor = #colorLiteral(red: 0.7556071914, green: 0.256195526, blue: 0.2288467514, alpha: 1)
        //           passwordTextField.textColor = .white
        //       }
        return
    }


}


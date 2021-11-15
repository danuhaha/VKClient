//
//  NewsViewController + TableViewDataSource.swift
//  VKClient
//
//  Created by danuhaha on 27.10.2021.
//

import UIKit

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierNewsCell, for: indexPath) as? NewsCell else { return UITableViewCell() }

        cell.configure(post: posts[indexPath.row])

        return cell
    }


}

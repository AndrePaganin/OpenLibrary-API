//
//  ListBooksTableViewController.swift
//  OpenLibralyChallenge
//
//  Created by Andre Paganin on 25/04/2022.
//

import UIKit

class ListBooksTableViewController: UITableViewController {

    var booksList: [Book] = []

    override init(style: UITableView.Style) {
        super.init(style: style)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BookTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return booksList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.bookTitle?.text = booksList[indexPath.row].title
        cell.bookAuthor.text = booksList[indexPath.row].author_name?.first
        cell.bookPubDate.text = booksList[indexPath.row].first_publish_year?.formatted()
        if let cover  = booksList[indexPath.row].cover_i {
            cell.bookImage.load(url: URL.init(string: "https://covers.openlibrary.org/b/id/" + "\(cover)" + "-M.jpg")!)
        } else {
            cell.bookImage.image = UIImage(named: "noimage")
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}

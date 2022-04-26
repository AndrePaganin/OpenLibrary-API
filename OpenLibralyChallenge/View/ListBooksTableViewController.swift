//
//  ListBooksTableViewController.swift
//  OpenLibralyChallenge
//
//  Created by Andre Paganin on 25/04/2022.
//

import UIKit

class ListBooksTableViewController: UITableViewController {

    @IBOutlet var booksTableView: UITableView!

    let myData = ["First", "Second", "Third", "Fourth", "Fifth"]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "BookTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BookTableViewCell")
        booksTableView.delegate = self
        booksTableView.dataSource = self


    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.textLabel?.text = myData[indexPath.row]
        return cell
    }

}

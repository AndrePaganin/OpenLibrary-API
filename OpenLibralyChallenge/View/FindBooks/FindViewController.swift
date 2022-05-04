//
//  FindViewController.swift
//  OpenLibralyChallenge
//
//  Created by Andre Paganin on 25/04/2022.
//

import UIKit

class FindViewController: UIViewController {

    var presenter = BooksPresenter()
    var books: [Book] = []

    @IBOutlet weak var imputFindBook: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchButton() {
        //chamar o presenter
        if imputFindBook.text == "" {
            return
        }
        // Searching key plus add to final URL
        guard let searchKey = self.imputFindBook.text else { return }
        let finalUrl = self.presenter.finalURL(searchKey: searchKey)
        print(finalUrl)
        // Call to API
        self.presenter.requestAPI(url: finalUrl, completion: { [weak self]books in
            // Checking the results
            if !books.isEmpty{
                DispatchQueue.main.async {
                    self?.showBooks(books: books)
                }
            }
        })
    }

    func showBooks(books: [Book]) {
        let booksList = ListBooksTableViewController(style: .plain)
        booksList.booksList = books
        self.navigationController?.pushViewController(booksList, animated: true)
    }

}

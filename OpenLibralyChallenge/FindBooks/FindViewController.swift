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

        // Do any additional setup after loading the view.
    }

    @IBAction func searchButton() {
        //chamar o presenter
        if imputFindBook.text == "" {
            return
        }
        // Building up final url
        guard let searchKey = self.imputFindBook.text else { return }
        let searchUrl = self.presenter.finalURL(searchKey: searchKey)
        print(searchUrl)
        // Call to API
        self.presenter.requestAPI(url: searchUrl, completion: { [weak self]books in
            // Results
            self?.books = books
            // Checking the results
        })
    }
}

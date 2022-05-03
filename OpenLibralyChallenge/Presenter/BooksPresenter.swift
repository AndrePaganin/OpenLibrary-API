//
//  BooksPresenter.swift
//  OpenLibralyChallenge
//
//  Created by Andre Paganin on 30/04/2022.
//

import Foundation


class BooksPresenter {


    // Base URL:
    let baseURL = "https://openlibrary.org/search.json?q="

    // Build the URL with the searchKey provided
    func finalURL(searchKey: String) -> URL {
        let url = "\(baseURL)\(searchKey.replacingOccurrences(of: " ", with: "+"))"
        guard let searchURL = URL(string: url) else { return URL(string: "")! }

        return searchURL
    }

    
    // Send a request to the API and pass in the returned object
    func requestAPI(url: URL, completion: @escaping ([Book]) -> Void) {
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let data = data else { return }
            do {
                let object = try JSONDecoder().decode(BookModel.self, from: data)
                completion(object.docs)
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }).resume()
    }

}



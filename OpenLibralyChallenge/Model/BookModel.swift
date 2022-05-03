//
//  BookModel.swift
//  OpenLibralyChallenge
//
//  Created by Andre Paganin on 30/04/2022.
//

import UIKit

// Book Model for JSON initilization
struct BookModel: Decodable {
    let docs: [Book]
}

// Book object for array of books in JSON initialization
struct Book: Decodable {
    let title: String?
    let author_name: [String]?
    let first_publish_year: Int?
    let edition_count: Int?
    let cover_i: Int?
    let publisher: [String]?
    let type: String?
    let language: [String]?
}

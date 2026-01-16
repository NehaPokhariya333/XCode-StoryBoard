//
//  Book.swift
//  favouriteBooks
//
//  Created by GEU on 16/01/26.
//

import Foundation

class Book {

    var title: String
    var author: String
    var genre: String
    var length: Int 

    init(title: String, author: String, genre: String, length: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.length = length
    }
}

//
//  postData.swift
//  H4XOR News
//
//  Created by Gurpreet Singh on 2021-04-25.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

// we need the identifiable protocol in order to use that structure inside our list, and for the list to know how to order each item. 
struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String? // some data dont have url
}

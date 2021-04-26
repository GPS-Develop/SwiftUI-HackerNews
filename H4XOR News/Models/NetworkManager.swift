//
//  NetworkManager.swift
//  H4XOR News
//
//  Created by Gurpreet Singh on 2021-04-25.
//

import Foundation

//protocol : ObservableObject can broadcast 1 or many of its properties
class NetworkManager: ObservableObject {
    
    // Published - whenever there are changes notify all the listeners
    @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // Update must happen on main thread because others are listening to it
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch  {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

//
//  ContentView.swift
//  H4XOR News
//
//  Created by Gurpreet Singh on 2021-04-25.
//

import SwiftUI
// Sequence of events
// A view loads up a navigation view with a list and a navigation title, and as soon as it appears we trigger the network managers, fetch data method. And this will take a little while, depending on the internet speed to fetch the data from the "Algolia" API. And once we get the data back, we decode the data, if there were any errors, then we catch it and print it, but if there were no errors, then we go ahead and save the results.hits, which contains an array of post objects to our posts property here. And because this post property is published, it means that anybody who is subscribed to the observed object to the network manager will have the post property updated in real time, and the UI will update accordingly.

struct ContentView: View {
    // ObservedObject - Listens to the updates(subscribes)
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            // for every post put its title in the list
            List(networkManager.posts){ post in
                // Creates a button inside each cell that takes to destination
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
                
            }
            .navigationBarTitle("H4XOR NEWS")
        }
        // onAppear - like the viewDidLoad. Performs when the body view appears on screen
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//let posts = [
//    Post(id: "1", title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")
//]

//
//  DetailView.swift
//  H4XOR News
//
//  Created by Gurpreet Singh on 2021-04-25.
//

import SwiftUI

// Sequence of events
// When the detail view loads up, it gets past a URL string, which gets used to create a web view, from a UI Kit component which is called Wk WebView. Once that gets created, then we update it by loading the URL that is meant to show in our detail view

struct DetailView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}



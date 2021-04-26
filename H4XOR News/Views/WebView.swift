//
//  WebView.swift
//  H4XOR News
//
//  Created by Gurpreet Singh on 2021-04-25.
//

import Foundation
import SwiftUI
import WebKit

// UIViewRepresentable - Allows us to create a UIKit webview
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
    
}


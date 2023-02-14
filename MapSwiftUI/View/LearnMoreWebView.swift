//
//  LearnMoreWebView.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 14/02/2023.
//

import Foundation
import WebKit
import SwiftUI

struct LearnMoreWebView: View {
    var url : String?
    var body: some View {
    
        HStack{
            WebView(url: url)
        }
    }
}

struct LearnMoreWebView_Previews: PreviewProvider {
    static var previews: some View {
        LearnMoreWebView()
    }
}



struct WebView : UIViewRepresentable{
    let url : String?
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrl = url{
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                uiView.load(request)
                
            }
        }
    }
}


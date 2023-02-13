//
//  MapSwiftUIApp.swift
//  MapSwiftUI
//
//  Created by Mohamed Makhlouf Ahmed on 12/02/2023.
//

import SwiftUI

@main
struct MapSwiftUIApp: App {
    @State private var locationViewModel = LocationViewModel()
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(locationViewModel)
        }
    }
}

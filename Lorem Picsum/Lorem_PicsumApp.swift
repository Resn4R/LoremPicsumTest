//
//  Lorem_PicsumApp.swift
//  Lorem Picsum
//
//  Created by Vito Borghi on 13/10/2023.
//
import SwiftData
import SwiftUI

@main
struct Lorem_PicsumApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: RandyRandyPic.self)
    }
}

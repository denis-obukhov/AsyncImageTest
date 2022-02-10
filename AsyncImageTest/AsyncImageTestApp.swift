//
//  AsyncImageTestApp.swift
//  AsyncImageTest
//
//  Created by Denis Obukhov on 08.02.2022.
//

import SwiftUI
import Foundation

@main
struct AsyncImageTestApp: App {
    
    init() {
        URLCache.imageCache.removeAllCachedResponses()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

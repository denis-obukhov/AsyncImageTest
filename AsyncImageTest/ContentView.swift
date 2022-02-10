//
//  ContentView.swift
//  AsyncImageTest
//
//  Created by Denis Obukhov on 08.02.2022.
//

import SwiftUI
import CachedAsyncImage

struct ContentView: View {
    let imageURL = URL(string: "https://idsb.tmgrup.com.tr/ly/uploads/images/2020/11/25/74707.jpg")!
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ZStack {
                    Color.gray
                    
                    CachedAsyncImage(
                        url: imageURL,
                        urlCache: .imageCache,
                        transaction: Transaction(animation: .default)
                    ) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 500)
                                .frame(maxWidth: .infinity)
                                .overlay(Color.red.opacity(0.8))
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        case .failure:
                            Image(systemName: "wifi.slash")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(maxHeight: 500)
                }
                
                ForEach(0..<1000) {
                    Text("Value: \($0)")
                        .foregroundColor(.white)
                        .background(Color.green)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension URLCache {
    static let imageCache = URLCache(
        memoryCapacity: 512 * 1000 * 1000,
        diskCapacity: 10 * 1000 * 1000 * 1000
    )
}

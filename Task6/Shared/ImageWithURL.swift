//
//  ImageWithURL.swift
//  Gym_Exercise_App
//
//  Created by AxeTech on 12/16/21.
//

import Foundation

import Foundation
import SwiftUI

struct ImageWithURL: View {
    //image cache'la store pannum.so again open panum pothu no need for server connection.
    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }
//server irunthu load agura image epdi view aganum
    var body: some View {
          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
              .resizable()
            .aspectRatio(contentMode: .fill)
              .clipped()
            //.frame(width: 200, height: 300, alignment: .center)
    }
}

class ImageLoaderAndCache: ObservableObject {
    
    @Published var imageData = Data()
    
    init(imageURL: String) {
        let image =  UIImage(named: "IMG")
                self.imageData = (image?.pngData())!
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            print("got image from cache")
            self.imageData = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response {
                let cachedData = CachedURLResponse(response: response, data: data)
                                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        print("downloaded from internet")
                        self.imageData = data
                    }
                }
            }).resume()
        }
    }
}

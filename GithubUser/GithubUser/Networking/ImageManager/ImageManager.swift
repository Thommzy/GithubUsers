//
//  ImageManager.swift
//  GithubUser
//
//  Created by Timothy Obeisun on 9/16/22.
//

import UIKit
import Foundation


public final class ImageManager {
    private let cache = NSCache<NSString, UIImage>()
    
    // MARK: - Public
    public init() {}
    
    public func loadImage(for url: URL, completion: @escaping (Result<UIImage, ImageManagerError>) -> ()) {
        if let image = cachedImage(for: url) {
            completion(.success(image))
            return
        }
        
        downloadImage(url: url) { result in
            if let image = try? result.get() {
                self.saveImage(image, for: url)
            }
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
    
    // MARK: - Private
    
    private func makeKey(_ url: URL) -> NSString {
        return url.absoluteString as NSString
    }
    
    private func cachedImage(for url: URL) -> UIImage? {
        return cache.object(forKey: makeKey(url))
    }
    
    private func saveImage(_ image: UIImage, for url: URL) {
        return cache.setObject(image, forKey: makeKey(url))
    }
    
    private func downloadImage(url: URL, completion: @escaping (Result<UIImage, ImageManagerError>) -> ()) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let networkError = error {
                completion(.failure(ImageManagerError.network(networkError)))
                return
            }
            
            guard let imageData = data else {
                completion(.failure(ImageManagerError.noData))
                return
            }
            
            guard let image = UIImage(data: imageData) else {
                completion(.failure(ImageManagerError.badData))
                return
            }
            
            completion(.success(image))
        }
        task.resume()
    }
    
}

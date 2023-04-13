//
//  Bundle-Decodable.swift
//  SwiftTutor
//
//  Created by Anthony Abbott on 13/04/2023.
//

import Foundation

extension Bundle {
  
  enum BundleDecodableError: Error {
    case decodedSuccessfully
    case failedToFindFile
    case failedToLoadFile
    case failedToDecodeFile
    case failedToDecodeData
  }
  
  /**
   Decode Object "T" from file
   */
  func decode<T: Codable>(_ file: String, completionHandler: @escaping (Result<T, BundleDecodableError>) -> Void)  {
      
    let decoder = JSONDecoder()
  
    guard let url = self.url(forResource: file, withExtension: nil) else {
      return completionHandler(.failure(.failedToFindFile))
    }
    
    guard let data = try? Data(contentsOf: url) else {
      return completionHandler(.failure(.failedToLoadFile))
    }
    
    do {
      let decoded : T = try decoder.decode(T.self, from: data)
      
      completionHandler(.success(decoded))
    } catch {
      completionHandler(.failure(.failedToDecodeFile))
    }
  }
  
    /**
     Decode Object "T" from data
     */
  func decode<T: Codable>(from data: Data, completionHandler: @escaping (Result<T, BundleDecodableError>) -> Void)  {
      
    let decoder = JSONDecoder()
  
    do {
      let decoded : T = try decoder.decode(T.self, from: data)
      
      completionHandler(.success(decoded))
    } catch (_) {
      completionHandler(.failure(.failedToDecodeData))
    }
  }
}

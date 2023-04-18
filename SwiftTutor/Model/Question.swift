//
//  Question.swift
//  SwiftTutor
//
//  Created by Anthony Abbott on 13/04/2023.
//

import Foundation

struct Question : Codable {
  
  static var id = 0
  
  static func getNextId() -> Int {
    defer {
      Question.id += 1
    }
    return Question.id
  }
  
  private (set) var prompt  : String
  private (set) var answer  : String
  private (set) var id      = getNextId()
  
  private enum CodingKeys : String, CodingKey { case prompt, answer }
}

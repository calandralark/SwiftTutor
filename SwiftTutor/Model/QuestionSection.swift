//
//  QuestionSection.swift
//  SwiftTutor
//
//  Created by Anthony Abbott on 13/04/2023.
//

import Foundation

struct QuestionSection: Codable {
  
  static var id = 0

  static func getNextId() -> Int {
    defer {
      QuestionSection.id += 1
    }
    return QuestionSection.id
  }
  
  private (set) var title       : String
  private (set) var description : String
  private (set) var questions   : [Question] = []
  private (set) var id          = getNextId()
  
  private enum CodingKeys : String, CodingKey { case title, description, questions }
}

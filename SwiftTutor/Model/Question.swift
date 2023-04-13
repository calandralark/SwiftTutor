//
//  Question.swift
//  SwiftTutor
//
//  Created by Anthony Abbott on 13/04/2023.
//

import Foundation

struct Question : Codable {
  private (set) var prompt  : String
  private (set) var answer  : String
  
  init?(json: [String: Any]) {
    guard let prompt = json["prompt"] as? String,
          let answer = json["answer"] as? String
    else {
      return nil
    }
    self.prompt = prompt
    self.answer = answer
  }
}

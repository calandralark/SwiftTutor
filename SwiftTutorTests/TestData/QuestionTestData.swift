//
//  QuestionTestData.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 13/04/2023.
//

import Foundation

struct QuestionTestData {
  
  static var data : Data {
    Data(QuestionTestData.questionJSON.utf8)
  }
  
  static let prompt = "What is meant by \"sendable\"?"
  
  static let answer = "\"sendable\" data, which is data that can safely be transferred to another thread. This is accomplished through a new Sendable protocol, and an @Sendable attribute for functions.\n\nSwift uses the @Sendable attribute on functions or closure to mark them as working concurrently, and will enforce various rules to stop us shooting ourself in the foot."
  
  static let questionJSON = " {\"prompt\": \"Task and TaskGroup have four priorities. What are they?\",\"answer\": \"Task and TaskGroup can be created with one of four priority levels: high is the most important, then medium, low, and finally background at the bottom. Task priorities allow the system to adjust the order in which it executes work, meaning that important work can happen before unimportant work.\" }"
}

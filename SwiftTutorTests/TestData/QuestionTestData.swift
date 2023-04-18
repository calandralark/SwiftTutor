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
  
  static let prompt = "Task and TaskGroup have four priorities. What are they?"
  
  static let answer = "Task and TaskGroup can be created with one of four priority levels: high is the most important, then medium, low, and finally background at the bottom. Task priorities allow the system to adjust the order in which it executes work, meaning that important work can happen before unimportant work."
  
  static let questionJSON = " {\"prompt\": \"Task and TaskGroup have four priorities. What are they?\",\"answer\": \"Task and TaskGroup can be created with one of four priority levels: high is the most important, then medium, low, and finally background at the bottom. Task priorities allow the system to adjust the order in which it executes work, meaning that important work can happen before unimportant work.\" }"
}

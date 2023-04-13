//
//  QuestionSectionTestData.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 13/04/2023.
//

import Foundation

struct QuestionSectionTestData {
  
  var data : Data {
    Data(QuestionSectionTestData.jsonString.utf8)
  }
  
  static let jsonString = """
  {
    "title" : "Concurrency",
    "description" : "Concurrent code in Swift, including async/await, tasks, actors, and more.",
    "questions" : [
      {
        "prompt" : "What is meant by \"concurrency\"?",
        "answer" : "It is when a single CPU runs multiple programs at the same time. The CPU is working on a round-robin basis, allocating a time slice to one process, and then to another, and so on."
      },
      
      {
        "prompt" : "What is meant by \"sendable\"?",
        "answer" : "\"sendable\" data, which is data that can safely be transferred to another thread. This is accomplished through a new Sendable protocol, and an @Sendable attribute for functions.\n\nSwift uses the @Sendable attribute on functions or closure to mark them as working concurrently, and will enforce various rules to stop us shooting ourself in the foot."
      },
      
      {
        "prompt" : "What is meant by \"parallelism\"?",
        "answer" : "This is when there are multiple CPU's and the diffentent programs can be run on different CPU's. additionally, a single program can spread its processing on multiple CPU's."
      }
  }
"""
}

//
//  QuestionModel.swift
//  SwiftTutor
//
//  Created by Anthony Abbott on 18/04/2023.
//

import Foundation

struct QuestionModel: Codable {
  
  var totalNumberOfQuestions: Int {
    sections.reduce(0, {$0 + $1.questions.count})
  }
  
  private (set) var sections  : [QuestionSection]
  
  init(sections: [QuestionSection]) {
    self.sections = sections
  }
}

//
//  QuestionModelTests.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 18/04/2023.
//

import XCTest
@testable import SwiftTutor

final class QuestionModelTests: XCTestCase {
  
  var sut: QuestionModel!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    sut = QuestionModelTestData.questionModel
  }
  
  override func tearDownWithError() throws {
    Question.id = 0
    sut = nil
    try super.tearDownWithError()
  }
  
  func test_modelCanLoadFromJSONFile() {
    XCTAssertNotNil(sut)
  }
  
  func test_modelHasFourteenSections() {
    XCTAssertEqual(sut.sections.count, 14)
  }
  
  func test_firstSectionHas5Questions() {
    XCTAssertEqual(sut.sections[0].questions.count, 5)
  }
  
  func test_secondSectionHas16Questions() {
    XCTAssertEqual(sut.sections[1].questions.count, 16)
  }
  
  func test_ThirdSectionFirstQuestions_HasIdOf21() {
    XCTAssertEqual(sut.sections[2].questions[0].id, 21)
  }
  
  func test_totalNumberOfQuestions_ShouldBe328() {
    XCTAssertEqual(sut.totalNumberOfQuestions, 328)
  }
  
  func test_lastQuestionId_ShouldBe327() {
    XCTAssertEqual(sut.sections.last?.questions.last?.id, 327)
  }
}

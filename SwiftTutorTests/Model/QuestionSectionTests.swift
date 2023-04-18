//
//  QuestionSectionTests.swift
//  SwiftTutorTests
//
//  Created by Anthony Abbott on 13/04/2023.
//

import XCTest
@testable import SwiftTutor


final class QuestionSectionTests: XCTestCase {
  
  var sut: QuestionSection!
  
  override func setUpWithError() throws {
    try super.setUpWithError()
    
    Bundle.main.decode(from: QuestionSectionTestData.data) { (response: Result<QuestionSection, Bundle.BundleDecodableError>) in
      
      switch response {
        case .failure( _): break
        case .success(let decodedSection):
          self.sut = decodedSection
        }
    }
  }
  
  override func tearDownWithError() throws {
    sut = nil
    QuestionSection.id = 0
    try super.tearDownWithError()
  }
  
  func testQuestionSection_whenLoadingSection_ThenSUTIsNotNil() {
    XCTAssertNotNil(sut)
  }
  
  func testQuestionSection_whenLoadingSection_ThenTheTitleShouldBeConcurrency() {
    XCTAssertEqual(sut.title, QuestionSectionTestData.sectionTitle)
  }

  func testQuestionSection_whenLoadingSection_ThenTheDescriptionShouldBeAsexpected() {
    XCTAssertEqual(sut.description, QuestionSectionTestData.sectionDescription)
  }

  func testQuestionSection_whenLoadingSection_ThenNumberOfQuestionsShouldBeThree() {
    XCTAssertEqual(sut.questions.count, 3)
  }
  
  func testQuestionSection_whenLoadingSection_ThenPromptForQuestionThreeShouldBeParallelism() {
    XCTAssertEqual(sut.questions[2].prompt, "What is meant by \"parallelism\"?")
  }
  
  func testQuestionSection_whenLoadingSections_SectionsShouldHaveIDs() {
    XCTAssertEqual(sut.id, 0)
  }
  
  func testQuestion_WhenThreeQuestionsCreated_ThenIDShouldBe2() {
    
    // Given
    QuestionSection.id = 0
    let q0: QuestionSection? = Bundle.main.decode(from: QuestionSectionTestData.data)
    let q1: QuestionSection? = Bundle.main.decode(from: QuestionSectionTestData.data)
    let q2: QuestionSection? = Bundle.main.decode(from: QuestionSectionTestData.data)
    
    // Then
    XCTAssertNotNil(q0)
    XCTAssertNotNil(q1)
    XCTAssertNotNil(q2)
    
    XCTAssertEqual(q0!.id, 0)
    XCTAssertEqual(q1!.id, 1)
    XCTAssertEqual(q2!.id, 2)
  }
}

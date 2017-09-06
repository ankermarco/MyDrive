//
//  GameEngine.swift
//  MyDrive
//
//  Created by Ke Ma on 06/09/2017.
//  Copyright © 2017 ke.ma. All rights reserved.
//

import XCTest

class GameEngineTests: XCTestCase {
  
  var engine: GameEngine!
  
  override func setUp() {
    super.setUp()
    engine = GameEngine.init(size: 5, bombs: [(2,1),(4,1)])
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testTheWidthOfTheAreaIs5()
  {
    XCTAssertEqual(5, engine.bound.width)
  }
  
  func testTheHeightOfTheAreaIs5()
  {
    XCTAssertEqual(5, engine.bound.height)
  }
  
  func testHasBombs()
  {
    XCTAssertNotNil(engine.bombs)
  }
  
  func testCellOneOneHasBomb()
  {
    let bombOne = engine.bombs[0]
    XCTAssertTrue((2,1) == bombOne)
  }
  
  func testNumberOfBombsEquals2WhenClickOn32()
  {
    let response = engine.checkCell(coordinate: (3, 2))
    XCTAssertEqual(2, response.numbeOfBombs)
  }
  
}

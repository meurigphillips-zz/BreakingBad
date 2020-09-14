//
//  BreakingBadBluePrintUITests.swift
//  BreakingBadBluePrintUITests
//
//  Created by Meurig Phillips on 14/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import XCTest

class BreakingBadBluePrintUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }
    
    func testWalterWhiteDisplayedInEverySeason() throws {
        app.launch()
        let searchCharactersSearchField = app.navigationBars["BreakingBadBluePrint.CharacterListView"].searchFields["Search Characters"]
        XCTAssertEqual(searchCharactersSearchField.exists, true)
        searchCharactersSearchField.tap()
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["1"].tap()
        let walterWhiteCell = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Walter White"]/*[[".cells.staticTexts[\"Walter White\"]",".staticTexts[\"Walter White\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertEqual(walterWhiteCell.exists, true)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["2"].tap()
        XCTAssertEqual(walterWhiteCell.exists, true)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["3"].tap()
        XCTAssertEqual(walterWhiteCell.exists, true)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["4"].tap()
        XCTAssertEqual(walterWhiteCell.exists, true)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["5"].tap()
        XCTAssertEqual(walterWhiteCell.exists, true)
    }
    
    func testTheCousinsDisplayedInSeasonThreeOnly() throws {
        app.launch()
        let searchCharactersSearchField = app.navigationBars["BreakingBadBluePrint.CharacterListView"].searchFields["Search Characters"]
        XCTAssertEqual(searchCharactersSearchField.exists, true)
        searchCharactersSearchField.tap()
        app/*@START_MENU_TOKEN@*/.keys["M"]/*[[".keyboards.keys[\"M\"]",".keys[\"M\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["All"].tap()
        let theCousinsCell = app.tables.staticTexts["Marco & Leonel Salamanca"]
        XCTAssertEqual(theCousinsCell.exists, true)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["1"].tap()
        XCTAssertEqual(theCousinsCell.exists, false)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["2"].tap()
        XCTAssertEqual(theCousinsCell.exists, false)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["3"].tap()
        XCTAssertEqual(theCousinsCell.exists, true)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["4"].tap()
        XCTAssertEqual(theCousinsCell.exists, false)
        app.navigationBars["BreakingBadBluePrint.CharacterListView"].buttons["5"].tap()
        XCTAssertEqual(theCousinsCell.exists, false)
    }
    
    func testJessePinkmanDetailView() throws {
        app.launch()
        let searchCharactersSearchField = app.navigationBars["BreakingBadBluePrint.CharacterListView"].searchFields["Search Characters"]
        XCTAssertEqual(searchCharactersSearchField.exists, true)
        searchCharactersSearchField.tap()
        let jessePinkmanCell = app.tables.staticTexts["Jesse Pinkman"]
        XCTAssertEqual(jessePinkmanCell.exists, true)
        jessePinkmanCell.tap()
        let occupationLabel = app.staticTexts["Occupation(s):\n‣ Meth Dealer"]
        XCTAssertEqual(occupationLabel.exists, true)
        let statusLabel = app.staticTexts["Status: Alive"]
        XCTAssertEqual(statusLabel.exists, true)
    }
}

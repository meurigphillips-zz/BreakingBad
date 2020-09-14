//
//  BreakingBadBluePrintTests.swift
//  BreakingBadBluePrintTests
//
//  Created by Meurig Phillips on 13/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import XCTest
@testable import BreakingBadBluePrint

class BreakingBadBluePrintTests: XCTestCase {
    
    private var decoder: JSONDecoder!
    private var characters: [Character]!

    override func setUp() {
        super.setUp()
        decoder = JSONDecoder()
    }
    
    override func tearDown() {
        decoder = nil
        characters = nil
        super.tearDown()
    }
    
    func test__given_valid_json__then_characters_decoded() {
        XCTAssertNoThrow(characters = try decoder.decode([Character].self, from: .json("CharactersResponse")))
        
        XCTAssertEqual(characters[0].name, "Walter White")
        XCTAssertEqual(characters[0].birthday, "09-07-1958")
        XCTAssertEqual(characters[0].occupation[0], "High School Chemistry Teacher")
        XCTAssertEqual(characters[0].occupation[1], "Meth King Pin")
        XCTAssertEqual(characters[0].imageUrl, "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg")
        XCTAssertEqual(characters[0].status, "Presumed dead")
        XCTAssertEqual(characters[0].nickname, "Heisenberg")
        XCTAssertEqual(characters[0].portrayed, "Bryan Cranston")
        XCTAssertEqual(characters[0].appearance, [1,2,3,4,5])
        
        XCTAssertEqual(characters[2].name, "Skyler White")
        XCTAssertEqual(characters[2].birthday, "08-11-1970")
        XCTAssertEqual(characters[2].occupation[0], "House wife")
        XCTAssertEqual(characters[2].occupation[1], "Book Keeper")
        XCTAssertEqual(characters[2].imageUrl, "https://s-i.huffpost.com/gen/1317262/images/o-ANNA-GUNN-facebook.jpg")
        XCTAssertEqual(characters[2].status, "Alive")
        XCTAssertEqual(characters[2].nickname, "Sky")
        XCTAssertEqual(characters[2].portrayed, "Anna Gunn")
        XCTAssertEqual(characters[2].appearance, [1,2,3,4,5])
    }


}

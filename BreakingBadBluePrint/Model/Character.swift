//
//  Character.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 09/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let birthday: String
    let occupation: [String]
    let imageUrl: String
    let status: String
    let nickname: String
    let appearance: [Int]
    let portrayed: String
    let featuredShows: String
    let betterCallSaulAppearance: [Int]

    enum CodingKeys: String, CodingKey {
        case id = "char_id"
        case name, birthday, occupation, status, nickname, appearance, portrayed
        case featuredShows = "category"
        case imageUrl = "img"
        case betterCallSaulAppearance = "better_call_saul_appearance"
    }
}

enum Season: String, CaseIterable {
    case one = "One"
    case two = "Two"
    case three = "Three"
    case four = "Four"
    case five = "Five"
}

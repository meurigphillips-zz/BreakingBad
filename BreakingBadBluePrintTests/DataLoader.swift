//
//  DataLoader.swift
//  BreakingBadBluePrintTests
//
//  Created by Meurig Phillips on 13/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import XCTest

final class DataLoader {
    
    func data(from file: String, withExtension extention: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: file, withExtension: extention) else {
            fatalError("ERROR unable to create url for \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("ERROR no resource at \(url)")
        }
        return data
    }
}

extension Data {
    
    static func from(_ file: String, withExtension extention: String) -> Data {
        return DataLoader().data(from: file, withExtension: extention)
    }
    
    static func json(_ file: String) -> Data {
        return .from(file, withExtension: "json")
    }
}


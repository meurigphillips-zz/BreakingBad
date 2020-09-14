//
//  Box.swift
//  BreakingBadBluePrint
//
//  Created by Meurig Phillips on 13/09/2020.
//  Copyright © 2020 Meurig Phillips. All rights reserved.
//

import Foundation

final class Box<T> {
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}

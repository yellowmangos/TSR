//
//  Presets.swift
//  TSR
//
//  Created by Jun Kyu on 2018. 7. 21..
//  Copyright © 2018년 JJworks. All rights reserved.
//

import Foundation

struct Presets :Hashable {
    
    var hashValue: Int { return identifier }
    
    var playTimeInSeconds = 0
    var halfTimeInSeconds = 0
    var quaterCounts = 0
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
        
    }
    
    init() {
        self.identifier = Presets.getUniqueIdentifier()
    }

}

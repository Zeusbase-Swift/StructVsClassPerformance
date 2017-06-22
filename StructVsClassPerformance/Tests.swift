//
//  TestRunner.swift
//  StructVsClassPerformance
//
//  Created by Khanh Nguyen on 7/05/2016.
//  Copyright © 2016 k. All rights reserved.
//

import UIKit

class Tests {
    static func runTests() {
        measure("static func (1 field)") {
            for a in 1...10000000 {
                IntStruct.add(a: a, b: a)
            }
        }
        
        measure("class func (1 field)") {
            for a in 1...10000000 {
                IntClass.add(a: a, b: a)
            }
        }
        
        measure("class (1 field)") {
            var x = IntClass(0)
            for _ in 1...10000000 {
                x = x + IntClass(1)
            }
        }
        
        measure("struct (1 field)") {
            var x = IntStruct(0)
            for _ in 1...10000000 {
                x = x + IntStruct(1)
            }
        }
        
        measure("class (10 fields)") {
            var x = Int10Class(0)
            for _ in 1...10000000 {
                x = x + Int10Class(1)
            }
        }
        
        measure("struct (10 fields)") {
            var x = Int10Struct(0)
            for _ in 1...10000000 {
                x = x + Int10Struct(1)
            }
        }
    }
    
    static fileprivate func measure(_ name: String, block: () -> ()) {
        let t0 = CACurrentMediaTime()
        
        block()
        
        let dt = CACurrentMediaTime() - t0
        print("\(name) -> \(dt)")
    }
}



//
//  TestRunner.swift
//  StructVsClassPerformance
//
//  Created by Khanh Nguyen on 7/05/2016.
//  Copyright © 2016 k. All rights reserved.
//

import UIKit

class Tests {
    static let iterations = 10000000 * 20
    static func runTests() {
        
        measure("class (1 field)") {
            var x = IntClass(0)
            for _ in 1...iterations {
                x = x + IntClass(1)
            }
        }
        
        measure("struct (1 field)") {
            var x = IntStruct(0)
            for _ in 1...iterations {
                x = x + IntStruct(1)
            }
        }
        
        measure("class (10 fields)") {
            var x = Int10Class(0)
            for _ in 1...iterations {
                x = x + Int10Class(1)
            }
        }
        
        measure("struct (10 fields)") {
            var x = Int10Struct(0)
            for _ in 1...iterations {
                x = x + Int10Struct(1)
            }
        }
        
        measure("STRUCT: static func (1 field)") {
            var x = 0
            for a in 1...iterations {
                x = x + IntStruct.testStructStatic(a: a, b: a)
            }
        }
        
        measure("GLOBAL: func") {
            var x = 0
            for a in 1...iterations {
                x = x + globalTest(a: a, b: a)
            }
        }
        
        measure("CLASS: class func (1 field)") {
            var x = 0
            for a in 1...iterations {
                x = x + IntClass.testClassFunc(a: a, b: a)
            }
        }
        
        measure("CLASS: static func (1 field)") {
            var x = 0
            for a in 1...iterations {
                x = x + IntClass.testClassStatic(a: a, b: a)
            }
        }
    }
    
    static fileprivate func measure(_ name: String, block: () -> ()) {
        let t0 = CACurrentMediaTime()
        
        block()
        
        let dt = CACurrentMediaTime() - t0
        let st = String.init(format: "%.4f", dt * 1000)
        print("\(name) -> \(st) msec")
    }
}



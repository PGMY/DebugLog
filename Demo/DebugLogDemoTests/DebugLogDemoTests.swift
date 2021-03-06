//
//  DebugLogDemoTests.swift
//  DebugLogDemoTests
//
//  Created by Yasuhiro Inami on 2014/06/22.
//  Copyright (c) 2014年 Yasuhiro Inami. All rights reserved.
//

import XCTest
import CoreGraphics
import QuartzCore

class DebugLogTests: XCTestCase {
    
    override func setUp()
    {
        super.setUp()
        
        println()
        println("===== SET UP =====")
#if DEBUG
        println("=== DEBUG MODE ===")
#endif
    }
    
    override func tearDown()
    {
        println()
        println("===== TEAR DOWN =====")
        
        super.tearDown()
    }
    
    func testDebugLog()
    {
        LOG()   // prints functionName
        LOG(3)
        
        LOG_OBJECT(NSString.self)   // prints "NSString.self = NSString"
        
        let str: String = "hi"
        LOG_OBJECT(str)
        
        var optional: String? = nil
        LOG_OBJECT(optional)
        
        optional = "this is optional"
        LOG_OBJECT(optional)
        
        var implicitlyUnwrappedOptional: String! = nil
        LOG_OBJECT(implicitlyUnwrappedOptional)
        
        implicitlyUnwrappedOptional = "this is im... bla bla optional"
        LOG_OBJECT(implicitlyUnwrappedOptional)
    }
    
    func testPrintlnPerformance()
    {
        self.measureBlock() {
            for _ in 0 ..< 1000 {
#if DEBUG
                println("hoge")
#endif
            }
        }
    }
    
    func testDebugLogPerformance()
    {
        self.measureBlock() {
            for _ in 0 ..< 1000 {
                LOG("hoge")
            }
        }
    }
    
}

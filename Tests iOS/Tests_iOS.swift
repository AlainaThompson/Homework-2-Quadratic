//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Alaina Thompson on 1/28/22.
//

import XCTest

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    
    func testQuadInitialization() async {
        
            
        let a = 1.0
        let b = 1.0
        let c = 0.001
            
        let myQuad = QuadraticEq()
            
        let _ = await myQuad.initWithQuad(a: Double, b: Double, c: Double)
            
        let xPos = myQuad.xPos
        
        
        let root1 = sqrt(((pow(b, 2)) - (4*a*c)))
        let denominator1 = 2*a
        let numerator1 = -b + root1
        
        XCTAssertEqual(xPos, numerator1/denominator1, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
        let xNeg = myQuad.xNeg
        
        
        let root2 = sqrt(((pow(b, 2)) - (4*a*c)))
        let denominator2 = 2*a
        let numerator2 = -b - root2
        
        XCTAssertEqual(xNeg, numerator2/denominator2, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
        let xPrimePos = myQuad.xPrimePos
        
        
        let root3 = sqrt((pow(b, 2)) - (4*a*c))
        let denominator3 = b + root3
        let numerator3 = -(2*c)
        
        XCTAssertEqual(xPrimePos, numerator3/denominator3, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
        let xPrimeNeg = myQuad.xPrimeNeg
        
        
        let root4 = sqrt((pow(b, 2)) - (4*a*c))
        let denominator4 = b - root4
        let numerator4 = -(2*c)
        
        XCTAssertEqual(xPrimeNeg, numerator4/denominator4, accuracy: 1.0E-7, "Was not equal to this resolution.")
        
        
        
            
    }
        
    func testXPos() async {
          
            
        let myQuad = QuadraticEq()
            
        a = 1.0
        b = 1.0
        c = 0.001
        
        
        let xPos = await myQuad.calculatePosQuadratic(a: Double, b: Double, c: Double)
        
        let root1 = sqrt(((pow(b, 2)) - (4*a*c)))
        let denominator1 = 2*a
        let numerator1 = -b + root1
        
        XCTAssertEqual(xPos, numerator1/denominator1, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
            
    }
    
    func testXNeg() async {
          
            
        let myQuad = QuadraticEq()
            
        a = 1.0
        b = 1.0
        c = 0.001
        
        
        let xNeg = await myQuad.calculateNegQuadratic(a: Double, b: Double, c: Double)
        
        let root2 = sqrt(((pow(b, 2)) - (4*a*c)))
        let denominator2 = 2*a
        let numerator2 = -b - root2
        
        XCTAssertEqual(xNeg, numerator2/denominator2, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
            
    }
    
    
    func testXPrimePos() async {
          
            
        let myQuad = QuadraticEq()
            
        a = 1.0
        b = 1.0
        c = 0.001
        
        
        let xPrimePos = await myQuad.calculatePrimePosQuadratic(a: Double, b: Double, c: Double)
        
        let root3 = sqrt((pow(b, 2)) - (4*a*c))
        let denominator3 = b + root3
        let numerator3 = -(2*c)
        
        XCTAssertEqual(xPrimePos, numerator3/denominator3, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
            
    }
    
    
    
    func testXPrimeNeg() async {
          
            
        let myQuad = QuadraticEq()
            
        a = 1.0
        b = 1.0
        c = 0.001
        
        
        let xPrimeNeg = await myQuad.calculatePrimeNegQuadratic(a: Double, b: Double, c: Double)
        
        let root4 = sqrt((pow(b, 2)) - (4*a*c))
        let denominator4 = b + root4
        let numerator4 = -(2*c)
        
        XCTAssertEqual(xPrimeNeg, numerator4/denominator4, accuracy: 1.0E-7, "Was not equal to this resolution.")
            
            
    }
    
    
    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

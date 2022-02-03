//
//  Quadratic Equation.swift
//  Homework 2
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

class QuadraticEq: NSObject,ObservableObject {

    var A = 1.0
    var B = 10.0
    var C = 1.0
    @Published var xPos = 0.0
    @Published var xNeg = 0.0
    @Published var xPrimeNeg = 0.0
    @Published var xPrimePos = 0.0
    @Published var posQuad = 0.0
    @Published var negQuad = 0.0
    @Published var primePosQuad = 0.0
    @Published var primeNegQuad = 0.0
    @Published var aString = "1.0"
    @Published var bString = "2.0"
    @Published var cString = "3.0"
    @Published var xPosText = ""
    @Published var xNegText = ""
    @Published var xPrimePosText = ""
    @Published var xPrimeNegText = ""
    @Published var enableButton = true
    
    
    
    
    func initWithQuad(a: Double, b: Double, c: Double) async -> Bool {
        A = a
        B = b
        C = c
            
        let _ = await withTaskGroup(of:  Void.self) { taskGroup in
                
        
            
            taskGroup.addTask { let _ = await self.calculatePosQuad(a: self.A, b: self.B, c: self.C)}
            taskGroup.addTask { let _ = await self.calculateNegQuad(a: self.A, b: self.B, c: self.C)}
            taskGroup.addTask { let _ = await self.calculatePrimeNegQuad(a: self.A, b: self.B, c: self.C)}
            taskGroup.addTask { let _ = await self.calculatePrimePosQuad(a: self.A, b: self.B, c: self.C)}
            
        }
            
            await setButtonEnable(state: true)
                                                 
       
        

        return true

        }
    
    
    
        func calculatePosQuad(a: Double, b: Double, c: Double) async -> Double {
                  
            
            //                                __________
            //                            | /  2
            //                    - b  +  |/  b   - 4ac
            //            x  =   -----------------------
            //                             2a

           
        
            let root1 = sqrt(((pow(b, 2)) - (4*a*c)))
            let denominator1 = 2*a
            let numerator1 = -b + root1
            let calculatedPosQuadratic = numerator1/denominator1
            let newXPosText = String(format: "%7.5f", calculatedPosQuadratic)
             
            await updateXPos(xPosTextString: newXPosText)
            await newXPosValue(xPosValue: calculatedPosQuadratic)
           
            return calculatedPosQuadratic
                   
        }
           
        
        func calculateNegQuad(a: Double, b: Double, c: Double) async -> Double {
                   
            
            //                                __________
            //                            | /  2
            //                    - b  -  |/  b   - 4ac
            //            x  =   -----------------------
            //                             2a

                   
            let root2 = sqrt(((pow(b, 2)) - (4*a*c)))
            let denominator2 = 2*a
            let numerator2 = -b - root2
            let calculatedNegQuadratic = numerator2/denominator2
            let newXNegText = String(format: "%7.5f", calculatedNegQuadratic)
                   
            await updateXNeg(xNegTextString: newXNegText)
            await newXNegValue(xNegValue: calculatedNegQuadratic)
                   
            return calculatedNegQuadratic
                   
        }
        
        func calculatePrimePosQuad(a: Double, b: Double, c: Double) async -> Double {
                  
            
            //                   - 2c
            //     x  =   -------------------
            //                   __________
            //                | /  2
            //           b +  |/  b  - 4ac
            
            
            let root3 = sqrt((pow(b, 2)) - (4*a*c))
            let denominator3 = b + root3
            let numerator3 = -(2*c)
            let calculatedPrimePosQuadratic = numerator3/denominator3
            let newXPrimePosText = String(format: "%7.5f", calculatedPrimePosQuadratic)
                   
            await updateXPrimePos(xPrimePosTextString: newXPrimePosText)
            await newXPrimePosValue(xPrimePosValue: calculatedPrimePosQuadratic)
                   
            return calculatedPrimePosQuadratic
                
        }
        
        
        func calculatePrimeNegQuad(a: Double, b: Double, c: Double) async -> Double {
                  
            
            //                   - 2c
            //     x  =   -------------------
            //                   __________
            //                | /  2
            //           b -  |/  b  - 4ac
            
            
                   
            let root4 = sqrt((pow(b, 2)) - (4*a*c))
            let denominator4 = b - root4
            let numerator4 = -(2*c)
            let calculatedPrimeNegQuadratic = numerator4/denominator4
            let newXPrimeNegText = String(format: "%7.5f", calculatedPrimeNegQuadratic)
                   
            await updateXPrimeNeg(xPrimeNegTextString: newXPrimeNegText)
            await newXPrimeNegValue(xPrimeNegValue: calculatedPrimeNegQuadratic)
                   
            return calculatedPrimeNegQuadratic
                
        }
        
        
        
        
        
        
        
        
        
        
        
          @MainActor func setButtonEnable(state: Bool){
                 
                 
                 if state {
                     
                     Task.init {
                         await MainActor.run {
                             
                             
                             self.enableButton = true
                         }
                     }
                     
                     
                         
                 }
                 else{
                     
                     Task.init {
                         await MainActor.run {
                             
                             
                             self.enableButton = false
                         }
                     }
                         
                 }
                 
             }
             
            
             @MainActor func updateXPos(xPosTextString: String){
                 
                 xPosText = xPosTextString
                 
             }
             
             @MainActor func newXPosValue(xPosValue: Double){
                 
                 self.xPos = xPosValue
                 
             }
    
             @MainActor func newXNegValue(xNegValue: Double){
                 
                 self.xNeg = xNegValue
                 
             }
             
            
             @MainActor func updateXNeg(xNegTextString:String){
                 
                 xNegText = xNegTextString
                 
                 
             }
        
        @MainActor func updateXPrimePos(xPrimePosTextString: String){
            
            xPrimePosText = xPrimePosTextString
            
        }
        
        @MainActor func newXPrimePosValue(xPrimePosValue: Double){
            
            self.xPrimePos = xPrimePosValue
            
        }
        
        @MainActor func newXPrimeNegValue(xPrimeNegValue: Double){
            
            self.xPrimeNeg = xPrimeNegValue
            
        }
        
       
        @MainActor func updateXPrimeNeg(xPrimeNegTextString:String){
            
            xPrimeNegText = xPrimeNegTextString
            
            
        }
        
    }
        
        
        

        
        


//
//  ContentView.swift
//  Shared
//
//  Created by Alaina Thompson on 1/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var quadraticModel = QuadraticEq()
    @State var aString = "1.0"
    @State var bString = "10.0"
    @State var cString = "1.0"
    
    var body: some View {
        
        VStack{
            Text("a Value")
                .padding(.top,25)
                .padding(.bottom, 0)
            TextField("Enter a value", text: $aString, onCommit: {Task.init {await self.calculateQuadraticEq()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
            Text("b Value")
                .padding(.top,25)
                .padding(.bottom, 0)
            TextField("Enter b value", text: $bString, onCommit: {Task.init {await self.calculateQuadraticEq()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
                    
            
            Text("c Value")
                .padding(.top,25)
                .padding(.bottom, 0)
            TextField("Enter c value", text: $cString, onCommit: {Task.init {await self.calculateQuadraticEq()}})
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom, 30)
            
            
            
            
            HStack {
                VStack{
            Text("X value positive")
                .padding(.bottom, 0)
            TextField("", text: $quadraticModel.xPosText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
                    
            Text("X value Negative")
                .padding(.bottom, 0)
            TextField("", text: $quadraticModel.xNegText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                    
            Text("X prime value Postive")
                .padding(.bottom, 0)
            TextField("", text: $quadraticModel.xPrimePosText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                    
                    
            Text("X prime value Negative")
                .padding(.bottom, 0)
            TextField("", text: $quadraticModel.xPrimeNegText)
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                    
                    
                    
        }
        VStack{
            Text("X value Positive")
                .padding(.bottom, 0)
            Text("\(quadraticModel.posQuad, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
                
            
            Text("X value Negative")
                .padding(.bottom, 0)
            Text("\(quadraticModel.negQuad, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
            
            Text("X prime value Positive")
                .padding(.bottom, 0)
            Text("\(quadraticModel.primePosQuad, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
            
            Text("X prime value Negative")
                .padding(.bottom, 0)
            Text("\(quadraticModel.primeNegQuad, specifier: "%.2f")")
                .padding(.horizontal)
                .frame(width: 100)
                .padding(.top, 0)
                .padding(.bottom,30)
            
            
            
            
            
            
            }
        
                    
                    
                    
                    
                    

                
                
                
                
            }
            
            Button("Calculate", action: {Task.init { await self.calculateQuadraticEq(); await self.calculateQuadraticEq()}})
                .padding(.bottom)
                .padding()
                .disabled(quadraticModel.enableButton == false)
           
            
            
        }
        
    }
        
    func calculateQuadraticEq() async {
        
        quadraticModel.setButtonEnable(state: false)
        
        let _ : Bool = await quadraticModel.initWithQuad(a: Double(aString)!, b: Double(bString)!, c: Double(cString)!)
        
        

}
    
    
}
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    }


//
//  OTPfieldView.swift
//  OTPComponent
//
//  Created by UDAY on 04/09/2023.
//

import SwiftUI
import Combine

struct OTPfieldView: View {
    
    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    
    
    var body: some View {
        VStack {
            
            
            Text("Enter 4 digit code we'll text you on Email")
                .font(.caption)
                .fontWeight(.thin)
                .padding(.top)
            
            HStack(spacing:15, content: {
                
                TextField("", text: $pinOne)
                    .modifier(TFModifer(pin:$pinOne))
                    .onChange(of:pinOne){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinTwo
                        }
                    }
                    .focused($pinFocusState, equals: .pinOne)
                
                TextField("", text:  $pinTwo)
                    .modifier(TFModifer(pin:$pinTwo))
                    .onChange(of:pinTwo){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinThree
                        }else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinOne
                            }
                        }
                    }
                    .focused($pinFocusState, equals: .pinTwo)
                
                
                TextField("", text:$pinThree)
                    .modifier(TFModifer(pin:$pinThree))
                    .onChange(of:pinThree){newVal in
                        if (newVal.count == 1) {
                            pinFocusState = .pinFour
                        }else {
                            if (newVal.count == 0) {
                                pinFocusState = .pinTwo
                            }
                        }
                    }
                    .focused($pinFocusState, equals: .pinThree)
                
                
                TextField("", text:$pinFour)
                    .modifier(TFModifer(pin:$pinFour))
                    .onChange(of:pinFour){newVal in
                        if (newVal.count == 0) {
                            pinFocusState = .pinThree
                        }
                    }
                    .focused($pinFocusState, equals: .pinFour)
                
                
            })
            .padding(.vertical)
            
            
            Button(action: {}, label: {
                Spacer()
                Text("Verify")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Spacer()
            })
            .padding(15)
            .background(Color.cyan)
            .clipShape(Capsule())
            .padding()
        }
        
    }
}

/**
 `OTP Modifer:- modifiers are methods you call on your views to customize their appearance and behavior. Views and modifiers work together to define your UI.
 */

struct TFModifer: ViewModifier {
    
    @Binding var pin : String
    
    var textLimt = 1
    
    func limitText(_ upper : Int) {
        if pin.count > upper {
            self.pin = String(pin.prefix(upper))
        }
    }
    
    func body(content: Content) -> some View {
        content
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
            .onReceive(Just(pin)) {_ in limitText(textLimt)}
            .frame(width: 45, height: 45)
            .background(Color.white.cornerRadius(5))
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.blue, lineWidth: 2)
            )
    }
}
//MARK: - ENUM
enum FocusPin {
    case  pinOne, pinTwo, pinThree, pinFour
}

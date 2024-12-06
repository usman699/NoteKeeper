//
//  Login.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 06/12/2024.
//

import SwiftUI

struct CreateAccount: View {
    var body: some View {
     
        ZStack {
            Image("v915-wit-004-d")
                .resizable()
                 // Ensures the image fills the entire area
                .ignoresSafeArea() // Extends the image to the full screen
            
            VStack{
                Spacer()
                Spacer()
                Spacer()
                HStack{
                    Text("Create  your account")
                        .font(.largeTitle)
                }
                
                Textfeild(hinttext: "Enter UserName")
                Spacer()
                    .frame(height: 20)
                Textfeild(hinttext: "Enter Email")
                Spacer()
                    .frame(height: 20)
                
                Textfeild(hinttext: "Enter Password")
                Spacer()
                    .frame(height: 20)
                Textfeild(hinttext: "Re-type Password")
                Spacer()
                    .frame(height: 20)
                
                
                CUSTOMSNBUTTON(title: "Create A Account", action: {
                    
                })
                HStack{
                    Text("Go to")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                     
                    Text("Login?")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .onTapGesture {
                            print("forgot")
                                  }
                    Spacer()
                }
                .padding(.leading , 24)
                Spacer()
                
            }
        }
        
        
    }
}


#Preview {
    forgot()
}


//
//  Login.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 06/12/2024.
//

import SwiftUI
class SharedState: ObservableObject {
    @Published var check: Bool = false
}
protocol CheckValidation {
    func checkValidation() -> Bool
}



struct Login: View {
    @StateObject private var sharedState = SharedState() // Shared state instance
  
    @State var showDetail = false
    var body: some View {
     
        ZStack {
          
            VStack{
                
                Spacer()
                HStack(){
                    Text("Login to your account")
                        .font(.largeTitle)
                }
                
                Textfeild(hinttext: "Enter Email", email: true, sharedState: sharedState)
                Spacer()
                    .frame(height: 20)
                Textfeild(hinttext: "Enter Password", Password: true, sharedState: sharedState)
                Spacer()
                    .frame(height: 20)
                CUSTOMSNBUTTON(title: "Login", action: {
                    sharedState.check = true
                })
                HStack{
                    Text("Create an")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                     
                    Text("Account?")
                        .fullScreenCover(isPresented: $showDetail) {
                        //    CreateAccount()
                            
                            }
                       .transaction { transaction in
                        transaction.disablesAnimations = true
                    }
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .onTapGesture {
                            showDetail.toggle()
                            print("123123")
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
    Login()
}

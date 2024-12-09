////
////  Login.swift
////  NoteKeeper
////
////  Created by Spark Solutionz Inc on 06/12/2024.
////
//
//import SwiftUI
//
//struct CreateAccount: View {
//    @State var showDetail = false
//    var body: some View {
//     
//        ZStack {
//        
//            VStack{
//                Spacer()
//                
//                HStack{
//                    Text("Create  your account")
//                        .font(.largeTitle)
//                }
//                
//                Textfeild(hinttext: "Enter UserName"   , sharedState: sharedState)
//                Spacer()
//                    .frame(height: 20)
//                Textfeild(hinttext: "Enter Email", email: true   , sharedState: sharedState )
//                Spacer()
//                    .frame(height: 20)
//                
//                Textfeild(hinttext: "Enter Password"   , sharedState: sharedState)
//                Spacer()
//                    .frame(height: 20)
//                Textfeild(hinttext: "Re-type Password"   , sharedState: sharedState)
//                Spacer()
//                    .frame(height: 20)
//                
//                
//                CUSTOMSNBUTTON(title: "Create A Account", action: {
//                    
//                })
//                HStack{
//                    Text("Go to")
//                        .foregroundStyle(.gray)
//                        .font(.system(size: 20))
//                     
//                    Text("Login?")
//                        .fullScreenCover(isPresented: $showDetail) {
//                            Login()
//                            
//                            }
//                        .transaction { transaction in
//                            transaction.disablesAnimations = true
//                        }
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                        .onTapGesture {
//                            showDetail.toggle()
//                                  }
//                    Spacer()
//                }
//                .padding(.leading , 24)
//                Spacer()
//                
//            }
//        }
//        
//        
//    }
//}
//
//
//#Preview {
//    CreateAccount()
//}
//

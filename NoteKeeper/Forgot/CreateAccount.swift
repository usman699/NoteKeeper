////
////  Login.swift
////  NoteKeeper
////
////  Created by Spark Solutionz Inc on 06/12/2024.
////

import SwiftUI

struct CreateAccount: View {
    enum Field {
        case username , email ,password , repassword
    }
    @FocusState var  focusedField : Field?
    @State var UserName = ""
    @State var emailtext = ""
    @State var password = ""
    @State var repassword = ""
    @State var isloading = false
    @State var showDetail = false
    var body: some View {
     
        ZStack {
        
            VStack{
                Spacer()
                
                HStack{
                    Text("Create  your account")
                        .font(.largeTitle)
                }
                
                
                TextField("Enter UserName", text: $UserName)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .username)
                    .submitLabel( .next)
                    .onSubmit {
                        
                        focusedField = .email
                        
                    }
                    .onChange(of: UserName) { newValue in
                    
//                        if  passwordText.count >= 4{
//                            background = true
//                        }
//                        if newValue == ""  || newValue == "" {
//                            background = false
//                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(
                                
                                lineWidth: 1
                            )
                    )
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(.horizontal, 20)
                
                Spacer()
                                   .frame(height: 30)
                
                
                
                TextField("Enter Email", text: $emailtext)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .email)
                    .submitLabel( .next)
                    .onSubmit {
                        
                        focusedField = .password
                        
                    }
                    .onChange(of: emailtext) { newValue in
                    
//                        if  passwordText.count >= 4{
//                            background = true
//                        }
//                        if newValue == ""  || newValue == "" {
//                            background = false
//                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(
                                
                                lineWidth: 1
                            )
                    )
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(.horizontal, 20)
                
                Spacer()
                                   .frame(height: 30)
                
                
                
                
                TextField("Enter Password", text: $password)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .password)
                    .submitLabel( .next)
                    .onSubmit {
                        
                        focusedField = .repassword
                        
                    }
                    .onChange(of: password) { newValue in
                    
//                        if  passwordText.count >= 4{
//                            background = true
//                        }
//                        if newValue == ""  || newValue == "" {
//                            background = false
//                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(
                                
                                lineWidth: 1
                            )
                    )
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(.horizontal, 20)
                
                Spacer()
                                   .frame(height: 30)
                
                
                TextField("Re-Type Password", text: $repassword)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .repassword)
                    .submitLabel( .done)
                    .onSubmit {
                        
             
                        
                    }
                    .onChange(of: password) { newValue in
                    
//                        if  passwordText.count >= 4{
//                            background = true
//                        }
//                        if newValue == ""  || newValue == "" {
//                            background = false
//                        }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(
                                
                                lineWidth: 1
                            )
                    )
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .padding(.horizontal, 20)
                
                Spacer()
                                   .frame(height: 20)
                
                

                
                CUSTOMSNBUTTON(Colors: Color.black, title: "Create A Account", isloading: $isloading , action: {
                    
                })
                HStack{
                    Text("Go to")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                     
                    Text("Login?")
                        .fullScreenCover(isPresented: $showDetail) {
                            Login()
                            
                            }
                        .transaction { transaction in
                            transaction.disablesAnimations = true
                        }
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .onTapGesture {
                            showDetail.toggle()
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
    CreateAccount()
}


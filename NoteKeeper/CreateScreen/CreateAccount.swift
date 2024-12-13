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
    @State var Errortext = ""
    @State var ErrorBool = false
    @State var EmailText = ""
    @State var firstPassword = ""
    @State var ErrorEmail = false
    @State var ErrorPassword = false
    @State var ErrorPasswordText = ""
    @State var password = ""
    @State var repassword = ""
    @State var isloading = false
    @State var showDetail = false
    @State var background = false
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
                        
                        if UserName.count < 4 || UserName.count < 4 || UserName == "" {
                            Errortext = "Enter at least 4 Chracters Long"
                            ErrorBool = true
                        }
                        else {
                            focusedField = .email
                            ErrorBool = false
                        }
                       
                        
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
                
                
                HStack{
                    ErrorBool
                    
                    ?
                    Text(Errortext)
                    
                        .foregroundStyle(.red)
                       
                    :
                    Text("")
                    Spacer()
                } .padding(.leading, 20)
                    .frame(height: ErrorBool ? 50 : 0)
 
                Spacer()
                    .frame(height:  ErrorBool ? 0 : 20)
            
               
                
                
                TextField("Enter Email", text: $emailtext)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .email)
                    .submitLabel( .next)
                    .onSubmit {
                        var cehck =  isValidEmail(emailtext)
                         if cehck == false  {
                             print(cehck)
                             EmailText = "Enter a valid Email"
                             ErrorEmail = true
                         }
                         else {
                             focusedField = .password
                             EmailText = ""
                             
                             ErrorEmail  = false
                         }
                         
                        
                        
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
                HStack{
                    ErrorEmail
                    
                    ?
                    Text(EmailText)
                    
                        .foregroundStyle(.red)
                       
                    :
                    Text("")
                    Spacer()
                } .padding(.leading, 20)
                    .frame(height: ErrorEmail ? 50 : 0)
                Spacer()
                    .frame( height: ErrorEmail ? 0 : 20)
            
                
                
                
                
                
                
                
                SecureField("Enter Password", text: $password)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .password)
                    .submitLabel( .next)
                    .onSubmit {
                        firstPassword = password
                        if password.count < 8 {
                            ErrorPassword = true
                            ErrorPasswordText = "Password Must Be 8 Characters long"
                        }
                        else {
                            
                            ErrorPassword = false
                            
                            ErrorPasswordText  = ""
                            focusedField = .repassword
                        }
                        
                        
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
                
                
                
                
                SecureField("Re-Type Password", text: $repassword)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .repassword)
                    .submitLabel( .done)
                    .onSubmit {
                        
                        if firstPassword == repassword {
                            ErrorPasswordText = ""
                            ErrorPassword = false
                        }
                        else {
                            ErrorPasswordText = "Password Does not match"
                            ErrorPassword = true
                        }
                    
                        if ErrorBool == false  && ErrorPassword == false  && ErrorEmail == false   {
                            
                            background = true
                        }
                        else {
                            background = false
                        }
                        
                        
                    }
                    .onChange(of: repassword) { oldvalue , newValue in
                       
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
       
                
                HStack{
                    ErrorPassword
                    
                    ?
                    Text(ErrorPasswordText)
                    
                        .foregroundStyle(.red)
                       
                    :
                    Text("")
                    Spacer()
                } .padding(.leading, 20)
                    .frame(height: ErrorPassword ? 50 : 0)
                
                
                
//
                
                
                
                
                
                
                
                
                
                
                
                CUSTOMSNBUTTON(Colors: background ? Color.black : Color.gray  ,
                               title: "Create A Account",
                               isloading: $isloading ,
                               action: {
                    
                    if background == true {
                        isloading = true
                    }
                    
                    
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
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func checkpassword(cehck: String ){
        
        
    }

}

#Preview {
    CreateAccount()
}


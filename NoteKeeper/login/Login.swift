import SwiftUI
enum Field {
    case email, password
}

struct Login: View {
    @State private var emailText: String = ""
    @State private var ErrorMsg: String = ""
    @State private var passwordText: String = ""
    @FocusState private var focusedField: Field?
    @State private var showDetail = false
    @State var  background = false
    @State private var showAlert = false
    @State private var isSuccess = false
    @State private var isloading = false
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                HStack {
                    Text("Login to your account")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                
                TextField("Enter Email", text: $emailText)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .email)
                    .submitLabel( .next)
                    .onSubmit {
                        
                        focusedField = .password
                        
                    }
                    .onChange(of: emailText) { newValue in
                    
                        if  passwordText.count >= 4{
                            background = true
                        }
                        if newValue == ""  || newValue == "" {
                            background = false
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
                
                
                Spacer().frame(height: 30)
                
                
                SecureField("Enter Password", text: $passwordText)
                    .autocapitalization(.none)
                
                
                    .focused($focusedField, equals:  .password)
                    .submitLabel( .next)
                    .onSubmit {
                        
                        print(passwordText.count)
                        if passwordText.count  >= 4  {
                            background  = true
                        }
                    }
                    .onChange(of: passwordText) { newValue in
                       
                        if  newValue.count >= 4  || emailText.count >= 4{
                            background = true
                        }
                        if newValue == ""  || emailText == "" {
                            background = false
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
                
                
                
                Spacer().frame(height: 30)
                
                CUSTOMSNBUTTON(Colors: background ? Color.black : Color.gray, title: "Login",   isloading: $isloading) {
                 
                    if passwordText.count >= 4 || emailText.count >= 4{
                 
                        let emailcahek =   isValidEmail(emailText)
                        if emailcahek == false {
                            ErrorMsg = "Email is invalid"
                            showAlert = true
                                    
                        }
                        else {
                           
                            isloading = true
                                                  print("isloading: \(isloading)")
                        }
                        
                    
                    }
                    else {
                        return
                    }
                }
                .alert(ErrorMsg, isPresented: $showAlert) {
                            Button("OK", role: .cancel) { }
                        }
                
                
                HStack {
                    Text("Create an")
                        .foregroundStyle(.gray)
                        .font(.system(size: 20))
                    
                    Text("Account?")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .fullScreenCover(isPresented: $showDetail) {
                             CreateAccount()
                        }
                        .onTapGesture {
                            showDetail.toggle()
                        }
                    
                    Spacer()
                }
                .padding(.leading, 24)
                
                Spacer()
            }
        }
    }
 
        
        
        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        }
        
    
}


#Preview {
    Login()
}


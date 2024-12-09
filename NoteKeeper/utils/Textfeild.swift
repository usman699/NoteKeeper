import SwiftUI

struct Textfeild: View , CheckValidation{
    
    func checkValidation() -> Bool {
        
         
    let  cehck =  checkValidation(text)
        // Example validation: check if both username and password are not empty
        return che
      }
    @FocusState private var isTextFieldFocused: Bool
    var hinttext: String = ""
    @State var ErrorText: String = ""
    @State var ErrorBool: Bool = false
    @State var check: Bool = false
    var email: Bool = false
    var Password: Bool = false
    var Name: Bool = false

       
     
    @State var text: String = ""
    @ObservedObject var sharedState: SharedState // Access shared state
    var body: some View {
        VStack {
            Group {
                if Password {
                    SecureField(hinttext, text: $text)
                        .autocapitalization(.none)
                        .textContentType(.password)
                       
                        .focused($isTextFieldFocused)
                       
                      
                } else {
                    TextField(hinttext, text: $text)
                        .keyboardType(email ? .emailAddress : .default)
                        .focused($isTextFieldFocused)
                        .onChange(of: text) { newValue in
                            if sharedState.check {
                                                           checkValidation(newValue)
                                                       }
                        
                        }
                        .onSubmit {
                            checkValidation(text)
                        }
                }
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(
                        ErrorBool ? Color.red : (isTextFieldFocused ? Color.black : Color.gray),
                        lineWidth: 1
                    )
            )
            .frame(maxWidth: .infinity, maxHeight: 50)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))

            HStack {
                if ErrorBool {
                    Text(ErrorText)
                        .padding(.leading, 25)
                        .font(.system(size: 18))
                        .foregroundColor(.red)
                }
                Spacer()
            }
        }
    }
    func none (){
        
    }
   func checkValidation(_ text: String) {
       
        if email {
           
            let emailValidation = isValidEmail(text)
            if !emailValidation {
                ErrorBool = true
                ErrorText = "Enter a valid Email"
            }
            if  text == "" {
                ErrorText = ""
                ErrorBool =  false
            }
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
}





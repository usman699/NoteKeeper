import SwiftUI

struct Textfeild: View {
    enum Field {
           case email, password
       }
    @FocusState private var isTextFieldFocused: Bool

    @FocusState var focusedField: Field?
    var hinttext: String = ""
    @State var ErrorText: String = ""
    @State var ErrorBool: Bool = false
    @State var check: Bool = false
    var email: Bool = false
    var Password: Bool = false
    var Name: Bool = false
   
    @State var text: String = ""

    var body: some View {
        VStack {
           
                       Group {
                           if Password {
                               SecureField(hinttext, text: $text)
                                   .autocapitalization(.none)
                                   .focused($focusedField, equals: .password)
                                   .textContentType(.password)
                                  // .submitLabel(.done) // Display "Next" on the keyboard
                                 
                           } else if email {
                               TextField(hinttext, text: $text)
                                   .autocapitalization(.none)
                                   .focused($focusedField, equals: .email)
                                   .textContentType(.emailAddress)
                                   .submitLabel(.next) // Display "Next" on the keyboard
                                   .onSubmit {
                                      
                                       DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                                               focusedField = .password
                                                               print("Focus updated to password")
                                                           }
                         
                                   }
                           }
                       }
                       .padding()
                       .overlay(
                           RoundedRectangle(cornerRadius: 25)
                               .stroke(
                                   ErrorBool ? Color.red : (focusedField != nil ? Color.black : Color.gray),
                                   lineWidth: 1
                               )
                       )
                       .frame(maxWidth: .infinity, maxHeight: 50)
                       .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))

                       if ErrorBool {
                           Text(ErrorText)
                               .padding(.leading, 25)
                               .font(.system(size: 18))
                               .foregroundColor(.red)
                       }
                   }
               
               .onAppear {
                   focusedField = .email // Set the initial focus to the email field
               }
           }

}





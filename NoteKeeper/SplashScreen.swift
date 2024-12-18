//#imageLiteral(resourceName: "10720.jpg")
//  SplashScreen.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 05/12/2024.
//

import SwiftUI

struct SplashScreen: View {
    @State var count = 0
    @State var showDetail = false
    @State var isloading = false
    var maintitles: [String] =  [ "Stay update with your Notes", "We store all your Data so \n you  can access anywhere", "Secure login"]
    var  images : [String] = ["10720", "20945549","4957136"]
    var body: some View {
    
        VStack{
            Spacer()
            
           
            Text(maintitles[count])
                .padding()
                .scaleEffect(1.2)  // Make the text slightly larger during animation
                .animation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.3), value: count)  // Animate when count changes
                            
                    .font(.system(size: 25 ,weight: .regular))
          
            Image( images[count])
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight:300)
            
            Text("Stay update with your Notes with help of data base and login functionlity and make life more productive")
                .padding()
                .foregroundStyle(.black.opacity(0.5))
            
            Spacer()
            
            
            
            CUSTOMSNBUTTON(Colors: .black, title:   count == 2 ? "Go to Login" :"Next", isloading:  $isloading , action: {
                print("acout")
                if  count > 1  {
                    
         
                    
                    showDetail.toggle()
                    print("123123")
                    count = 0
                }
                else {
                    count += 1
                }
            
            }
                 
                           
            )
            .fullScreenCover(isPresented: $showDetail) {
                Login()
                
                }
            .transaction { transaction in
                transaction.disablesAnimations = true
            }
                     
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        
        
        
    }
}

#Preview {
    SplashScreen()
}

//
//  CUSTOMSNBUTTON.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 05/12/2024.
//

import SwiftUI

struct CUSTOMSNBUTTON: View {
    var Colors : Color
    var title: String
    @State private var progress: CGFloat = 0.0 // Tracking progress (optional)
        
    @Binding var isloading: Bool
    var action :() ->()
    
    var body: some View {
        
        Button( action: action){
            
            Group {
                if isloading {
                    
                    ProgressView( value: progress, total: 1.0)
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                 .scaleEffect(1) // Adjust size of the progress bar
                                 
                } else {
                    Text(title)
                        .foregroundColor(.white) // Set the text color
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
            
            
        }
        .frame(maxWidth: .infinity , maxHeight: 50)
        
        .background(Colors)
        .cornerRadius(24)
        .padding()
      
    }
        
}






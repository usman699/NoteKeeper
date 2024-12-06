//
//  CUSTOMSNBUTTON.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 05/12/2024.
//

import SwiftUI

struct CUSTOMSNBUTTON: View {
    var title: String
    var action :() ->()
    var body: some View {
        
     
            Button( action: action){
                
                Text(title)
                    .foregroundStyle(.white)
                    .frame(height: 70)
                    .frame(maxWidth: .infinity )
                
            }
           
          
            .background(.black)
            .cornerRadius(18)
            .padding()
    }
}


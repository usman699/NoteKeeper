//
//  add.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 18/12/2024.
//

import SwiftUI

struct add: View {
    @State var lasttext: String =  "Type something..."
    @State var firstText: String =  "Type something..."
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            NavigationStack{
                
                VStack{
                    HStack{
                        Text("Add Title")
                            .font(.system(size: 23))
                            .padding()
                        Spacer()
                    }
                    
                    TextEditor(text: $firstText)
                        .padding()
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(height: 100)
                    
                    
                    HStack{
                        Text("Add Content")
                            .font(.system(size: 23))
                            .padding()
                        Spacer()
                    }
                    
                    TextEditor(text: $lasttext)
                        .padding()
                        .font(.title)
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity , maxHeight: .infinity , alignment: .topLeading)
            }
            .navigationTitle("Note Keeping")
            .toolbarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Trash button was tapped")
                    }) {
                        Image(systemName: "plus.circle")
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                            .padding(.trailing, -14)
                    }
                    Button(action: {
                        print("Plus button was tapped")
                    }) {
                        Image(systemName: "trash.circle")
                            .foregroundColor(.black)
                            .background(Color.white)
                            .clipShape(Circle())
                        // Add some padding for spacing
                    }
                }
            }
        }
        
        }
    }

#Preview {
    add()
}

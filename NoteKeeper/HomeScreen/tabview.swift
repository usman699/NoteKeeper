//
//  HomeScreen.swift
//  NoteKeeper
//
//  Created by Spark Solutionz Inc on 12/12/2024.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        VStack {
              
            TabView {
                        VStack {
                            Text("Home View")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .background(Color.blue)
                        }
                        .tabItem {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                        .tag(0)

                        VStack {
                            Text("Search View")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .background(Color.gray)
                        }
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                        .tag(1)

                      
                    }
            
            
            
        }
        
    }
}

#Preview {
    HomeScreen()
}

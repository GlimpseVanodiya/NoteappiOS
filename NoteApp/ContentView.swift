//
//  ContentView.swift
//  NoteApp
//
//  Created by Zalak Vanodiya on 2022-04-11.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isUserCurrentlyLoggedOut: Bool = false
    
    var body: some View {
        
        NavigationView{
            if self.isUserCurrentlyLoggedOut {
                Home(isUserCurentlyLoggedOut: $isUserCurrentlyLoggedOut)
            } else {
                LoginRegister(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

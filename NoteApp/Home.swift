//
//  Home.swift
//  NoteApp
//
//  Created by Zalak Vanodiya on 2022-04-12.
//

import SwiftUI
import Firebase

struct Home: View {
    
    @StateObject var notes = Notes()
    @State var shouldShowLogOutOprions = false
    @Binding var isUserCurentlyLoggedOut : Bool
    @State private var sheetIsShowing = false
    
    var body: some View {
        
        ZStack(){
                
                NavigationView{
                    VStack{
                        NoteView()
                            .sheet(isPresented: $sheetIsShowing){
                                AddNew()
                            }
                        
                        HStack{
                            Spacer()
                            customNavBar
                        }
                    }
                    .navigationTitle("Notes")
                    .toolbar{
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                withAnimation{
                                    self.sheetIsShowing.toggle()
                                }
                            }label: {
                                Label("Add Note", systemImage: "plus.circle.fill")
                                
                            }
                        }
                    }
                }
                .environmentObject(notes)
        }
    }
    private var customNavBar: some View {
        HStack{
            Spacer()
            Button{
                shouldShowLogOutOprions.toggle()
               
            } label: {
                Spacer()
                Image(systemName: "gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
                
            }
        }.padding()
            .actionSheet(isPresented: $shouldShowLogOutOprions) {
                .init(title: Text("Settings"), message: Text("Want to Logout?"), buttons: [.destructive(Text("Sign Out"), action: {
                    print("handle sign out")
                    try? Auth.auth().signOut()
                    self.isUserCurentlyLoggedOut = false
                    
                }),
                .cancel()])
            }
    }
}



struct Home_Previews: PreviewProvider {
    @State static var isUserCurentlyLoggedOut = false
    static var previews: some View {
        Home(isUserCurentlyLoggedOut: $isUserCurentlyLoggedOut)
    }
}





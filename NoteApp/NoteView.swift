//
//  NoteView.swift
//  NoteApp
//
//  Created by Zalak Vanodiya on 2022-04-13.
//

import SwiftUI

struct NoteView: View {
    
    @EnvironmentObject var notes: Notes
    
    var body: some View {
        List{
            ForEach(notes.notes){ note in
                VStack (alignment: .leading){
                    Text(note.title)
                        .foregroundColor(.blue)
                        .font(.headline)
                    
                    VStack{
                        Text(note.content)
                            .font(.body)
                            .padding(.vertical)
                        
                        HStack{
                            Spacer()
                            Text("\(note.timeStamps)")
                                .foregroundColor(.gray)
                                .italic()
                        }
                    }
                }
            }
            .onDelete(perform: deleteNote)
        }
    }
    func deleteNote(at offsets: IndexSet){
        notes.notes.remove(atOffsets: offsets)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
            .environmentObject(Notes())
    }
}

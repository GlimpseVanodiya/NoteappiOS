//
//  NotesData.swift
//  NoteApp
//
//  Created by Zalak Vanodiya on 2022-04-13.
//

import SwiftUI
import Foundation

struct Note: Codable, Identifiable {
    var id = UUID()
    var title : String
    var content: String
    var timeStamps: String
}

@MainActor class Notes: ObservableObject{
    private let NOTES_KEY = "zalaknoteskeyEdnalan"
    let date = Date()
    
    var notes: [Note]{
        didSet{
            saveData()
            objectWillChange.send()
        }
    }
    
    init(){
        //Load saved data
        if let data = UserDefaults.standard.data(forKey: NOTES_KEY){
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data){
                notes = decodedNotes
                return
            }
        }
        //Note
        notes = [Note(title: "Test Note", content: "Tap add button", timeStamps: date.getFormattedDate(formate: "yyyy-MM-dd HH:mm:ss"))]
    }
    
    
    func addNote(title: String, content: String) {
        let tempNote = Note(title: title, content: content, timeStamps: date.getFormattedDate(formate: "yyyy-MM-dd HH:mm:ss"))
        notes.insert(tempNote, at: 0)
        saveData()
    }
    
    //Save Note
    private func saveData(){
        if let encodedNotes = try? JSONEncoder().encode(notes){
            UserDefaults.standard.set(encodedNotes, forKey: NOTES_KEY)
        }
    }
}

extension Date {
    func getFormattedDate(formate: String) -> String{
        let dateformat = DateFormatter()
        dateformat.dateFormat = formate
        return dateformat.string(from: self)
    }
}

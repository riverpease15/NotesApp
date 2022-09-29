//
//  Notes.swift
//  Notes App
//
//  Created by River Pease on 9/28/22.
//

import SwiftUI

struct Note: Identifiable, Codable {
    
    var id = UUID()
    var noteContent: String
    
}

class NoteList: Identifiable, ObservableObject {
    
    @Published var notes: [Note]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "SavedNotes") {
            if let decoded = try? JSONDecoder().decode([Note].self, from: data) {
                self.notes = decoded
                return
            }
        }
        self.notes = []
    }
    
    func save() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(self.notes) {
            UserDefaults.standard.set(encoded, forKey: "SavedNotes")
        }
    }
    
    func addNote(note: Note) {
        self.notes.insert(note, at: 0)
        self.save()
    }
    
    func deleteNotes() {
        self.notes = []
    }
    
}

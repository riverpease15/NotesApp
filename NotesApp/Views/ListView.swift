//
//  ListView.swift
//  NotesApp
//
//  Created by River Pease on 9/29/22.
//

import SwiftUI

struct ListView: View {
    var note: Note
    
    var body: some View {
        Text("\(note.noteContent)")
            .foregroundColor(Color.white)
            .multilineTextAlignment(.center)
            .padding(.all, 15.0)
            .frame(width: 300.0)
            .background(Color.yellow)
            .cornerRadius(30)
            
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(note: Note(noteContent: "Test Note"))
    }
}

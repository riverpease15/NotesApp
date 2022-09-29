//
//  ContentView.swift
// Notes App
//
//  Created by River Pease on 9/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var noteList = NoteList()
    @State var noteContent: String = ""
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(noteList.notes) { note in ListView(note: note)
                        .listRowSeparator(.hidden)
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("Notes")
        }
        
        VStack {
            HStack {
                TextField("Note", text: $noteContent)
                    .padding([.top, .leading, .bottom], 25.0)
                    .background(Color.yellow)
                    .frame(width: 300, height: 80)
                    .foregroundColor(.white)
                Button(action : {
                    let note = Note(noteContent: noteContent)
                    noteList.addNote(note: note)
                    noteContent = ""
                }, label: {
                    Text("+")
                        .foregroundColor(.white)
                        .frame(width: 50, height: 50)
                        .background(Color.yellow)
                        .cornerRadius(40)
                        .font(.system(size: 40))
                        .overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.yellow, lineWidth: 0))
                })
                
            }
            .padding([.leading, .trailing], 30.0)
            .background(Color.white)
            
            Button(action : {
                noteList.deleteNotes()
            }, label: {
                Text("Clear")
                    .foregroundColor(.white)
                    .frame(width: 100, height: 50)
                    .background(Color.yellow)
                    .cornerRadius(40)
                    .font(.system(size: 20))
                    .overlay(RoundedRectangle(cornerRadius: 40)
                        .stroke(Color.yellow, lineWidth: 0))
            })
            
        }

    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

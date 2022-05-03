// MARK: - LIBRARIES
import SwiftUI



struct ContentView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    @AppStorage("lineCount") var lineCount = 1
    @State private var notes = Array<Note>.init()
    @State private var text: String = ""
    
    
    
    // MARK: - PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        VStack {
            HStack {
                TextField("Text...", text: $text)
                Button {
                    guard text.isEmpty == false
                    else { return }
                    let newNote = Note.init(id: UUID.init(),
                                            text: text)
                    notes.append(newNote)
                    text = ""
                    save()
                } label: {
                    Image(systemName: "plus")
                        .padding()
                }
            }
            // .fixedSize()
            // .buttonStyle(.borderedProminent)
            .buttonStyle(BorderedButtonStyle(tint: .blue))
            List {
                ForEach(0..<notes.count, id: \.self) { (eachIndexNumber: Int) in
                    
                    NavigationLink(destination: {
                        DetailView(index: eachIndexNumber,
                                   note: notes[eachIndexNumber],
                                   total: notes.count)
                    }, label: {
                        Text("\(notes[eachIndexNumber].text)")
                            .lineLimit(lineCount)
                    })
                }
                .onDelete(perform: delete)
                Button("Add Linecount: \(lineCount)",
                       action: {
                    lineCount += 1
                    if lineCount == 4 {
                        lineCount = 1
                    }
                })
            }
        }
        .navigationTitle("NoteDictate")
        /// Call the `load() `method when our view appears:
        .onAppear(perform: load)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func delete(at offsetts: IndexSet)
    -> Void {
        
        withAnimation {
            notes.remove(atOffsets: offsetts)
        }
        
        save()
    }
    
    /// Run the `getDocumentsDirectory()`method
    /// to ask for the app’s documents directory.
    func getDocumentsDirectory()
    -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        return paths[0]
    }
    
    /// Run the `save()` method
    /// every time a note is added or removed.
    func save()
    -> Void {
        
        do {
            let data = try JSONEncoder().encode(notes)
            let url = getDocumentsDirectory().appendingPathComponent("notes")
            try data.write(to: url)
        } catch {
            print("Save failed")
        }
    }
    
    /// A method for loading data back from disk:
    func load()
    -> Void {
        /// Rather than changing our notes property immediately,
        /// we need to wait a tiny, tiny amount of time
        /// — just enough so that SwiftUI has finished loading its initial user interface before we try to change it.
        /// This can be doing with a specific method call: `DispatchQueue.main.async()`:
        DispatchQueue.main.async {
            do {
                let url = getDocumentsDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self,
                                                 from: data)
            } catch {
                // do nothing
            }
        }
    }
    
    
    
    // MARK: - HELPER METHODS
}






// PREVIEWS ///////////////////////////////////
struct ContentView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        ContentView()
    }
}

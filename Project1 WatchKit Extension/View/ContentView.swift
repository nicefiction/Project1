// MARK: - LIBRARIES
import SwiftUI



struct ContentView: View {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
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
                            .lineLimit(1)
                    })
                }
                .onDelete(perform: delete)
            }
        }
        .navigationTitle("NoteDictate")
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - INITIALIZERS
    // MARK: - METHODS
    func delete(at offsetts: IndexSet)
    -> Void {
        
        withAnimation {
            notes.remove(atOffsets: offsetts)
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

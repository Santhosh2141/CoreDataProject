//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 07/09/25.
//

import SwiftUI

struct Student: Hashable{
    var name: String
}
struct ContentView: View {
    
    // Saving hashvalues will be a problem. cuz when we close and open again hashvalue might be changed and will cause problems
    @State private var students = [Student(name: "Harry Potter"), Student(name: "Hermoine Granger"), Student(name: "Ron Weasley")]
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List{
                // .self means we use the whole object as the keyPath
                ForEach([2,4,6,8,10], id: \.self){
                    Text("\($0)")
                }
            }
            // id self will work ww Hashable data only. string ints are hashable by default
            List(students, id: \.self){ student in
                Text(student.name)
            }
            
            List(wizards, id: \.self){ wizard in
                Text(wizard.name ?? "No Name")
            }
            HStack{
                Button("Add Wizard"){
                    let wizard = Wizard(context: moc)
                    wizard.name = "Harry Potter"
                    
                }
                Spacer()
                Button("Save"){
                    // always while saving we have to check if changes are mafe and then save. this is safer.
                    
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
                    }
    //                if moc.hasChanges{
    //                    try? moc.save()
    //                }
                    
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

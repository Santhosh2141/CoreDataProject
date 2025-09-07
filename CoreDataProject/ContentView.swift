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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

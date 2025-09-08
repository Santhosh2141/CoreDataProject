//
//  DynamicFilteringView.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//

import CoreData
import SwiftUI

enum Predicate: String, CaseIterable, CustomStringConvertible {
    case beginsWith = "BEGINSWITH"
    case contains = "CONTAINS"
    case containsCI = "CONTAINS[c]"
    
    var description: String { rawValue }
}

struct DynamicFilteringView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    // we cant use @FetchRequests as we have to update it based on another value. Based on the changed state value. this will affect the fetch req value outside. so we have to initialise it inside the view. so we create a new view
//    private var stringParameter = "BEGINSWITH"
    @State private var chooseParameter = Predicate.beginsWith
    var body: some View {
        VStack{
            Form{
                // .allcases makes it an array of all cases so that we can iterate
                Picker("Choose an Option to Filter", selection: $chooseParameter) {
                    ForEach(Predicate.allCases, id: \.self) { type in
                        Text(type.description)
                    }
                }
            }
            FilteredList(stringParameter: chooseParameter.rawValue,sort: [SortDescriptor<Singer>(\.firstName)],filterKey: "lastName", filterValue: lastNameFilter){ (singer: Singer) in
                // this is an NSManagedObject and not a singer object. so we tell that its a singer class
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Example"){
                let taylor =  Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed =  Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele =  Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Atkins"
                
                try? moc.save()
            }
            
            Button("Show A"){
                lastNameFilter = "A"
            }
            
            Button("Show S"){
                lastNameFilter = "S"
            }
        }
    }
}

struct DynamicFilteringView_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFilteringView()
    }
}

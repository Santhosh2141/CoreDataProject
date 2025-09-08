//
//  DynamicFilteringView.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//

import CoreData
import SwiftUI

struct DynamicFilteringView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    // we cant use @FetchRequests as we have to update it based on another value. Based on the changed state value. this will affect the fetch req value outside. so we have to initialise it inside the view. so we create a new view
    var body: some View {
        VStack{
            FilteredList(filter: lastNameFilter)
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

//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest(sortDescriptors: []) var fetchRequest: FetchedResults<T>
    // gimme a content closure that accepts a T and returns a contentView
    let content: (T) -> Content
//    let stringParameter = "BEGINSWITH"
    var body: some View {
        List(fetchRequest, id: \.self){ item in
//            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            self.content(item)
        }
    }
    
    init(stringParameter: String, sort: [SortDescriptor<T>], filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        // this _fetchRequest means, we are not writing it to the fetchedResults. we are writing it to a completely new fetchRequest object
        // using %@ adds a single qoute. but the var name shouldnt be in quote. so we use %k
        _fetchRequest = FetchRequest<T>(sortDescriptors: sort, predicate: NSPredicate(format: "%K \(stringParameter) %@", filterKey, filterValue))
        // this is a nonescaping parameter for later on use. so we use it as escaping so that it can be used later on
        self.content = content
    }
}

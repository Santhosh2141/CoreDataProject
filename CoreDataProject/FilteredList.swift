//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//

import SwiftUI

struct FilteredList: View {
    
    @FetchRequest(sortDescriptors: []) var fetchRequest: FetchedResults<Singer>
                                            
    var body: some View {
        List(fetchRequest){ singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
    
    init(filter: String) {
        // this _fetchRequest means, we are not writing it to the fetchedResults. we are writing it to a completely new fetchRequest object
        _fetchRequest = FetchRequest<Singer>(sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
}

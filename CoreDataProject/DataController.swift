//
//  DataController.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 07/09/25.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error{
                print("There was an error in CoreData \(error.localizedDescription)")
                return
            }
            
            // this will merge multiple properties into 1. to handle duplicate data.
            self.container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
        }
    }
}

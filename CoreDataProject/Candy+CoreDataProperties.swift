//
//  Candy+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//
//

import Foundation
import CoreData


extension Candy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Candy> {
        return NSFetchRequest<Candy>(entityName: "Candy")
    }

    @NSManaged public var name: String?
    @NSManaged public var origin: Country?

    public var wrappedName: String{
        name ?? "Unkown Name"
    }
}

extension Candy : Identifiable {

}

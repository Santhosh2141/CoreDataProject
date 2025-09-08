//
//  Country+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var fullName: String?
    @NSManaged public var shortName: String?
    @NSManaged public var candy: NSSet?
//  to get value useful we have to convert this to a Set of candies from NSSet and then into an array so that foreach can go through the array and sort it into a sensible order
    public var wrappedShortName: String {
        shortName ?? "Unkown Country"
    }
    public var wrappedFullName: String {
        fullName ?? "Unkown Country"
    }
    
    public var candyArray: [Candy]{
        let set = candy as? Set<Candy> ?? [] // this says NSSet is a set of candy.
        
        return set.sorted{
            // normal sorting small to big
            $0.wrappedName < $1.wrappedName
        }
    }
}

// MARK: Generated accessors for candy
extension Country {

    @objc(addCandyObject:)
    @NSManaged public func addToCandy(_ value: Candy)

    @objc(removeCandyObject:)
    @NSManaged public func removeFromCandy(_ value: Candy)

    @objc(addCandy:)
    @NSManaged public func addToCandy(_ values: NSSet)

    @objc(removeCandy:)
    @NSManaged public func removeFromCandy(_ values: NSSet)

}

extension Country : Identifiable {

}

////
////  Movie+CoreDataProperties.swift
////  CoreDataProject
////
////  Created by Santhosh Srinivas on 07/09/25.
////
////
//
//import Foundation
//import CoreData
//
//
//extension Movie {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
//        return NSFetchRequest<Movie>(entityName: "Movie")
//    }
//
//    // year by deault will have a value. string wont.
//    // we are creating an NSMAA+NAGED subclass by changing CodGen to Manual in View-Inspectors for Movie. and Editor-create ns subclass
//    
//    // we can remove the optional. but... there will be a problem while loading the data. NSManaged what is does is lazy load the data ie on demand. and at that time if data is not present it causes problems
//    
//    // so we creat computed properties.
//    @NSManaged public var title: String?
//    @NSManaged public var director: String?
//    @NSManaged public var year: Int16
//
//    // we can use this title instead of using title
//    public var wrappedTitle: String{
//        title ?? "Unknown Title"
//    }
//}
//
//extension Movie : Identifiable {
//
//}

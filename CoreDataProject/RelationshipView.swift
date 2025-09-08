//
//  RelationshipView.swift
//  CoreDataProject
//
//  Created by Santhosh Srinivas on 08/09/25.
//
import CoreData
import SwiftUI

struct RelationshipView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<Country>
    var body: some View {
        VStack{
            List{
                ForEach(countries, id: \.self){ country in
                    Section(country.wrappedFullName){
                        ForEach(country.candyArray, id: \.self){ candy in
                            Text(candy.wrappedName)
                        }
                    }
                }
            }
            Button("Add Examples"){
                // though there are many UKs, we use shortName as the contraint which mis unique so only one UK is created.
                let candy1 = Candy(context: moc)
                candy1.name = "Mars"
                candy1.origin = Country(context: moc)
                candy1.origin?.shortName = "UK"
                candy1.origin?.fullName = "United Kingdom"
                let candy2 = Candy(context: moc)
                candy2.name = "KitKat"
                candy2.origin = Country(context: moc)
                candy2.origin?.shortName = "UK"
                candy2.origin?.fullName = "United Kingdom"
                let candy3 = Candy(context: moc)
                candy3.name = "Toblerone"
                candy3.origin = Country(context: moc)
                candy3.origin?.shortName = "ZH"
                candy3.origin?.fullName = "Switzerland"
                let candy4 = Candy(context: moc)
                candy4.name = "Twix"
                candy4.origin = Country(context: moc)
                candy4.origin?.shortName = "UK"
                candy4.origin?.fullName = "United Kingdom"
                
                try? moc.save()
            }
        }
    }
}

struct RelationshipView_Previews: PreviewProvider {
    static var previews: some View {
        RelationshipView()
    }
}

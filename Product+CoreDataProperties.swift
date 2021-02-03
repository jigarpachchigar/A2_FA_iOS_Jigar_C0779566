//
//  Product+CoreDataProperties.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 03/02/21.
//
//


import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var pdesc: String?
    @NSManaged public var pid: String?
    @NSManaged public var pname: String?
    @NSManaged public var pprice: Float
    @NSManaged public var providerName: String?

}

extension Product : Identifiable {

}

//
//  Product+CoreDataClass.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 03/02/21.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {

}

class ProductData: NSManagedObject, Identifiable {
    var pdesc: String?
    var pid: String?
    var pname: String?
    var pprice: Float?
    var providerName: String?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductData> {
        return NSFetchRequest<ProductData>(entityName: "Product")
    }

}

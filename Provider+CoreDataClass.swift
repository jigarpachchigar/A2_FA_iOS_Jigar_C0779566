//
//  Provider+CoreDataClass.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 03/02/21.
//
//

import Foundation
import CoreData

@objc(Provider)
public class Provider: NSManagedObject {

}

class ProviderData: NSManagedObject, Identifiable {
    var proname: String?
    var count: Int?

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProviderData> {
        return NSFetchRequest<ProviderData>(entityName: "Product")
    }

}

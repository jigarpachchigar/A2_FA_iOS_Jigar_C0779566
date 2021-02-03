//
//  ProdDisplayControllerViewController.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 30/01/21.
//

import UIKit
import CoreData

class ProdDisplayViewController: UIViewController {
    
    weak var product: ProductData!
    var isNew = false
    
    //MARK: - Outlets
    
    @IBOutlet weak var tfprdpid: UITextField!
    
    @IBOutlet weak var tfprdname: UITextField!
    
    @IBOutlet weak var tfprdprice: UITextField!
    
    @IBOutlet weak var tfprdpro: UITextField!
    
    @IBOutlet weak var tvpdesc: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        if !isNew {
            tfprdpid.isEnabled = false
            tfprdpid.text = product.pid
            tfprdname.text = product.pname
            tvpdesc.text = product.pdesc
            tfprdprice.text = String(format:"%.2f",product.pprice!)
            tfprdpro.text = product.providerName ?? ""
        }
    }
    
    @IBAction func btnAddClicked(_ sender: Any) {
        if tfprdpid.text == "" {
            return
        }
        if tfprdname.text == "" {
            return
        }
        if tvpdesc.text == "" {
            return
        }
        if tfprdpro.text == "" {
            return
        }
        if tfprdprice.text == "" {
            return
        }
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        //2
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Product")
        
        //3
        do {
            let prodListData = try managedContext.fetch(fetchRequest)
            
//            let idsList = prodListData.map { (obj) in
//                obj.value(forKeyPath: "pid") as? String
//            }
            
//            if idsList.contains(tfprdpid.text) {
//                CommonMethods.showToast(message: "id is already available", vc: self)
//                return
//            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }

        let product = ProductData()
        product.pid = tfprdpid.text
        product.pname = tfprdname.text
        product.pprice = (tfprdprice.text! as NSString).floatValue
        product.pdesc = tvpdesc.text
        product.providerName = tfprdpro.text

        save(product: product)
    }
    
    func save(product: ProductData) {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Product", in: managedContext)!
        
        let person = NSManagedObject(entity: entity, insertInto: managedContext)
        
        // 3
        person.setValue(product.pid, forKeyPath: "pid")
        person.setValue(product.pname, forKeyPath: "pname")
        person.setValue(product.pdesc, forKeyPath: "pdesc")
        person.setValue(product.pprice, forKeyPath: "pprice")
        person.setValue(product.providerName, forKeyPath: "providerName")
        
        // 4
        do {
            try managedContext.save()
            self.navigationController?.popViewController(animated: true)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    
    func delete(product: ProductData) {
        
        guard let appDelegate =
                UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        // 1
        let managedContext = appDelegate.persistentContainer.viewContext
        
        // 2
        let entity = NSEntityDescription.entity(forEntityName: "Product", in: managedContext)!
        
       // let person = NSManagedObject(entity: entity, insertInto: managedContext)
    
   //     managedContext.delete(product)

    }

}

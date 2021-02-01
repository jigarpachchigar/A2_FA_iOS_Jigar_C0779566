//
//  ProdDisplayControllerViewController.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 30/01/21.
//

import UIKit

class ProdDisplayViewController: UIViewController {
    
    weak var product: Product!

    
    //MARK: - Outlets
    
    @IBOutlet weak var tfprdpid: UITextField!
    
    @IBOutlet weak var tfprdname: UITextField!
    
    @IBOutlet weak var tfprdprice: UITextField!
    
    @IBOutlet weak var tfprdpro: UITextField!
    
    @IBOutlet weak var tvpdesc: UITextView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        tfprdpid.text = String(format:"%d",product.pid)
        tfprdname.text = product.pname
        tvpdesc.text = product.pdesc
        tfprdprice.text = String(format:"CAD %.2f",product.pprice)
        tfprdpro.text = product.provider?.proname ?? ""
    }
}

//
//  ProdTableViewCell.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 31/01/21.
//

import UIKit

class ProdTableViewCell: UITableViewCell {

   
    @IBOutlet var prodname: UILabel!
    
    @IBOutlet var prodproname: UILabel!
    
    
    func prodcell(_ product: ProductData){
        txtLeading.constant = 8
        imgLeading.isHidden = true

        prodname.text = product.pname
        prodproname.text = product.providerName ?? ""
    }
    
    @IBOutlet var txtLeading: NSLayoutConstraint!
    
    @IBOutlet var imgLeading: UIImageView!
    func setProvider(provider: ProviderData) {
        txtLeading.constant = 56
        imgLeading.isHidden = false
        
        prodname.text = provider.proname
        prodproname.text = "\(provider.count ?? 0)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

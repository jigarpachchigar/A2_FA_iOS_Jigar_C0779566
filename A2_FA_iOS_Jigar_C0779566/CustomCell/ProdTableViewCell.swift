//
//  ProdTableViewCell.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 31/01/21.
//

import UIKit

class ProdTableViewCell: UITableViewCell {

   
    @IBOutlet weak var prodname: UILabel!
    
    @IBOutlet weak var prodproname: UILabel!
    
    
    func prodcell(_ product: Product){
        prodname.text = product.pname
        prodproname.text = product.provider?.proname ?? ""
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

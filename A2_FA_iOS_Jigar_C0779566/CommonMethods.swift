//
//  CommonMethods.swift
//  A2_FA_iOS_Jigar_C0779566
//
//  Created by Jigar Pachchigar on 30/01/21.
//

import Foundation
import UIKit
class CommonMethods: NSObject {
    //MARK:-Show Toast
        
    class func showToast(message : String, color:UIColor = UIColor.black, vc: UIViewController) {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width

        let toastLabel = UILabel(frame: CGRect(x: 0, y: 44, width: screenWidth, height: 44))
        toastLabel.backgroundColor = color
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastLabel.sizeToFit()
        
        toastLabel.center = vc.view.center
        toastLabel.frame = CGRect(x: 0, y: 44, width: screenWidth, height: toastLabel.frame.size.height + 30)
        
        let rectShape = CAShapeLayer()
        rectShape.bounds = toastLabel.frame
        rectShape.position = toastLabel.center
        rectShape.path = UIBezierPath(roundedRect: toastLabel.bounds, byRoundingCorners: [.bottomLeft , .bottomRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        toastLabel.layer.mask = rectShape

        
        vc.view.addSubview(toastLabel)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .transitionCurlDown, animations: {
            toastLabel.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .transitionCurlUp, animations: {
                toastLabel.alpha = 0.0
            }, completion: {_ in
                toastLabel.removeFromSuperview()
            })
        })
    }

}

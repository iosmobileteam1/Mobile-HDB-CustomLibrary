//
//  File.swift
//  
//
//  Created by hdbisg on 10/5/23.
//

import Foundation
import UIKit



extension UIViewController {
    
    
   
    
    public func bottomMenu(title: String?,
                          message: String?,
                          actionTitles: [String?],
                          style: [UIAlertAction.Style],
                          actions: [((UIAlertAction) -> Void)?],
                          preferredActionIndex: Int? = nil) {
    
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        

        // for Change title colour
//        let myString  = "Alert Title"
//        var myMutableString = NSMutableAttributedString()
//        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName:UIFont(name: "Georgia", size: 18.0)!])
//        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:0,length:myString.characters.count))
//        alertController.setValue(myMutableString, forKey: "attributedTitle")

        
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: style[index], handler: actions[index])
            alert.addAction(action)
        }
        
        
        
        if let preferredActionIndex = preferredActionIndex { alert.preferredAction = alert.actions[preferredActionIndex] }
        self.present(alert, animated: true, completion: nil)
        
        
    
        
        
    }
    
    
}



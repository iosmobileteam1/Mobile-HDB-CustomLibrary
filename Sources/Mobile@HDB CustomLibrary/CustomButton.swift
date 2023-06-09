//
//  File.swift
//  
//
//  Created by hdbisg on 30/3/23.
//

import Foundation
import UIKit

public class CustomButton: UIButton {

   override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

  required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

   func setupButton() {

        setTitleColor(.white, for: .normal)

       backgroundColor      = BtnPositive().backgroundColor
     titleLabel?.font     = BtnPositive().font
     layer.cornerRadius   = 30
     translatesAutoresizingMaskIntoConstraints = false
     heightAnchor.constraint(equalToConstant: 64).isActive = true
     widthAnchor.constraint(equalToConstant: 345).isActive = true

    }

   struct BtnPositive {
        let font = UIScreen.main.bounds.height == 568 ?
                   UIFont.systemFont(ofSize: UIScreen.main.bounds.height / 40) :
                   UIFont.systemFont(ofSize: 16)
        let textColor = UIColor.white
        let backgroundColor = UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1)
    }
}

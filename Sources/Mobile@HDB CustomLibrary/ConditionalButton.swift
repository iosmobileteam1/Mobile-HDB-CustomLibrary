//
//  ConditionalButton.swift
//  
//
//  Created by hdbisg on 10/5/23.
//

import UIKit

public class ConditionalButton: UIView {

    let checkedImage = UIImage()
    let uncheckedImage = UIImage()
    
   public var termsLabel = UILabel()
   public var checkBox = UIButton()
   public var continueButton = UIButton()
    
    
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)

     
       addSubview(checkBox)
       addSubview(continueButton)
        addSubview(termsLabel)
        
        
        setupButtons()
     
        
        checkBox.addTarget(self, action:#selector(checkBoxButtonClicked(sender:)), for: .touchUpInside)
        
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
     

    
    
    
    public func setupButtons() {
        
        
        //backgroundColor = UIColor.red
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.heightAnchor.constraint(equalToConstant: 40).isActive = true
        checkBox.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        checkBox.setImage(uncheckedImage.packagedImage(withName: "round_uncheck"), for: UIControl.State.normal)
        checkBox.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10).isActive = true
        checkBox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        
        
        continueButton.titleLabel?.font     = UIScreen.main.bounds.height == 568 ? UIFont.systemFont(ofSize: UIScreen.main.bounds.height / 40) : UIFont.systemFont(ofSize: 16)
        continueButton.layer.cornerRadius   = 30
        
        continueButton.setTitleColor(UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1), for: .normal)
        continueButton.backgroundColor = .white
        continueButton.layer.borderWidth = 1.0
        continueButton.layer.borderColor = UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1).cgColor
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        continueButton.widthAnchor.constraint(equalToConstant: 345).isActive = true
        continueButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 0).isActive = true
        continueButton.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        continueButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        

        
        
        termsLabel.translatesAutoresizingMaskIntoConstraints=false
        termsLabel.text = "You read and acknowledge the Terms of Use"
        termsLabel.textColor = .black
        termsLabel.textAlignment = .center
        termsLabel.numberOfLines = 2
        termsLabel.font = UIFont.systemFont(ofSize: 15)
        termsLabel.leftAnchor.constraint(equalTo: checkBox.rightAnchor, constant: 10).isActive = true
        termsLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        termsLabel.bottomAnchor.constraint(equalTo: continueButton.topAnchor, constant: -10).isActive = true
        termsLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
       
    }

    
    
    @objc public func checkBoxButtonClicked(sender: UIButton) {

        
        checkBox.isSelected = !checkBox.isSelected
        
        if checkBox.isSelected == true  {
        
            checkBox.setImage(checkedImage.customImage(withName: "round_checked"), for: UIControl.State.normal)
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.backgroundColor = UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1)
       
        
        
        } else {
        
            checkBox.setImage(uncheckedImage.customImage(withName: "round_uncheck"), for: UIControl.State.normal)
        continueButton.setTitleColor(UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1), for: .normal)
        continueButton.backgroundColor = .white
        continueButton.layer.borderWidth = 1.0
        continueButton.layer.borderColor = UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1).cgColor
        
    }
        
    }
    
    
}

 
public extension UIImage {
    func customImage(withName name: String) -> UIImage? {
        guard let result = UIImage(named: "\(name).png", in: Bundle.module, compatibleWith: nil) else {
            return nil
        }
        
        return result
    }
    
}


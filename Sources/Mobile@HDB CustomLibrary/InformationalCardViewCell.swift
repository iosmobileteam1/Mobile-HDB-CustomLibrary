//
//  InformationalCardViewCell.swift
//  
//
//  Created by hdbisg on 26/4/23.
//

import UIKit

public struct informationalCardData {
        var firstLabel: String
        var secondLabel: String
        var mainImage: UIImage
        
       public init(firstLabel: String, secondLabel: String, mainImage: UIImage) {
            self.firstLabel = firstLabel
            self.secondLabel = secondLabel
            self.mainImage = mainImage
        }
        
    }


public class InformationalCardViewCell: UITableViewCell {
        
        
        let rightArrow = UIImageView()
        
        let bgView = UIView()

      
        public  var mainData: informationalCardData? {
              didSet {
                  guard let data = mainData else { return }
                  icon.image = data.mainImage
                  firstLabel.text = data.firstLabel
                  secondLabel.text = data.secondLabel
              }
          }
          
          public let icon: UIImageView = {
             let mainIcon = UIImageView()
         
              return mainIcon
          }()
          
        public let firstLabel: UILabel = {
              
              let titleLable = UILabel()
     
             return titleLable
              
          }()
          
          public let secondLabel: UILabel = {
                
                let detaillabel = UILabel()
          
               return detaillabel
                
            }()
        

        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
              super.init(style: style, reuseIdentifier: reuseIdentifier)

            
            let marginGuide = contentView.layoutMarginsGuide
            contentView.addSubview(bgView)
            bgView.setViewConstraints(top: marginGuide.topAnchor, left: marginGuide.leadingAnchor, right: marginGuide.trailingAnchor, bottom: marginGuide.bottomAnchor,padding: UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5))
            bgView.backgroundColor = UIColor.white
                   
                   
            bgView.addSubview(icon)
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: 5).isActive = true
                        //  img.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
            icon.centerYAnchor.constraint(equalTo: bgView.centerYAnchor).isActive = true
            icon.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width == 320 ? 40 : 60).isActive = true
            icon.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width == 320 ? 40 : 60).isActive = true

            bgView.addSubview(rightArrow)
            rightArrow.setViewConstraints(top: nil, left: nil, right: bgView.trailingAnchor, bottom: nil, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -10),size: CGSize(width: 15, height: 15))
            rightArrow.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
            rightArrow.image = UIImage(named: "Arrow-right")

            // configure titleLabel
            bgView.addSubview(firstLabel)
            firstLabel.translatesAutoresizingMaskIntoConstraints = false
            firstLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10).isActive = true
            firstLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 20).isActive = true
            firstLabel.trailingAnchor.constraint(equalTo: rightArrow.leadingAnchor).isActive = true
            firstLabel.numberOfLines = 0
            firstLabel.font = UIFont.systemFont(ofSize: 20)

            // configure authorLabel
            contentView.addSubview(secondLabel)
            secondLabel.translatesAutoresizingMaskIntoConstraints = false
            secondLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10).isActive = true
            secondLabel.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -20).isActive = true
            secondLabel.trailingAnchor.constraint(equalTo: rightArrow.leadingAnchor).isActive = true
            secondLabel.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 5).isActive = true
            secondLabel.numberOfLines = 0
            secondLabel.font = UIFont.systemFont(ofSize: 15)
            secondLabel.textColor = UIColor.gray


        }
        
       public required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
        }
        
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            
          
            bgView.layer.cornerRadius = 10
            
            bgView.layer.masksToBounds = false
            bgView.layer.shadowOffset = CGSize(width: 0, height: 0)
            bgView.layer.shadowColor = UIColor.black.cgColor
            bgView.layer.shadowOpacity = 0.23
            bgView.layer.shadowRadius = 4
            selectionStyle = .none
            
            
          
        }
        

    }
    extension UIView
    {
        func setViewConstraints(top:NSLayoutYAxisAnchor?,left:NSLayoutXAxisAnchor?,right:NSLayoutXAxisAnchor?,bottom:NSLayoutYAxisAnchor?, padding:UIEdgeInsets = .zero,size:CGSize = .zero ) -> Void {
            
            self.translatesAutoresizingMaskIntoConstraints = false
            
            
            if let top = top
            {
                topAnchor.constraint(equalTo: top, constant: padding.top).isActive=true
            }
            
            if let bottom = bottom
            {
                bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive=true
            }
            if let left = left
            {
                leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive=true
            }
            if let right = right
            {
                trailingAnchor.constraint(equalTo: right, constant: padding.right).isActive=true
            }
            
            if size.width>0 {
                widthAnchor.constraint(equalToConstant: size.width).isActive=true
            }
            
            if size.height>0
            {
                heightAnchor.constraint(equalToConstant: size.height).isActive=true
            }
            
            
    }
    }


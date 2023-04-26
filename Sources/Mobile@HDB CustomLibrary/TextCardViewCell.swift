//
//  TextCardViewCell.swift
//  
//
//  Created by hdbisg on 26/4/23.
//

import UIKit



public struct TitleCardCustomData {
    var title: String
    var detailTitle: String
    var icon: UIImage
    
   public init(title: String, detailTitle: String, icon: UIImage) {
        self.title = title
        self.detailTitle = detailTitle
        self.icon = icon
    }
    
}

public class TextCardViewCell: UICollectionViewCell {
    
    
  
    
  public  var tData: TitleCardCustomData? {
        didSet {
            guard let tData = tData else { return }
            icon.image = tData.icon
            title.text = tData.title
            detailTitle.text = tData.detailTitle
        }
    }
    
    public let icon: UIImageView = {
       let iconData = UIImageView()
        iconData.translatesAutoresizingMaskIntoConstraints = false
        iconData.contentMode = .scaleAspectFill
        iconData.clipsToBounds = true
        iconData.layer.cornerRadius = 12
      
          //  image.clipsToBounds = true
        return iconData
    }()
    
  public let title: UILabel = {
        
        let titleData = UILabel()
      titleData.translatesAutoresizingMaskIntoConstraints=false
//      data.contentMode = .scaleAspectFit
  //    data.clipsToBounds = true
      titleData.textColor = .white
      titleData.textAlignment = .left
      titleData.numberOfLines = 0
      titleData.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
      
     // data.lineBreakMode = .byWordWrapping
        
       return titleData
        
    }()
    
    public let detailTitle: UILabel = {
          
          let detailData = UILabel()
        detailData.translatesAutoresizingMaskIntoConstraints=false
  //      data.contentMode = .scaleAspectFit
    //    data.clipsToBounds = true
        detailData.textColor = .black
        detailData.textAlignment = .left
        detailData.numberOfLines = 4
        detailData.font = UIFont(name:"HelveticaNeue", size: 15)
       // data.lineBreakMode = .byWordWrapping
          
         return detailData
          
      }()


    
   public override init(frame: CGRect) {
        super.init(frame: .zero)
        

       
       
  
       let myView = UIView()
       
      
       myView.layer.cornerRadius = 12
       myView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Top right corner, Top left corner respectively


       myView.backgroundColor = UIColor(red: 58/255.0, green: 127/255.0, blue: 134/255.0, alpha: 1.0)
       contentView.addSubview(myView)
       myView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
       myView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 0).isActive = true
       myView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true

       myView.heightAnchor.constraint(equalToConstant: 50).isActive = true
       myView.translatesAutoresizingMaskIntoConstraints = false

       myView.addSubview(icon)
       myView.addSubview(title)
       
    
       
       contentView.layer.cornerRadius = 12
      
        contentView.addSubview(detailTitle)
  

       contentView.layer.backgroundColor = UIColor.white.cgColor
       contentView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
       contentView.layer.shadowOffset = CGSize(width: 2.0, height: 4.0)
       contentView.layer.shadowRadius = 2.0
       contentView.layer.shadowOpacity = 1.0
       contentView.layer.masksToBounds = false

       
       icon.topAnchor.constraint(equalTo: myView.topAnchor, constant: 5).isActive = true
       icon.leftAnchor.constraint(equalTo: myView.leftAnchor, constant: 15).isActive = true
       icon.heightAnchor.constraint(equalToConstant: 40).isActive = true
       icon.widthAnchor.constraint(equalToConstant: 40).isActive = true

       title.topAnchor.constraint(equalTo: myView.topAnchor, constant:5).isActive = true
       title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 70).isActive = true
       title.heightAnchor.constraint(equalToConstant: 40).isActive = true
       title.widthAnchor.constraint(equalToConstant: 80).isActive = true
       
       
      detailTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
       detailTitle.widthAnchor.constraint(equalToConstant: 300).isActive = true
       detailTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60).isActive = true

    }
    
   public required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}



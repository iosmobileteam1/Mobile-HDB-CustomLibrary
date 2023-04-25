//
//  ScrollCardViewCell.swift
//  
//
//  Created by hdbisg on 25/4/23.
//

import UIKit


public struct ScrollCardCustomData {
    var title: String
    var detailTitle: String
    var icon: UIImage
    
   public init(title: String, detailTitle: String, icon: UIImage) {
        self.title = title
        self.detailTitle = detailTitle
        self.icon = icon
    }
    
}


public class ScrollCardViewCell: UICollectionViewCell {
    
    
  public  var scrollCarddata: ScrollCardCustomData? {
        didSet {
            guard let data = scrollCarddata else { return }
            icon.image = data.icon
            title.text = data.title
            detailTitle.text = data.detailTitle
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

      titleData.textColor = .white
      titleData.textAlignment = .left
      titleData.numberOfLines = 2
      titleData.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
      

        
       return titleData
        
    }()
    
    public let detailTitle: UILabel = {
          
          let detailTitleData = UILabel()
        detailTitleData.translatesAutoresizingMaskIntoConstraints=false

        detailTitleData.textColor = .white
        detailTitleData.textAlignment = .left
        detailTitleData.numberOfLines = 3
        detailTitleData.font = UIFont(name:"HelveticaNeue", size: 15)
       // data.lineBreakMode = .byWordWrapping
          
         return detailTitleData
          
      }()
    
    
   public override init(frame: CGRect) {
        super.init(frame: .zero)
        
       contentView.layer.cornerRadius = 12
 
        contentView.addSubview(icon)
        contentView.addSubview(title)
       contentView.addSubview(detailTitle)
        contentView.backgroundColor = UIColor.white.withAlphaComponent(0.5)

       
       icon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
       icon.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
       icon.heightAnchor.constraint(equalToConstant: 50).isActive = true
       icon.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
       title.topAnchor.constraint(equalTo: icon.bottomAnchor, constant:8).isActive = true
       title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
       title.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
     //   text.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
       
       
       detailTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
       detailTitle.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
       detailTitle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20).isActive = true
       detailTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true

    }
    
   public required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
    
    
    

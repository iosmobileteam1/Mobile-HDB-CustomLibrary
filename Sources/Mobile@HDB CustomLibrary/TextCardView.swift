//
//  TextCardView.swift
//  
//
//  Created by hdbisg on 26/4/23.
//

import UIKit

public class TextCardView: UIView {

    
      public var textCarddataModels: [TitleCardCustomData?] = [TitleCardCustomData]()
      
      
      public var statsScreenView:UICollectionView = {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .horizontal
          let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
          cv.translatesAutoresizingMaskIntoConstraints = false
          cv.register(TextCardViewCell.self, forCellWithReuseIdentifier: "cell")

          return cv
      }()
      
      
      
      override init(frame: CGRect) {
             super.init(frame: frame)

       

     //   addSubview(collectionView)


          
         setupCollectionView()
          
         }

         required init?(coder aDecoder: NSCoder) {
             super.init(coder: aDecoder)
         }
      
      
      public func setupCollectionView() {
        
        
//       view.backgroundColor = UIColor.darkGray
        addSubview(statsScreenView)
        statsScreenView.backgroundColor = .clear
        statsScreenView.delegate = self
        statsScreenView.dataSource = self
        statsScreenView.layer.cornerRadius = 12
        

        statsScreenView.showsHorizontalScrollIndicator = false
        statsScreenView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        statsScreenView.widthAnchor.constraint(equalToConstant: 380).isActive = true
        
        
        statsScreenView.translatesAutoresizingMaskIntoConstraints = false
      
    }
    
}
    


extension TextCardView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.10, height: 190)
        }



public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return textCarddataModels.count
}

public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TextCardViewCell
cell.tData = self.textCarddataModels[indexPath.item]
    
    
    
return cell
}

}

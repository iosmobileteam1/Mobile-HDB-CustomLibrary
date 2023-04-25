//
//  ScrollCardView.swift
//  
//
//  Created by hdbisg on 25/4/23.
//

import UIKit

public class ScrollCardView: UIView {

 
    public var scrolCardDataModels: [ScrollCardCustomData?] = [ScrollCardCustomData]()
    
    
    public var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(ScrollCardViewCell.self, forCellWithReuseIdentifier: "cell")

        return cv
    }()
    
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)

     

      addSubview(collectionView)


        
       setupCollectionView()
        
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
    
    
    public func setupCollectionView() {
        
        
        addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.layer.cornerRadius = 12
        

        collectionView.showsHorizontalScrollIndicator = false
       collectionView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: 380).isActive = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
      
    }
    
}
    


extension ScrollCardView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {


public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
return CGSize(width: collectionView.frame.width/2.10, height: 210)
}



public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return scrolCardDataModels.count
}

public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ScrollCardViewCell
    cell.scrollCarddata = self.scrolCardDataModels[indexPath.item]
return cell
}
}

//
//  TitleCardView.swift
//  
//
//  Created by HDB ISG on 11/4/23.
//

import Foundation
import UIKit

public class TitleCardView: UICollectionViewCell {
    
    
    public var titleCardDataModels: [TitleCardViewCustomData?] = [TitleCardViewCustomData]()
    
    public var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TitleCardViewCell.self, forCellWithReuseIdentifier: "cell")

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
        
        let view = UIScreen.main.bounds
        heightAnchor.constraint(equalToConstant: 600).isActive = true
        widthAnchor.constraint(equalToConstant: view.width).isActive = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        collectionView.showsVerticalScrollIndicator = false
        collectionView.heightAnchor.constraint(equalToConstant: 600).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: view.width * 64/66).isActive = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        collectionView.layer.masksToBounds = false
    }
}
    
extension TitleCardView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 30/64, height: collectionView.frame.width * 30/64)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: collectionView.frame.width/64, left: collectionView.frame.width/64, bottom: collectionView.frame.width/64, right: collectionView.frame.width/64)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        collectionView.frame.width * 2/64
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        collectionView.frame.width * 2/64
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleCardDataModels.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TitleCardViewCell
        cell.titledata = self.titleCardDataModels[indexPath.item]
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: collectionView.frame.width/64, height: collectionView.frame.width/64)
        cell.layer.shadowRadius = collectionView.frame.width/64
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        return cell
    }
    
   
}

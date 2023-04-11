//
//  TitleCardView.swift
//  
//
//  Created by HDB ISG on 11/4/23.
//

import Foundation
import UIKit

public class TitleCardView: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        imageView.image = UIImage(named: "image_name")
        return imageView
    }()
    
    private lazy var circleView: UIView = {
        let circleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        circleView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        circleView.backgroundColor = UIColor.init(red: 0.79, green: 0.93, blue: 0.88, alpha: 1.0)
        circleView.addSubview(imageView)
        circleView.layer.cornerRadius = 30
        return circleView
    }()
    
    private lazy var headerTitle: UILabel = {
        let headerTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        headerTitle.translatesAutoresizingMaskIntoConstraints = false
        headerTitle.font = UIFont.systemFont(ofSize: 20, weight: .medium)
//        headerTitle.text = "Custom View"
        headerTitle.textAlignment = .center
        headerTitle.textColor = .darkGray
        headerTitle.lineBreakMode = .byWordWrapping
        headerTitle.numberOfLines = 0
        return headerTitle
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleCardView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTitleCardView()
    }
    
    private func setupTitleCardView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        addSubview(circleView)
        addSubview(headerTitle)
        setupLayout()
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 180).isActive = true
        widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            circleView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            
            imageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            
            headerTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            headerTitle.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerTitle.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func setImage(image: UIImage) {
        imageView.image = image
    }
    
    public func setTitle(title: String) {
        headerTitle.text = title
    }
}

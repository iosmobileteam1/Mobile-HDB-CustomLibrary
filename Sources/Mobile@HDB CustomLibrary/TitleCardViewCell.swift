//
//  TitleCardViewCell.swift
//  
//
//  Created by hdbisg on 27/4/23.
//

import UIKit


public struct TitleCardViewCustomData {
        var title: String
        var image: UIImage
        
        public init(title: String, image: UIImage) {
            self.title = title
            self.image = image
        }
    }

    public class TitleCardViewCell: UICollectionViewCell {
        
        public var titledata: TitleCardViewCustomData? {
              didSet {
                  guard let data = titledata else { return }
                  cardImageView.image = data.image
                  cardTitle.text = data.title
              }
          }
        
        private lazy var cardImageView: UIImageView = {
            let cardImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            cardImageView.translatesAutoresizingMaskIntoConstraints = false
            cardImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            cardImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    //        imageView.image = UIImage(named: "image_name")
            return cardImageView
        }()
        
        private lazy var cardCircleView: UIView = {
            let cardCircleView = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
            cardCircleView.translatesAutoresizingMaskIntoConstraints = false
            cardCircleView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            cardCircleView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            cardCircleView.backgroundColor = UIColor.init(red: 0.79, green: 0.93, blue: 0.88, alpha: 1.0)
            cardCircleView.addSubview(cardImageView)
            cardCircleView.layer.cornerRadius = 30
            return cardCircleView
        }()
        
        private lazy var cardTitle: UILabel = {
            let cardTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            cardTitle.translatesAutoresizingMaskIntoConstraints = false
            cardTitle.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    //        headerTitle.text = "Custom View"
            cardTitle.textAlignment = .center
            cardTitle.textColor = .darkGray
            cardTitle.lineBreakMode = .byWordWrapping
            cardTitle.numberOfLines = 0
            return cardTitle
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
            contentView.backgroundColor = .white
            contentView.layer.cornerRadius = 10
            contentView.addSubview(cardCircleView)
            contentView.addSubview(cardTitle)
            setupLayout()
    //        contentView.translatesAutoresizingMaskIntoConstraints = false
    //        contentView.heightAnchor.constraint(equalToConstant: 170).isActive = true
    //        contentView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        }
        
        private func setupLayout() {
            NSLayoutConstraint.activate([
                cardCircleView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                cardCircleView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -20),
                cardImageView.centerXAnchor.constraint(equalTo: cardCircleView.centerXAnchor),
                cardImageView.centerYAnchor.constraint(equalTo: cardCircleView.centerYAnchor),
                cardTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                cardTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                cardTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        }
    }


//
//  ImageCarousel.swift
//  
//
//  Created by hdbisg on 11/5/23.
//

import UIKit

public class ImageCarousel: UIViewController {

    public var pages = [UIViewController]()
    public let pageControl = UIPageControl()
    public  let initialPage = 0
    public var pageViewController = UIPageViewController()
    
    
    public var mainTitle:UILabel = {
        var label1 = UILabel()
        label1.translatesAutoresizingMaskIntoConstraints = false
        label1.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height / 30)
        label1.textAlignment = .left
        label1.backgroundColor = UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1)
        label1.numberOfLines = 1
        label1.text = " Augmented Reality for EASE"
        label1.textColor = .white
        
        return label1
    }()
    
    
    public var firstViewImage: UIImageView = {
        let imageData = UIImageView()
        imageData.translatesAutoresizingMaskIntoConstraints = false
        imageData.contentMode = .scaleAspectFit
        imageData.clipsToBounds = true
        imageData.image = #imageLiteral(resourceName: "2EASE")
        
        
        return imageData
    }()
    
    
    public var titleLabelFirstView:UILabel = {
            var label1 = UILabel()
            label1.translatesAutoresizingMaskIntoConstraints = false
            label1.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.height == 568 ? UIScreen.main.bounds.height / 45 : UIScreen.main.bounds.height / 50)
            label1.textAlignment = .center
            label1.textColor = UIColor.darkGray
            label1.numberOfLines = 0
            label1.text = "Virtual Selection"
    
            return label1
        }()
    
    public var detailLabelFirstView:UILabel = {
            var label2 = UILabel()
            label2.translatesAutoresizingMaskIntoConstraints = false
            label2.text = "Browse through Enhancement for Active Seniors (EASE) improvement items virtually"
            label2.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height == 568 ? UIScreen.main.bounds.height / 45 : UIScreen.main.bounds.height / 50)
            label2.textAlignment = .center
            label2.textColor = UIColor.gray
            label2.numberOfLines = 0
    
            return label2
        }()
    
    public var secondViewImage: UIImageView = {
        let imageData = UIImageView()
        imageData.translatesAutoresizingMaskIntoConstraints = false
        imageData.contentMode = .scaleAspectFit
        imageData.clipsToBounds = true
        imageData.image = #imageLiteral(resourceName: "EASE1")
        
        return imageData
    }()
    
    
    public var titleLabelSecondView:UILabel = {
            var label1 = UILabel()
            label1.translatesAutoresizingMaskIntoConstraints = false
            label1.font = UIFont.boldSystemFont(ofSize: UIScreen.main.bounds.height == 568 ? UIScreen.main.bounds.height / 45 : UIScreen.main.bounds.height / 50)
            label1.textAlignment = .center
            label1.textColor = UIColor.darkGray
            label1.text = "Grab Bar and Ramp"
            label1.numberOfLines = 0
    
            return label1
        }()
    
        public var detailLabelSecondView:UILabel = {
            var label2 = UILabel()
            label2.translatesAutoresizingMaskIntoConstraints = false
            label2.text = "Check out how the virtual grab bars and ramps appear in your home"
            label2.font = UIFont.systemFont(ofSize: UIScreen.main.bounds.height == 568 ? UIScreen.main.bounds.height / 45 : UIScreen.main.bounds.height / 50)
            label2.textAlignment = .center
            label2.textColor = UIColor.gray
            label2.numberOfLines = 0
    
            return label2
        }()
    
    public var firstView:UIViewController = {
        var View1 = UIViewController()
     //   View1.view.translatesAutoresizingMaskIntoConstraints = false
        View1.view.backgroundColor = .clear
        
        return View1
    }()
    

    public var secondView:UIViewController = {
        var View2 = UIViewController()
        View2.view.backgroundColor = .clear

        
        return View2
    }()

    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
    }
    
    public func setup() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        // create an array of viewController
        let page1 = firstView
        let page2 = secondView
    
        pages.append(page1)
        pages.append(page2)
        
        // set initial viewController to be displayed
        // Note: We are not passing in all the viewControllers here. Only the one to be displayed.
        pageViewController.setViewControllers([pages[initialPage]], direction: .forward, animated: false, completion: nil)
        
        
        
    }
    
    public func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = UIColor(red: 12/255, green: 129/255, blue: 136/255, alpha: 1)
        pageControl.pageIndicatorTintColor = UIColor.lightGray.withAlphaComponent(0.8)
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
    }
    
    public func layout() {
        
        view.addSubview(pageViewController.view)
        pageViewController.view.addSubview(pageControl)
        
        firstView.view.addSubview(firstViewImage)
        firstView.view.addSubview(titleLabelFirstView)
        firstView.view.addSubview(detailLabelFirstView)
        
        secondView.view.addSubview(secondViewImage)
        secondView.view.addSubview(titleLabelSecondView)
        secondView.view.addSubview(detailLabelSecondView)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: -1),
        ])
        
        
        
        firstViewImage.topAnchor.constraint(equalTo: firstView.view.topAnchor, constant: 40).isActive = true
        firstViewImage.centerXAnchor.constraint(equalTo: firstView.view.centerXAnchor).isActive = true
        firstViewImage.leadingAnchor.constraint(equalTo: firstView.view.leadingAnchor, constant: 5).isActive = true
        firstViewImage.trailingAnchor.constraint(equalTo: firstView.view.trailingAnchor, constant: -5).isActive = true
        firstViewImage.heightAnchor.constraint(equalTo: firstView.view.heightAnchor, multiplier: 0.62).isActive = true
        
        
        titleLabelFirstView.topAnchor.constraint(equalTo: firstViewImage.bottomAnchor, constant: 10).isActive = true
        titleLabelFirstView.leadingAnchor.constraint(equalTo: firstView.view.leadingAnchor, constant: 10).isActive = true
        titleLabelFirstView.trailingAnchor.constraint(equalTo: firstView.view.trailingAnchor, constant: -10).isActive = true
        titleLabelFirstView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabelFirstView.centerXAnchor.constraint(equalTo: firstView.view.centerXAnchor).isActive = true
        
        detailLabelFirstView.topAnchor.constraint(equalTo: titleLabelFirstView.bottomAnchor, constant: 5).isActive = true
        detailLabelFirstView.leadingAnchor.constraint(equalTo: firstView.view.leadingAnchor, constant: 25).isActive = true
        detailLabelFirstView.trailingAnchor.constraint(equalTo: firstView.view.trailingAnchor, constant: -25).isActive = true
        
        detailLabelFirstView.centerXAnchor.constraint(equalTo: firstView.view.centerXAnchor).isActive = true
        
        
        
        secondViewImage.topAnchor.constraint(equalTo: secondView.view.topAnchor, constant: 40).isActive = true
        secondViewImage.centerXAnchor.constraint(equalTo: secondView.view.centerXAnchor).isActive = true
        secondViewImage.leadingAnchor.constraint(equalTo: secondView.view.leadingAnchor, constant: 5).isActive = true
        secondViewImage.trailingAnchor.constraint(equalTo: secondView.view.trailingAnchor, constant: -5).isActive = true
        secondViewImage.heightAnchor.constraint(equalTo: secondView.view.heightAnchor, multiplier: 0.62).isActive = true
        

        titleLabelSecondView.topAnchor.constraint(equalTo: secondViewImage.bottomAnchor, constant: 10).isActive = true
        titleLabelSecondView.leadingAnchor.constraint(equalTo: secondView.view.leadingAnchor, constant: 10).isActive = true
        titleLabelSecondView.trailingAnchor.constraint(equalTo: secondView.view.trailingAnchor, constant: -10).isActive = true
        titleLabelSecondView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleLabelSecondView.centerXAnchor.constraint(equalTo: secondView.view.centerXAnchor).isActive = true

        detailLabelSecondView.topAnchor.constraint(equalTo: titleLabelSecondView.bottomAnchor, constant: 5).isActive = true
        detailLabelSecondView.leadingAnchor.constraint(equalTo: secondView.view.leadingAnchor, constant: 25).isActive = true
        detailLabelSecondView.trailingAnchor.constraint(equalTo: secondView.view.trailingAnchor, constant: -25).isActive = true

        detailLabelSecondView.centerXAnchor.constraint(equalTo: secondView.view.centerXAnchor).isActive = true
        
    }
    
}
// MARK: - Actions

extension ImageCarousel {
    
    // How we change page when pageControl tapped.
 
    @objc public func pageControlTapped(_ sender: UIPageControl) {
        pageViewController.setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - DataSources

extension ImageCarousel: UIPageViewControllerDataSource {
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return nil               // wrap to last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return nil           // wrap to first
        }
    }
}

// MARK: - Delegates

extension ImageCarousel: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
    
    
    
}


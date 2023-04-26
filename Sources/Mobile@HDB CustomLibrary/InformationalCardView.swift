//
//  InformationalCardView.swift
//  
//
//  Created by hdbisg on 26/4/23.
//

import UIKit

public class InformationalCardView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    
    public var informationalCardDataModel: [informationalCardData?] = [informationalCardData]()

    public var myTableView: UITableView!
   
    
    
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        
        
       
        let view = UIScreen.main.bounds
        myTableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.height))
        myTableView.backgroundColor = UIColor.clear
        myTableView.separatorStyle = .none
        myTableView.showsVerticalScrollIndicator = false
        myTableView?.translatesAutoresizingMaskIntoConstraints = false
        myTableView?.register(InformationalCardViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.rowHeight = UITableView.automaticDimension
        myTableView?.dataSource = self
        myTableView?.delegate = self
    
      
        myTableView.tableFooterView = UIView()
    
        myTableView.reloadData()
        myTableView.allowsMultipleSelection = true
  
       
        addSubview(myTableView)
       

    
       }

       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
       }
    
    

    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return informationalCardDataModel.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! InformationalCardViewCell
        cell.mainData = informationalCardDataModel[indexPath.row]


        return cell
        
        
    }
    

}

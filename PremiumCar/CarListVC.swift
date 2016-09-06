//
//  CarListVC.swift
//  PremiumCar
//
//  Created by ethen on 16/9/6.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class CarListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView?
    private var dataSource: [CarModel] = []  {
        
        didSet {
            
            self.tableView?.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic = ["name" : "宝马X6", "url" : "BaoMa", "numbel" : "京A88888"]
        let model = CarModel(dic: dic)
        let dic2 = ["name" : "奔驰", "url" : "BenChi", "numbel" : "京A66688"]
        let model2 = CarModel(dic: dic2)
        let dic3 = ["name" : "保时捷", "url" : "BaoShiJie", "numbel" : "京A00011"]
        let model3 = CarModel(dic: dic3)
        dataSource = [model, model2, model3]
        setupUI()
    }
    
    //MARK: UI
    private func setupUI() {
        
        self.view.backgroundColor = RGBA(0, g: 0, b: 0, a: 1)
        
        self.tableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableView?.backgroundColor = UIColor.whiteColor()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.registerClass(CarListCell.self, forCellReuseIdentifier: "CarListCellIdentifier")
        self.view.addSubview(self.tableView!)
        self.tableView?.tableFooterView = UIView(frame: CGRectZero)
    }

    //MARK: Handle
    func buttonClicked(sender: UIButton) {
    }
    
    //MARK: TableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if dataSource.count > 0 {
            return dataSource.count
        }else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return CarListCell.height()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CarListCellIdentifier", forIndexPath: indexPath) as! CarListCell
        cell.selectionStyle = UITableViewCellSelectionStyle.Gray
        cell.accessoryType = .DisclosureIndicator
        
        let model: CarModel = dataSource[indexPath.row]
        cell.update(model)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

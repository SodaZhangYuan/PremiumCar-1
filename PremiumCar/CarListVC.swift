//
//  CarListVC.swift
//  PremiumCar
//
//  Created by ethen on 16/9/6.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class CarListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var tableView: UITableView!
    private var dataSource: [CarModel] = []  {
        
        didSet {
            
            self.tableView?.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dic0 = ["name" : "保时捷 911", "url" : "Porsche-911", "numbel" : "京A 32N28"]
        let model0 = CarModel(dic: dic0)
        let dic1 = ["name" : "宾利 添越", "url" : "Bingley-bentayga", "numbel" : "京N 2O4P2"]
        let model1 = CarModel(dic: dic1)
        let dic2 = ["name" : "捷豹 F-Pace", "url" : "Jaguar-fPace", "numbel" : "京Q 12JL1"]
        let model2 = CarModel(dic: dic2)
        let dic3 = ["name" : "奔驰 SL", "url" : "Benz-SL", "numbel" : "京A 93DL8"]
        let model3 = CarModel(dic: dic3)
        let dic4 = ["name" : "劳斯莱斯 魅影", "url" : "RollsRoyce-wraith", "numbel" : "京Q J4Y89"]
        let model4 = CarModel(dic: dic4)
        let dic5 = ["name" : "特斯拉 ModelS", "url" : "Tesla-modelS", "numbel" : "京N 6NN18"]
        let model5 = CarModel(dic: dic5)

        
        dataSource = [model0, model1, model2, model3, model4, model5]
        setupUI()
    }
    
    //MARK: UI
    private func setupUI() {
        
        self.view.backgroundColor = RGBA(0, g: 0, b: 0, a: 1)
        
        self.tableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableView.backgroundColor = UIColor.whiteColor()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(CarListCell.self, forCellReuseIdentifier: "CarListCellIdentifier")
        self.view.addSubview(self.tableView)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
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
        cell.selectionStyle = .Gray
        cell.accessoryType = .DisclosureIndicator
        
        let model: CarModel = dataSource[indexPath.row]
        cell.update(model)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let model: CarModel = dataSource[indexPath.row]
        let detailVC = CarDetailVC()
        detailVC.carModel = model
        detailVC.title = model.name
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}









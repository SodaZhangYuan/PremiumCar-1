//
//  CarDetailVC.swift
//  PremiumCar
//
//  Created by ethen on 16/9/9.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class CarDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var carModel: CarModel!
    var dataArray: [AnyObject]!
    private var tableView: UITableView!
    private var banner: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataArray = ["09月03日\t￥50 \n\n为爱车做了 车辆清洗", "08月21日\t￥50 \n\n为爱车做了 车辆清洗", "07月16日\t￥200 \n\n为爱车做了 车辆精洗", "07月08日\t￥12000 \n\n为爱车做了 2万公里保养", "06月02日\t￥50 \n\n为爱车做了 车辆清洗", "05月27日\t￥50 \n\n为爱车做了 车辆清洗"]
        setupUI()
    }
    
    //MARK: UI
    private func setupUI() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        banner = UIImageView()
        banner.backgroundColor = RGBA(250, g: 250, b: 250, a: 1)
        banner.clipsToBounds = true
        banner.contentMode = .ScaleAspectFill
        self.view.addSubview(banner)
        banner.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH))
        })
        banner.image = UIImage(named: carModel.url!)
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 50 - 64), style: .Plain)
        self.tableView.backgroundColor = UIColor.clearColor()
//        self.tableView.separatorStyle = .None
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        self.view.addSubview(self.tableView)
        let header = UIView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH))
        self.tableView.tableHeaderView = header
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        let btn0 = UIButton(type: .Custom)
        btn0.backgroundColor = COLOR_BLACK
        btn0.setTitle("续保", forState: .Normal)
        btn0.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn0.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn0.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn0)
        btn0.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH / 2, 50))
            make.bottom.equalTo(self.view.snp_bottom)
        }
        
        let btn1 = UIButton(type: .Custom)
        btn1.backgroundColor = COLOR_BLACK
        btn1.setTitle("保养", forState: .Normal)
        btn1.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn1.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn1.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn1)
        btn1.snp_makeConstraints { (make) in
            make.size.equalTo(btn0)
            make.left.equalTo(btn0.snp_right)
            make.bottom.equalTo(self.view.snp_bottom)
        }
        
        let line = UIView()
        line.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(line)
        line.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(0.5, 44))
            make.top.equalTo(btn1).offset(3)
            make.left.equalTo(btn1)
        }
        line.alpha = 0.4
    }
    
    //MARK: Handle
    func buttonClicked(sender: UIButton) {
        
        let submitVC = SubmitVC()
        self.navigationController?.pushViewController(submitVC, animated: true)
    }
    
    //MARK: TableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        }
        return 80
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.selectionStyle = .None
        
        if indexPath.section == 0 {
            cell.backgroundColor = UIColor.whiteColor()
            
            let numbelLabel = UILabel()
            numbelLabel.backgroundColor = COLOR_BLACK //RGBA(3, g: 84, b: 253, a: 1)
            numbelLabel.textColor = UIColor.whiteColor()
            numbelLabel.font = UIFont.boldSystemFontOfSize(38)
            numbelLabel.textAlignment = .Center
            numbelLabel.layer.masksToBounds = true
            numbelLabel.layer.cornerRadius = 5
            cell.contentView.addSubview(numbelLabel)
            numbelLabel.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(20)
                make.centerX.equalTo(self.view)
                make.size.equalTo(CGSizeMake(200, 60))
            })
            numbelLabel.text = self.carModel.numbel
            numbelLabel.alpha = 0.85
        }else {
            let text = dataArray[indexPath.row] as! String
            let label = UILabel(frame: CGRectMake(18, 0, SCREEN_WIDTH - 26, 60))
            label.textColor = RGBA(120, g: 120, b: 120, a: 1)
            label.numberOfLines = 0
            label.font = UIFont.systemFontOfSize(14)
            cell.contentView.addSubview(label)
            label.text = text
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        banner.frame.origin.y = 0 - (scrollView.contentOffset.y / 2.6)
    }

}

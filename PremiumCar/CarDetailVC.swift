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
    private var tableView: UITableView!
    private var banner: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH * 9 / 16))
        })
        banner.image = UIImage(named: carModel.url!)
        
        self.tableView = UITableView(frame: self.view.bounds, style: .Plain)
        self.tableView.backgroundColor = UIColor.clearColor()
        self.tableView.separatorStyle = .None
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        self.view.addSubview(self.tableView)
        let header = UIView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH * 9 / 16))
        self.tableView.tableHeaderView = header
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        let btn = UIButton(type: .Custom)
        btn.backgroundColor = UIColor.blackColor()
        btn.setTitle("预约取车", forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        btn.alpha = 0.8
        self.view.addSubview(btn)
        btn.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 50))
            make.bottom.equalTo(self.view.snp_bottom)
        }
    }
    
    //MARK: Handle
    func buttonClicked(sender: UIButton) {
    }
    
    //MARK: TableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 30
        }else {
            return 1000
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CellIdentifier", forIndexPath: indexPath)
        cell.selectionStyle = .None
        
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor.clearColor()
            
            let gradient = UIImageView(image: UIImage(named: "DetailGradient"))
            gradient.clipsToBounds = true
            gradient.contentMode = .ScaleAspectFit
            cell.contentView.addSubview(gradient)
            gradient.snp_makeConstraints(closure: { (make) in
                make.top.equalTo(0)
                make.left.equalTo(0)
                make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 30))
            })
        }else {
            cell.backgroundColor = UIColor.whiteColor()
            
            let numbelLabel = UILabel()
            numbelLabel.backgroundColor = RGBA(3, g: 84, b: 253, a: 1)
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
            numbelLabel.alpha = 0.6
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

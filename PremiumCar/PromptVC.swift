//
//  PromptVC.swift
//  PremiumCar
//
//  Created by ethen on 16/9/12.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class PromptVC: UIViewController {
    
    
override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.initNavigation()
        self.initUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(imageWithColor(COLOR_BLACK), forBarPosition: UIBarPosition.Any, barMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
    }
    
    //MARK: UI
    func initNavigation() {
        
        self.navigationItem.hidesBackButton = true
    }
    
    func initUI() {
        
        self.view.backgroundColor = RGBA(0, g: 0, b: 0, a: 1)
        
        let imgView = UIImageView(frame: CGRectMake(((SCREEN_WIDTH - 200) / 2), 100, 200, 200))
        imgView.backgroundColor = RGBA(250, g: 250, b: 250, a: 1)
        imgView.clipsToBounds = true
        imgView.contentMode = .ScaleAspectFill
        imgView.image = UIImage(named: "Vip")
        self.view.addSubview(imgView)
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = imgView.frame.size.width / 2
        imgView.layer.allowsEdgeAntialiasing = true
        
        let label = UILabel()
        label.textColor = RGBA(255, g: 255, b: 255, a: 1)
        label.font = UIFont.systemFontOfSize(40)
        label.numberOfLines = 0
        label.textAlignment = .Center
        self.view.addSubview(label)
        label.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(imgView.snp_bottom).offset(20)
            make.left.equalTo(10)
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH - 20, 50))
        })
        label.text = "操作完成。"
        
        let label1 = UILabel()
        label1.textColor = RGBA(235, g: 235, b: 235, a: 1)
        label1.font = UIFont.systemFontOfSize(16)
        label1.numberOfLines = 0
        label1.textAlignment = .Center
        self.view.addSubview(label1)
        label1.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(label.snp_bottom).offset(0)
            make.left.equalTo(10)
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH - 20, 100))
        })
        label1.text = "我们会在预约时间前往您的宅邸，请您确保电话畅通，并准备好您的爱车。谢谢。"
        
        let btn0 = UIButton(type: .Custom)
        btn0.backgroundColor = COLOR_BLACK
        btn0.setTitle("返回", forState: .Normal)
        btn0.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn0.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn0.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn0)
        btn0.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 50))
            make.bottom.equalTo(self.view.snp_bottom)
        }
    }
    
    //MARK: Handle
    func buttonClicked(sender: UIButton) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    //MARK: Request

}

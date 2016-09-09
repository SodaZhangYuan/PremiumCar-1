//
//  ViewController.swift
//  PremiumCar
//
//  Created by ethen on 16/9/5.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UI
    private func setupUI() {
        
        self.view.backgroundColor = RGBA(0, g: 0, b: 0, a: 1)
        
        let img = UIImage(named: "VCBackground")
        let imgView = UIImageView(frame: self.view.bounds)
        imgView.contentMode = .ScaleAspectFill
        imgView.image = img
        self.view.addSubview(imgView)
        
        let btn0 = getButtons(CGRectMake(10, 200, SCREEN_WIDTH - 20, 40), title: "上门保养", tag: 1)
        self.view.addSubview(btn0)
        let btn1 = getButtons(CGRectMake(10, 250, SCREEN_WIDTH - 20, 40), title: "上保险", tag: 2)
        self.view.addSubview(btn1)
        let btn2 = getButtons(CGRectMake(10, 300, SCREEN_WIDTH - 20, 40), title: "车友圈", tag: 3)
        self.view.addSubview(btn2)
        btn2.enabled = false
        btn2.alpha = 0.1
        let btn3 = getButtons(CGRectMake(10, 350, SCREEN_WIDTH - 20, 40), title: "呼叫管家", tag: 4)
        self.view.addSubview(btn3)
        let btn4 = getButtons(CGRectMake(10, 400, SCREEN_WIDTH - 20, 40), title: "我的车", tag: 5)
        self.view.addSubview(btn4)
    }
    
    func getButtons(rect: CGRect, title: String, tag: NSInteger) -> UIButton {
        
        let btn = UIButton(type: .Custom)
        btn.frame = rect
        btn.backgroundColor = UIColor.blackColor()
        btn.setTitle(title, forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        btn.alpha = 0.4
        btn.tag = tag
        return btn
    }
    
    func buttonClicked(button: UIButton) {
        
        if button.tag == 1 || button.tag == 2 {
            let title = button.tag == 1 ? "选择要保养的车" : "选择要续保的车"
            let carListVC = CarListVC()
            carListVC.title = title
            navigationController?.pushViewController(carListVC, animated: true)
        }
    }

}









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
        
        let btn0 = getButtons(CGRectMake(10, 200, SCREEN_WIDTH - 20, 40), tag: 1)
        self.view.addSubview(btn0)
        let lab0 = getLabel(btn0.frame, title: "保养")
        self.view.addSubview(lab0)
        
        let btn1 = getButtons(CGRectMake(10, 250, SCREEN_WIDTH - 20, 40), tag: 2)
        self.view.addSubview(btn1)
        let lab1 = getLabel(btn1.frame, title: "续保")
        self.view.addSubview(lab1)
        
        let btn2 = getButtons(CGRectMake(10, 300, SCREEN_WIDTH - 20, 40), tag: 3)
        self.view.addSubview(btn2)
        btn2.enabled = false
        btn2.alpha = 0.2
        let lab2 = getLabel(btn2.frame, title: "车友圈")
        self.view.addSubview(lab2)
        lab2.alpha = 0.4
    
        let btn3 = getButtons(CGRectMake(10, 350, SCREEN_WIDTH - 20, 40), tag: 4)
        self.view.addSubview(btn3)
        let lab3 = getLabel(btn3.frame, title: "呼叫管家")
        self.view.addSubview(lab3)
        
        let btn4 = getButtons(CGRectMake(10, 400, SCREEN_WIDTH - 20, 40), tag: 5)
        self.view.addSubview(btn4)
        let lab4 = getLabel(btn4.frame, title: "我的车")
        self.view.addSubview(lab4)
    }
    
    func getButtons(rect: CGRect, tag: NSInteger) -> UIButton {
        
        let btn = UIButton(type: .Custom)
        btn.frame = rect
        btn.backgroundColor = UIColor.blackColor()
        btn.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        btn.alpha = 0.4
        btn.tag = tag
        
        return btn
    }
    
    func getLabel(rect: CGRect, title: String) -> UILabel {
        
        let label = UILabel()
        label.frame = rect
        label.text = title
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(20)
        label.textColor = UIColor.whiteColor()
        
        return label
    }
    
    func buttonClicked(button: UIButton) {
        
        if button.tag == 1 || button.tag == 2 {
//            let title = button.tag == 1 ? "选择要保养的车" : "选择要续保的车"
            let carListVC = CarListVC()
            carListVC.title = title
            navigationController?.pushViewController(carListVC, animated: true)
        }
    }

}









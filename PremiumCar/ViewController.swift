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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.setBackgroundImage(imageWithColor(COLOR_BLACK), for: UIBarPosition.any, barMetrics: UIBarMetrics.default)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UI
    fileprivate func setupUI() {
        
        self.view.backgroundColor = RGBA(0, g: 0, b: 0, a: 1)
        
        let img = UIImage(named: "VCBackground")
        let imgView = UIImageView(frame: self.view.bounds)
        imgView.contentMode = .scaleAspectFill
        imgView.image = img
        self.view.addSubview(imgView)
        
        let btn0 = getButtons(CGRect(x: 10, y: 200, width: SCREEN_WIDTH - 20, height: 40), tag: 1)
        self.view.addSubview(btn0)
        let lab0 = getLabel(btn0.frame, title: "保养")
        self.view.addSubview(lab0)
        
        let btn1 = getButtons(CGRect(x: 10, y: 250, width: SCREEN_WIDTH - 20, height: 40), tag: 2)
        self.view.addSubview(btn1)
        let lab1 = getLabel(btn1.frame, title: "续保")
        self.view.addSubview(lab1)
        
        let btn2 = getButtons(CGRect(x: 10, y: 300, width: SCREEN_WIDTH - 20, height: 40), tag: 3)
        self.view.addSubview(btn2)
        btn2.isEnabled = false
        btn2.alpha = 0.2
        let lab2 = getLabel(btn2.frame, title: "车友圈")
        self.view.addSubview(lab2)
        lab2.alpha = 0.4
    
        let btn3 = getButtons(CGRect(x: 10, y: 350, width: SCREEN_WIDTH - 20, height: 40), tag: 4)
        self.view.addSubview(btn3)
        let lab3 = getLabel(btn3.frame, title: "呼叫管家")
        self.view.addSubview(lab3)
        
        let btn4 = getButtons(CGRect(x: 10, y: 400, width: SCREEN_WIDTH - 20, height: 40), tag: 5)
        self.view.addSubview(btn4)
        let lab4 = getLabel(btn4.frame, title: "我的车")
        self.view.addSubview(lab4)
    }
    
    func getButtons(_ rect: CGRect, tag: NSInteger) -> UIButton {
        
        let btn = UIButton(type: .custom)
        btn.frame = rect
        btn.backgroundColor = UIColor.black
        btn.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        btn.alpha = 0.4
        btn.tag = tag
        
        return btn
    }
    
    func getLabel(_ rect: CGRect, title: String) -> UILabel {
        
        let label = UILabel()
        label.frame = rect
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.white
        
        return label
    }
    
    func buttonClicked(_ button: UIButton) {
        
        if button.tag == 1 || button.tag == 2 {
//            let title = button.tag == 1 ? "选择要保养的车" : "选择要续保的车"
            let carListVC = CarListVC()
            carListVC.title = title
            navigationController?.pushViewController(carListVC, animated: true)
        }
    }

}









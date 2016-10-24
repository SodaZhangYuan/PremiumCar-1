//
//  LoginViewController.swift
//  PremiumCar
//
//  Created by 赵霆 on 16/10/24.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var mobileNo: UITextField?
    var password: UITextField?
    var loginBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = COLOR_BLACK
        
        mobileNo = UITextField(frame: CGRect(x: 30, y: 64, width: SCREEN_WIDTH - 60, height: 44))
        mobileNo?.placeholder = "帐号"
        mobileNo?.alpha = 0.7
        mobileNo?.borderStyle = UITextBorderStyle.roundedRect
        mobileNo?.backgroundColor = UIColor.white
        mobileNo?.keyboardType = UIKeyboardType.numberPad
        mobileNo?.returnKeyType = UIReturnKeyType.done
        mobileNo?.delegate = self
        mobileNo?.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.allEditingEvents)
        view.addSubview(mobileNo!)
        
        password = UITextField(frame: CGRect(x: 30, y: (mobileNo?.frame.maxY)! + 10, width: SCREEN_WIDTH - 60, height: 44))
        password?.placeholder = "密码"
        password?.alpha = 0.7
        password?.borderStyle = UITextBorderStyle.roundedRect
        password?.backgroundColor = UIColor.white
        password?.keyboardType = UIKeyboardType.default
        password?.returnKeyType = UIReturnKeyType.done
        password?.delegate = self
        password?.addTarget(self, action: #selector(textFieldDidChange), for: UIControlEvents.allEditingEvents)
        view.addSubview(password!)
        
        
        
    
    }
    
    func textFieldDidChange() {
        
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    
    
    
}

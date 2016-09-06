//
//  SetupViewLET.swift
//  PremiumCar
//
//  Created by ethen on 16/9/6.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

func setupButton(rect: CGRect, title: String, tag: NSInteger, target: AnyObject, selector: Selector) -> UIButton {
    
    let button = UIButton(type: .Custom)
    button.frame = rect
    button.tag = tag
    button.backgroundColor = RGBA(0, g: 0, b: 0, a: 1)
    button.titleLabel?.font = UIFont.systemFontOfSize(19)
    button.setTitle(title, forState: UIControlState.Normal)
    button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    button.addTarget(target, action: selector, forControlEvents: .TouchUpInside)
    
    return button
}
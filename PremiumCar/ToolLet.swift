//
//  ToolLet.swift
//  IM
//
//  Created by ethen on 16/9/3.
//  Copyright © 2016年 ethan. All rights reserved.
//

import UIKit

let SCREEN_WIDTH    = UIScreen.mainScreen().bounds.width
let SCREEN_HEIGHT   = UIScreen.mainScreen().bounds.height

func RGBA (r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    
    return UIColor (red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}

func PostNotification(name: String, object: AnyObject?, userInfo: [NSObject: AnyObject]?) {
    
    NSNotificationCenter.defaultCenter().postNotificationName(name, object: object, userInfo: userInfo)
}

func AddObserver(observer: AnyObject, selector: Selector, name: String?, object: AnyObject?) {
    
    NSNotificationCenter.defaultCenter().addObserver(observer, selector: selector, name: name, object: object)
}

func sizeForString(string: String, width: CGFloat, height: CGFloat, font: UIFont) -> CGSize {
    
    let attrStr: NSMutableAttributedString = NSMutableAttributedString(string: string)
    attrStr.addAttribute(NSFontAttributeName, value:font, range: NSMakeRange(0, attrStr.length))
    let sizeToFit: CGSize = attrStr.boundingRectWithSize(CGSizeMake(width, height), options: .UsesLineFragmentOrigin, context: nil).size
    return sizeToFit
}

func imageWithColor(color: UIColor) -> UIImage {
    
    let rect = CGRectMake(0.0, 0.0, 1.0, 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    CGContextSetFillColorWithColor(context, color.CGColor)
    CGContextFillRect(context, rect)
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return theImage
}









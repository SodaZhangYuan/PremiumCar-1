//
//  ChatListCell.swift
//  IM
//
//  Created by ethen on 16/8/16.
//  Copyright © 2016年 ethan. All rights reserved.
//

import UIKit
import SnapKit

class CarListCell: UITableViewCell {

    private var nameLabel: UILabel?
    private var numbelLabel: UILabel?
    private var imgView: UIImageView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        
        imgView = UIImageView()
        imgView?.backgroundColor = RGBA(250, g: 250, b: 250, a: 1)
        imgView?.clipsToBounds = true
        imgView?.contentMode = .ScaleAspectFill
        contentView.addSubview(imgView!)
        imgView?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.size.equalTo(CGSizeMake(140, 80))
        })
        
        nameLabel = UILabel()
        nameLabel?.textColor = RGBA(0, g: 0, b: 0, a: 1)
        nameLabel?.font = UIFont.systemFontOfSize(18)
        contentView.addSubview(nameLabel!)
        nameLabel?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(8)
            make.left.equalTo(imgView!.snp_right).offset(8)
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH-8-54-8-8-80-10, 32))
        })
        
        numbelLabel = UILabel()
        numbelLabel?.textColor = RGBA(110, g: 110, b: 110, a: 1)
        numbelLabel?.font = UIFont.systemFontOfSize(16)
        contentView.addSubview(numbelLabel!)
        numbelLabel?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(nameLabel!.snp_bottom)
            make.left.equalTo(imgView!.snp_right).offset(8)
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH-8-54-8-8-80-10, 32))
        })
    }
    
    func update(model: CarModel) {
        
        if model.url != nil {
            imgView?.image = UIImage(named: model.url!)
        }
        nameLabel?.text = model.name
        numbelLabel?.text = model.numbel
    }
    
    class func height() -> CGFloat {
        
        return 81
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}






//
//  SubmitVC.swift
//  PremiumCar
//
//  Created by ethen on 16/9/12.
//  Copyright © 2016年 soda. All rights reserved.
//

import UIKit

class SubmitVC: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    private var tableView: UITableView!
    private var phoneTextField: UITextField!
    private var nameTextField: UITextField!
    private var dateTextField: UITextField!
    private var datePicker: UIDatePicker!
    private var datePickerButton: UIButton!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.initNavigation()
        self.initUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    //MARK: UI
    func initNavigation() {
    }
    
    func initUI() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        self.tableView = UITableView(frame: CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 50 - 64), style: .Plain)
        self.tableView.backgroundColor = UIColor.whiteColor()
        //        self.tableView.separatorStyle = .None
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCellIdentifier")
        self.view.addSubview(self.tableView)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        nameTextField = self.getTextField()
        nameTextField.placeholder = "请填写您的姓名"
        phoneTextField = self.getTextField()
        phoneTextField.placeholder = "您的联系方式"
        phoneTextField.keyboardType = .NumberPad
        dateTextField = self.getTextField()
        dateTextField.placeholder = "预约上门时间"
        
        let btn0 = UIButton(type: .Custom)
        btn0.backgroundColor = COLOR_BLACK
        btn0.setTitle("提交", forState: .Normal)
        btn0.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn0.titleLabel?.font = UIFont.systemFontOfSize(20)
        btn0.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn0)
        btn0.snp_makeConstraints { (make) in
            make.size.equalTo(CGSizeMake(SCREEN_WIDTH, 50))
            make.bottom.equalTo(self.view.snp_bottom)
        }
        
        datePicker = UIDatePicker()
        datePicker.frame = CGRectMake(0, self.view.frame.height + 30, SCREEN_WIDTH, 260)
        datePicker.backgroundColor = RGBA(230, g: 230, b: 230, a: 1)
        datePicker.setDate(NSDate(), animated: false)
        datePicker.datePickerMode = UIDatePickerMode.DateAndTime
        datePicker.minuteInterval = 60 * 60
        datePicker.minimumDate = NSDate()
        datePicker.addTarget(self, action:#selector(SubmitVC.datePickerValueChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(datePicker)
        
        datePickerButton = UIButton(type: .Custom)
        datePickerButton.frame = CGRectMake(0, self.view.frame.height, SCREEN_WIDTH, 30)
        datePickerButton.backgroundColor = RGBA(230, g: 230, b: 230, a: 1)
        datePickerButton.setTitle("选定预约", forState: .Normal)
        datePickerButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        datePickerButton.titleLabel?.font = UIFont.systemFontOfSize(16)
        datePickerButton.addTarget(self, action: #selector(buttonClicked(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(datePickerButton)
        
        //default text
        nameTextField.text = "王先生"
        phoneTextField.text = "13910001111"
        self.datePickerValueChange(datePicker)
    }
    
    func getTextField() -> UITextField {
        
        let textField = UITextField(frame: CGRectMake(10, 10, SCREEN_WIDTH - 20, 40))
        textField.backgroundColor = UIColor.whiteColor()
        textField.delegate = self
        textField.borderStyle = .None
        textField.font = UIFont.systemFontOfSize(16)
        textField.keyboardAppearance = .Light
        textField.returnKeyType = .Done
        
        return textField
    }
    
    func showDatePicker() {
        
        UIView.animateWithDuration(0.25) { 
            self.datePicker.frame = CGRectMake(0, self.view.frame.height - 260, SCREEN_WIDTH, 300)
            self.datePickerButton.frame = CGRectMake(0, self.view.frame.height - 260 - 30, SCREEN_WIDTH, 30)
        }
    }
    
    func hideDatePicker() {
        
        UIView.animateWithDuration(0.25) {
            self.datePicker.frame = CGRectMake(0, self.view.frame.height + 30, SCREEN_WIDTH, 260)
            self.datePickerButton.frame = CGRectMake(0, self.view.frame.height, SCREEN_WIDTH, 30)
        }
    }
    
    func datePickerValueChange(picker: UIDatePicker) {
      
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = "MM月dd日 hh:mm"
//        formatter.setLocalizedDateFormatFromTemplate("MM月dd日 hh-mm")
        dateTextField.text = formatter.stringFromDate(picker.date)
    }
    
    //MARK: Handle
    func buttonClicked(sender: UIButton) {
        
        if sender == datePickerButton {
            self.hideDatePicker()
        }else {
            let title = String(format: "%@，您的联系方式为%@，预约时间为%@", nameTextField.text!, phoneTextField.text!, dateTextField.text!)
            let alert: UIAlertController = UIAlertController(title: title, message: "", preferredStyle: .Alert)
        let action0: UIAlertAction = UIAlertAction(title: "提交", style: .Default) { (alert) in
            let promptVC = PromptVC()
            self.navigationController?.pushViewController(promptVC, animated: true)
        }
        let action1: UIAlertAction = UIAlertAction(title: "取消", style: .Cancel) { (alert) in
        }
        alert.addAction(action0)
        alert.addAction(action1)
        self.presentViewController(alert, animated: true) {
        }
        }
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        if textField == dateTextField {
            self.showDatePicker()
            nameTextField.resignFirstResponder()
            phoneTextField.resignFirstResponder()
            dateTextField.resignFirstResponder()
            
            return false
        }else {
            self.hideDatePicker()
            return true
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Request
  
    //MARK: TableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        return UIView()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCellIdentifier", forIndexPath: indexPath)
        cell.selectionStyle = .None
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        if indexPath.row == 0 {
            cell.contentView.addSubview(nameTextField)
        }else if indexPath.row == 1 {
            cell.contentView.addSubview(phoneTextField)
        }else {
            cell.contentView.addSubview(dateTextField)
        }
    
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        nameTextField.resignFirstResponder()
        phoneTextField.resignFirstResponder()
        dateTextField.resignFirstResponder()
        self.hideDatePicker()
    }
}

//
//  多行文本输入框
//  UITextView.swift
//  Example
//
//  Created by 吕连勇 on 16/7/18.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class  firstViewController: UIViewController {
    /**
     * 多行文本控件
     */
    func createUITextView() -> UITextView {
        let textview = UITextView(frame: CGRectMake(10, 200, 400, 200))
        textview.layer.borderWidth = 1 // 边框粗细
        textview.layer.borderColor = UIColor.grayColor().CGColor // 边框颜色
        textview.editable = true // 是否可编辑
        textview.selectable = true // 内容是否可选
        textview.textColor = UIColor.redColor() // 设置字体颜色
        textview.font = UIFont(name: "a", size: 20) // 设置字体
        textview.textAlignment.rawValue // 设置对齐方式
        
        // 给文字中的电话号码和网址自动加上连接
        textview.dataDetectorTypes = UIDataDetectorTypes.None // 都不加连接
        textview.dataDetectorTypes = UIDataDetectorTypes.PhoneNumber // 只加电话号码
        textview.dataDetectorTypes = UIDataDetectorTypes.Link // 只加网址
        textview.dataDetectorTypes = UIDataDetectorTypes.All // 全部都加
        
        /*6，自定义选择内容后的菜单
         我们在看新闻或小说的时候，常常在点选文字后会弹出菜单进行选择，复制等操作。我们可以在这个菜单上添加一些其他内容，如加上“邮件”“微信”等按钮选项 */
        
        let mail = UIMenuItem(title: "邮件", action: #selector(firstViewController.onMail))
        let weixin = UIMenuItem(title: "微信", action: #selector(firstViewController.onWeiXin))
        let menu = UIMenuController()
        menu.menuItems = [mail, weixin]
        
        return textview;
    }
    
    func onMail(){
        print("mail")
    }
    
    func onWeiXin(){
        print("winxin")
    }

}



//
//  UIImageViewController.swift 图像控件
//  secondViewSwift
//
//  Created by 吕连勇 on 16/8/4.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class UIImageViewController: UIViewController {
    
    var imageView:UIImageView! // UIImageView
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ＊＊＊＊＊＊＊＊＊＊＊＊ 图像控件 BEGIN ＊＊＊＊＊＊＊＊＊＊＊＊
        // let imageView = UIImageView(image: UIImage(named: "icon"))
        
        // 1，使用图像控件显示图片
        // imageView.frame = CGRectMake(10, 10, 100, 100)
        
        // 2，改变图片[⚠️ 获取不了文件图片]
        // imageView.image = UIImage(named: "icon2")
        
        // 3，从文件目录中获取图片
        /*let path = NSBundle.mainBundle().pathForResource("apple", ofType: "png")
         let newImage = UIImage(contentsOfFile: path!)
         let imageView = UIImageView(image: newImage)*/
        
        // 4，从网络地址获取图片[⚠️ 获取到网络图片，可是data不了数据]
        //定义NSURL对象
        /*let url = NSURL(string: "http://hangge.com/blog/images/logo.png")
         //从网络获取数据流
         let data = NSData(contentsOfURL: url!)
         //通过数据流初始化图片
         let newImage = UIImage(data: data!)
         let imageView = UIImageView(image:newImage)*/
        
        /*5，使用图像控件实现动画播放
         UIImageView中提供了存储多张图片来创建动画的功能，具体做法是，在animationImages属性中设置一个图片数组，然后使用startAnimating方法开始动画，最后用stopAnimating方法停止动画。同时，使用animationDuration属性中可以设置动画每帧切换的速度（秒）。*/
        
        imageView=UIImageView()
        imageView.frame=CGRectMake(10,10,100,100)
        //设置动画图片
        imageView.animationImages=[UIImage(named:"icon")!,UIImage(named:"icon2")!]
        //设置每隔0.5秒变化一次
        imageView.animationDuration=0.5
        
        self.view.addSubview(imageView)
        // ＊＊＊＊＊＊＊＊＊＊＊＊ 图像控件 END ＊＊＊＊＊＊＊＊＊＊＊＊
    }
    
    /**
     * UIImageView function
     */
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.startAnimating()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        imageView.stopAnimating()
    }
}

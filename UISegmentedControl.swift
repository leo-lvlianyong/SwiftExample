//
//  UISegmentedControl.swift 选项卡
//  secondViewSwift
//
//  Created by 吕连勇 on 16/7/3.
//  Copyright © 2016年 leo. All rights reserved.
//

import UIKit

class UISegmentedControl: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ＊＊＊＊＊＊＊＊＊＊＊＊ 分段选择控件 BEGIN ＊＊＊＊＊＊＊＊＊＊＊＊
        // 选项除了文字还可以是图片[⚠️ 新版不知道为什么不能插图片了]
        // let items=["选项一","选项二",UIImage(named: "g1")!] as [AnyObject]
        let items: [AnyObject] = ["选项一","选项二"]
        let segmented = UISegmentedControl(items: items)
        segmented.center = self.view.center
        segmented.selectedSegmentIndex = 1 // 默认选中第二项
        segmented.addTarget(self, action: #selector(ThirdViewController.segmentDidchange(_:)), forControlEvents: UIControlEvents.ValueChanged) // 添加值改变监听
        
        //添加文字选项
        segmented.insertSegmentWithTitle("新建选项", atIndex: 2, animated: true)
        //添加图片选项
        // segmented.insertSegmentWithImage(UIImage(named: "segmentImage.png")!, atIndex: 3, animated: true) [⚠️ 新版不知道为什么不能插图片了]
        //移除选项
        segmented.removeSegmentAtIndex(0, animated: true)
        
        // 修改选项文字
        segmented.setTitle("swfit",forSegmentAtIndex:1)
        
        self.view.addSubview(segmented)
        // ＊＊＊＊＊＊＊＊＊＊＊＊ 分段选择控件 END ＊＊＊＊＊＊＊＊＊＊＊＊
        
    }
    
    /**
     * Segmented function
     */
    func segmentDidchange(segmented:UISegmentedControl) {
        // 获得选项的索引
        print("获得选项的索引:\(segmented.selectedSegmentIndex)")
        // 获得选择的文字
        print("获得选择的文字:\(segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex))")
    }
}




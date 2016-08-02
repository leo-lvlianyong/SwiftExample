/**
 * @Description 文本标签（UILabel）的用法
 * @author leo_lvlianyong
 * @date 2016-06-25
 */

import UIKit

class ViewController: UIViewController {
    // override 重写方法
    override func viewDidLoad() {
        super.viewDidLoad()
        let label = createUIView() // 创建标签
        
        // 2、背景颜色和文字颜色的设置
        label.textColor = UIColor.whiteColor() // 白色文字
        label.backgroundColor = UIColor.blackColor() // 黑色背景
        
        // 3，对齐方式的设置
        label.textAlignment = NSTextAlignment.Right // 文字右对齐
        
        // 4，文字阴影的设置
        label.shadowColor = UIColor.grayColor() // 灰色阴影
        label.shadowOffset = CGSizeMake(-5, 5) // 阴影的偏移量
        
        // 5，字体的设置
        label.font = UIFont(name: "Zapfino", size: 20)
        
        // 6，文字过长时的省略方式
        label.lineBreakMode = NSLineBreakMode.ByTruncatingTail // 隐藏尾部并显示省略号
        label.lineBreakMode = NSLineBreakMode.ByTruncatingMiddle // 隐藏中间部分并显示省略号
        label.lineBreakMode = NSLineBreakMode.ByTruncatingHead // 隐藏头部并显示省略号
        label.lineBreakMode = NSLineBreakMode.ByClipping // 截去多余部分也不显示省略号
        
        // 7，文字大小自适应标签宽度
        label.adjustsFontSizeToFitWidth = true // 当文字超出标签宽度时，自动调整文字大小，使其不被截断
        
        // 8，使标签可以显示多行文字
        label.numberOfLines = 2 // 显示两行文字（默认只显示一行，设为0表示没有行数限制）
        
        // 9，设置文本高亮
        label.highlighted = true // 设置文本高亮
        label.highlightedTextColor = UIColor.greenColor() // 设置文本高亮颜色
        
        
        
        self.view.addSubview(label)
    }
}

/**
 * 1、标签的创建
 */
func createUIView() -> UILabel {
    //设置标签x坐标：10，y坐标：20，长：300，宽：100
    let label = UILabel(frame: CGRectMake(10, 20, 300, 100))
    label.text = "hangge.com"
    return label
}

/**
 * 10, 富文本设置
 */
func createAttribute(label: UILabel) -> UILabel {
    
    let attributeString = NSMutableAttributedString(string: "welcome to hangge.com")
    // 从文本0开始6个字符字体HelveticaNeue-Bold,16号
    attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 16)!, range: NSMakeRange(
        0, 6))
    // 设置字体颜色
    attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(0, 3))
    
    // 设置文字背景颜色
    attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(), range: NSMakeRange(3, 3))
    
    label.attributedText = attributeString
    
    return label
}



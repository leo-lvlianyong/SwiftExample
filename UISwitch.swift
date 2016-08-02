/**
 * @Description 开关按钮（UISwitch）的用法
 * @author leo_lvlianyong
 * @date 2016-07-03
 */

import UIKit

class ViewController: UIViewController {
    var uiswitch:UISwitch!;
    override func viewDidLoad() {
        super.viewDidLoad()
        uiswitch = UISwitch()
        //设置位置（开关大小无法设置）
        uiswitch.center=CGPointMake(100,50);
        //设置默认值
        uiswitch.on=true;
        uiswitch.addTarget(self, action: #selector(switchDidChange),
                           forControlEvents:UIControlEvents.ValueChanged)
        self.view.addSubview(uiswitch);
    }
    
    func switchDidChange(){
        //打印当前值
        print(uiswitch.on)
    }
}

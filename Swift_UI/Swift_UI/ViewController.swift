//
//  ViewController.swift
//  Swift_UI
//
//  Created by youngstar on 16/10/24.
//  Copyright © 2016年 Young. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
   
    var switchButton:UISwitch!;
    var pickerView:UIPickerView!
    
    var stepper:UIStepper!
    var stepperLabel:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setButton()
//        setLabel()
//        setTextField()
//        setTextView()
//        setSwitch()
        setSegmentedControl()
//        setImage()
//        setprogress() // 进度条
//        setSlider() // 带滑块的进度条
        
//        setAlertViewButton()  // 警告窗  不能写在viewDidLoad里
//        setPickerView()
//        setStepper() // 微调器或叫步进器
//        setScrollView()
//        setCoreMotion()
        
    }
    
    func setButton()
    {
        /*
         按钮有下面四种类型：
         UIButtonType.ContactAdd：前面带“+”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.DetailDisclosure：前面带“!”图标按钮，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.System：前面不带图标，默认文字颜色为蓝色，有触摸时的高亮效果
         UIButtonType.Custom：定制按钮，前面不带图标，默认文字颜色为白色，无触摸时的高亮效果
         UIButtonType.InfoDark：为感叹号“!”圆形按钮
         UIButtonType.InfoLight：为感叹号“!”圆形按钮
         
         常用的触摸事件类型：
         TouchDown：单点触摸按下事件，点触屏幕
         TouchDownRepeat：多点触摸按下事件，点触计数大于1，按下第2、3或第4根手指的时候
         TouchDragInside：触摸在控件内拖动时
         TouchDragOutside：触摸在控件外拖动时
         TouchDragEnter：触摸从控件之外拖动到内部时
         TouchDragExit：触摸从控件内部拖动到外部时
         TouchUpInside：在控件之内触摸并抬起事件
         TouchUpOutside：在控件之外触摸抬起事件
         TouchCancel：触摸取消事件，即一次触摸因为放上太多手指而被取消，或者电话打断
         */
        

        
        // 创建一个类型为contactAdd的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        
        // 设置按钮的位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        
        //设置按钮文字
        button.setTitle("普通按钮", for:.normal)
        //        button.setTitle("触摸状态", for: .highlighted)
        //        button.setTitle("禁用状态", for: .disabled)
        
        // 设置文字颜色
        button.setTitleColor(UIColor.red, for: UIControlState.normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        
        // 设置按钮阴影颜色
        button.setTitleShadowColor(UIColor.green, for: UIControlState.normal)
        
        // 改变图片 但改后的图片是按钮的默认色：蓝色 丢失了图片的原色
        button.setImage(UIImage(named: "cocktail_dog"), for: UIControlState.normal)
        
        // 改变图片 保证图片不失真
        let buttonImage = UIImage(named:"cocktail_dog")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: UIControlState.normal)
        
        button.adjustsImageWhenHighlighted = false //使触摸模式下按钮也不会变暗（半透明）
        button.adjustsImageWhenDisabled = false //使禁用模式下按钮也不会变暗（半透明）
        
        // button的处理事件
        button .addTarget(self, action: #selector(buttonAction), for:.touchUpInside)
//        button .addTarget(self, action: #selector(action2(button:)), for:.touchUpInside)
        self.view.addSubview(button)
    }
    
    func buttonAction() {
        print("按钮无数据")
        let imageController = ImageViewController()
        let NC = UINavigationController.init(rootViewController: imageController)
//        self.navigationController?.pushViewController(NC, animated: true)
        
        self.present(NC, animated: true, completion: nil)
    }
    
    func action2(button:UIButton)
    {
        print("按钮事件:%@", button.title(for: .normal))
        let str:String =  button.title(for: .normal)!
        
        if str == "按钮" {
            print("按钮相等")
        }
    }
    
    func setLabel() {
        let label = UILabel(frame:CGRect(x:50, y:50, width:200, height:30))
        label.text = "这是一个Label"
        self.view .addSubview(label)
        
        label.backgroundColor = UIColor.lightGray
        label.textColor = UIColor.red
        label.textAlignment = NSTextAlignment.center
        
        //        label.shadowColor = UIColor.green
        //        label.shadowOffset = CGSizeMake(5, 5)
        
        // 字体的设置
        label.font = UIFont.systemFont(ofSize: 15)
        //        label.font = UIFont(name:"Zapfino", size:12)
        
        // 文字过长时的省略方式
        /*
         case byWordWrapping // Wrap at word boundaries, default
         
         case byCharWrapping // Wrap at character boundaries
         
         case byClipping // Simply clip
         
         case byTruncatingHead // Truncate at head of line: "...wxyz"
         
         case byTruncatingTail // Truncate at tail of line: "abcd..."
         
         case byTruncatingMiddle // Truncate middle of line:  "ab...yz"
         */
        
        //        label.lineBreakMode=NSLineBreakMode.byWordWrapping    // 截去多余部分也不显示省略号
        //        label.lineBreakMode=NSLineBreakMode.byCharWrapping    // 截去多余部分也不显示省略号
        //        label.lineBreakMode=NSLineBreakMode.byClipping        // 截去多余部分也不显示省略号
        //        label.lineBreakMode=NSLineBreakMode.byTruncatingHead  //隐藏头部并显示省略号
        //        label.lineBreakMode=NSLineBreakMode.byTruncatingTail  //隐藏尾部并显示省略号
        //         label.lineBreakMode=NSLineBreakMode.byTruncatingMiddle   //隐藏中间部分并显示省略号
        
        // 文字大小自适应标签宽度
        //        label.adjustsFontSizeToFitWidth=true //当文字超出标签宽度时，自动调整文字大小，使其不被截断
        
        // 自动换行，0表示没有行数限制 注意行高
        //        label.numberOfLines=2  //显示两行文字
        
        //设置文本高亮
        //        label.isHighlighted = true
        //设置文本高亮颜色
        //        label.highlightedTextColor = UIColor.green
        
        
        // 富文本的显示
        //富文本设置
        let attributeString = NSMutableAttributedString(string:"welcome to hangge.com")
        //从文本0开始6个字符字体HelveticaNeue-Bold,16号
        attributeString.addAttribute(NSFontAttributeName, value: UIFont(name: "HelveticaNeue-Bold", size: 18)!,
                                     range: NSMakeRange(0,6))
        //设置字体颜色
        attributeString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blue,
                                     range: NSMakeRange(0, 3))
        //设置文字背景颜色
        attributeString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.green,
                                     range: NSMakeRange(7,3))
        label.attributedText = attributeString
    }
    
    func setTextField() {
//        1，文本框的创建，有如下几个样式：
//        UITextBorderStyle.none：无边框
//        UITextBorderStyle.line：直线边框
//        UITextBorderStyle.roundedRect：圆角矩形边框
//        UITextBorderStyle.bezel：边线+阴影
        let textField = UITextField()
        textField.frame = CGRect(x:10, y:60, width:200, height:30)
        //设置边框样式为圆角矩形
        textField.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(textField)
        
        // 文本框提示文字
        textField.placeholder = "请在此输入内容"
        
        // 文字大小超过文本框长度时自动缩小字号，而不是隐藏显示省略号
        textField.adjustsFontSizeToFitWidth = true
        textField.minimumFontSize = 14
        
        // 水平或垂直对齐
        /** 水平对齐 **/
//        textField.textAlignment = .right //水平右对齐
//        textField.textAlignment = .center //水平居中对齐
//        textField.textAlignment = .left //水平左对齐
//        
//        /** 垂直对齐 **/
//        textField.contentVerticalAlignment = .top  //垂直向上对齐
//        textField.contentVerticalAlignment = .center  //垂直居中对齐
//        textField.contentVerticalAlignment = .bottom  //垂直向下对齐
        
         // 背景图片设置
//        textField.borderStyle = .none //先要去除边框样式
//        textField.background = UIImage(named:"Teemo");
        
        // 清除按钮（输入框内右侧小叉）
        textField.clearButtonMode = .whileEditing  //编辑时出现清除按钮
//        textField.clearButtonMode = .unlessEditing  //编辑时不出现，编辑后才出现清除按钮
//        textField.clearButtonMode = .always  //一直显示清除按钮
        
        /*
         7，设置文本框关联的键盘类型
         Default：系统默认的虚拟键盘
         ASCII Capable：显示英文字母的虚拟键盘
         Numbers and Punctuation：显示数字和标点的虚拟键盘
         URL：显示便于输入数字的虚拟键盘
         Number Pad：显示便于输入数字的虚拟键盘
         Phone Pad：显示便于拨号呼叫的虚拟键盘
         Name Phone Pad：显示便于聊天拨号的虚拟键盘
         Email Address：显示便于输入Email的虚拟键盘
         Decimal Pad：显示用于输入数字和小数点的虚拟键盘
         Twitter：显示方便些Twitter的虚拟键盘
         Web Search：显示便于在网页上书写的虚拟键盘
         */
//        textField.keyboardType = UIKeyboardType.numberPad
        
        // 使文本框在界面打开时就获取焦点，并弹出输入键盘
        textField.becomeFirstResponder()
        
        // 使文本框失去焦点，并收回键盘
//        textField.resignFirstResponder()
        
        // 设置键盘return键的样式
//        textField.returnKeyType = UIReturnKeyType.done //表示完成输入
//        textField.returnKeyType = UIReturnKeyType.go //表示完成输入，同时会跳到另一页
        textField.returnKeyType = UIReturnKeyType.search //表示搜索
//        textField.returnKeyType = UIReturnKeyType.join //表示注册用户或添加数据
//        textField.returnKeyType = UIReturnKeyType.next //表示继续下一步
//        textField.returnKeyType = UIReturnKeyType.send //表示发送
        
        // 键盘return键的响应
        textField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //收起键盘
        textField.resignFirstResponder()
        //打印出文本框中的值
        print(textField.text)
        return true;
    }
    
    
    func setTextView()  {
         let textView = UITextView.init(frame:CGRect(x:50, y:300, width:200, height:200))
         textView.text = "www.baidu.com  。请确认您已仔细阅读本告159125知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。请确认您已仔细阅读本告知书并对其内容明白无误。"
        textView.layer.borderWidth = 2 // 边框粗细
        textView.layer.borderColor = UIColor.red.cgColor //边框颜色
        self.view .addSubview(textView)
        
//        textView.isEditable = false // 是否可编辑
//        textView.isSelectable = false // 是否可选
//        textView.textColor = UIColor.blue
//        textView.font = UIFont.boldSystemFont(ofSize: 12)
//        textView.textAlignment = NSTextAlignment.center
        
          // 给文字中的电话  网址 自动添加链接  具体不知道怎么使用
//        textview.dataDetectorTypes = UIDataDetectorTypes.None //都不加链接
//        textview.dataDetectorTypes = UIDataDetectorTypes.PhoneNumber //只有电话加链接
        textView.dataDetectorTypes = UIDataDetectorTypes.link //只有网址加链接
//        textView.dataDetectorTypes = UIDataDetectorTypes.all //电话和网址都加
        
//        自定义选择内容后的菜单
        let mail = UIMenuItem(title: "邮件", action: #selector(ViewController.onMail))
        let weixin = UIMenuItem(title: "微信", action: #selector(ViewController.onWeiXin))
        let menu = UIMenuController()
        menu.menuItems = [mail,weixin]
    }
    
    func onMail(){
        print("mail")
    }
    
    func onWeiXin(){
        print("weixin")
    }
    
    
    func setSwitch()  {
        switchButton = UISwitch()
        // //设置位置（开关大小无法设置）
        switchButton.center = CGPoint(x:200, y:200)
        
        //设置默认值
//        switchButton.isOn = true;
//        UserDefaults.standard.set("true", forKey: "switchValue")
        let value2 = (UserDefaults.standard.value(forKey: "switchValue"))
        if (value2 != nil) {
            let value:String = (UserDefaults.standard.value(forKey: "switchValue") as! String)
            switchButton .setOn((value as NSString).boolValue, animated: true)
        }
        else
        {
           switchButton.isOn = true;
            print("当前状态\(switchButton.isOn)")
            UserDefaults.standard.set("true", forKey: "switchValue")
            UserDefaults.standard.synchronize()
        }
        
        switchButton.addTarget(self, action: #selector(switchAction), for:.valueChanged)
        
        self.view .addSubview(self.switchButton)
        
    }
    
    func switchAction()
    {
        //打印当前值
        print("当前状态\(switchButton.isOn)")  // 点击之后状态立即改变
        let value:String = (UserDefaults.standard.value(forKey: "switchValue") as! String)
        print( "保存的状态值：\((value as NSString).boolValue)")
        
        if (switchButton.isOn) {
            print("将值改为false，并保存")
            UserDefaults.standard.set("flase", forKey: "switchValue")
        }
        else
        {
            print("将值改为true，并保存")
            UserDefaults.standard.set("true", forKey: "switchValue")
        }
    }
    
    
    func setSegmentedControl() {
        let items = ["选项一", "选项二", UIImage(named:"cocktail_dog")!] as [Any]
        let segmented = UISegmentedControl(items:items)
        
        //        选择控件中选项的添加和删除
        segmented.insertSegment(with: UIImage(named:"Add"), at: 1, animated: true)
        segmented.insertSegment(withTitle: "小杨", at: 0, animated: true);
        
        segmented.removeSegment(at: 0, animated: true)
         segmented.removeSegment(at: 3, animated: true)
        
//        修改选项颜色（包括图片选项）
        segmented.tintColor=UIColor.red
        
        // 修改选项文字
        segmented.setTitle("swfit",forSegmentAt:1)
        
        // 修改选项图片
//        segmented.setImage(UIImage(named:"icon"),forSegmentAt:2)
        
        // 修改选项内容偏移位置
//        segmented.setContentOffset(CGSizeMake(10,7,30, 20),forSegmentAt:1)
        
        segmented.center = self.view.center
        segmented.selectedSegmentIndex = 1
        segmented .addTarget(self, action: #selector(segmentDidchange(segmented:) ), for:.valueChanged)
        self.view .addSubview(segmented)
        

    }
    
    func segmentDidchange(segmented:UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        if segmented.selectedSegmentIndex == 0
        {
           print("选择了第一个")
            
//            segmented.tintColor=UIColor.red
            (segmented.subviews[0] as UIView).tintColor = UIColor.blue
            (segmented.subviews[1] as UIView).tintColor = UIColor.red
            (segmented.subviews[2] as UIView).tintColor = UIColor.red
        }
        else if segmented.selectedSegmentIndex == 1
        {
           print("选择了第二个")
            (segmented.subviews[1] as UIView).tintColor = UIColor.blue
            (segmented.subviews[0] as UIView).tintColor = UIColor.red
            (segmented.subviews[2] as UIView).tintColor = UIColor.red
        }
        else if segmented.selectedSegmentIndex == 2
        {
           print("选择了第三个")
            (segmented.subviews[2] as UIView).tintColor = UIColor.blue
            (segmented.subviews[0] as UIView).tintColor = UIColor.red
            (segmented.subviews[1] as UIView).tintColor = UIColor.red
        }
        //获得选择的文字
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex))
    }
    
    
    func setImage()  {
        let imageView = UIImageView(image:UIImage(named:"Teemo"))
        imageView.frame = CGRect(x:100, y:100, width:100, height:100)
        self.view .addSubview(imageView)
        
        // 不让图片变形 保持图片比例
//        默认UIImageView会拉伸图片使其占满整个UIImageView，如果不想让图片变形，可以将ContentMode设置为Aspect Fit。

        imageView.contentMode = .scaleAspectFit
        
        // 更换图片 
        imageView.image = UIImage(named:"Ashe")
        
        // 从文件目录获取图片  public init?(contentsOf url: URL)
        
        // 获取网络图片
        let imageUrl = NSURL(string:"http://zttdstorage.oss-cn-hangzhou.aliyuncs.com/upload/580890fe4d904.jpg")
        // 从网络获取数据流
        let data = NSData.init(contentsOf: imageUrl as! URL)
        // 通过数据流初始化图片
        let newImage = UIImage.init(data: data as! Data)
        let newImageView = UIImageView(image:newImage)
         newImageView.frame = CGRect(x:100, y:300, width:100, height:100)
        self.view .addSubview(newImageView)
        
    }
    
    // 进度条
    func setprogress()  {
        let progressView = UIProgressView()
//        progressView.progressViewStyle = UIProgressViewStyle.bar  // 用于工具栏显示
        progressView.frame = CGRect(x:100, y:100, width:200, height:10)
        progressView.center = self.view.center
        progressView.progress = 0.66 // 进度
        
        //通过变形改变进度条高度（ 横向宽度不变，纵向高度变成默认的5倍）
        progressView.transform = CGAffineTransform(scaleX: 1.0, y: 5.0)
        
        self.view .addSubview(progressView)
        
        // 设置进度 同时有动画效果
        progressView.setProgress(0.8, animated:true)
        
        // 设置进度条颜色
        progressView.progressTintColor = UIColor.green  //已有进度颜色
        progressView.trackTintColor = UIColor.blue  //剩余进度颜色（即进度槽颜色）
        
    }
    
    func setSlider()
    {
    let slider = UISlider()
        slider.frame = CGRect(x:10, y:100, width:200, height:30)
        slider.center = self.view.center
        slider.minimumValue = 0 // 最小值
        slider.maximumValue = 1 // 最大值
//        slider.value = 0.5
        self.view .addSubview(slider)
        
        // 设置滑块的值  同时有动画
        slider.setValue(0.66, animated: true)
        
        // 滑块值改变的响应事件
//        slider.constraints = false // 滑块滑动静止后触发 ValueChanged事件
        slider .addTarget(self, action: #selector(sliderAction), for:.valueChanged)
       
//        滑块左右两边槽的颜色
        slider.minimumTrackTintColor=UIColor.red  //左边槽的颜色
        slider.maximumTrackTintColor=UIColor.green //右边槽的颜色
        
        // 滑块后面槽线两侧添加图标
        slider.minimumValueImage=UIImage(named:"Add")  //左边图标
        slider.maximumValueImage=UIImage(named:"cocktail_dog")  //右边图标
        
//        自定义滑块组件图片
//        slider.setMaximumTrackImage(UIImage(named:"Add"), for: UIControlState.normal)
//        slider.setMinimumTrackImage(UIImage(named:"cocktail_dog"), for: UIControlState.normal)
        slider.setThumbImage(UIImage(named:"Add"), for: UIControlState.normal)
        
        //设置滑块右边部分的图片-使用三宫格缩放（左右14像素不变，中间缩放）
//        let imgTrackRight = UIImage(named:"cocktail_dog")
//        let imgRight = imgTrackRight!.stretchableImage(withLeftCapWidth: 14, topCapHeight:0)
//        slider.setMaximumTrackImage(imgRight, for:UIControlState.normal)
        
    }
    
    func sliderAction(slider:UISlider)  {
        print("此时滑块的值为：\(slider.value)")
    }
    
    
    func setAlertViewButton()
    {
        
        // 创建一个类型为contactAdd的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        
        // 设置按钮的位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        
        //设置按钮文字
        button.setTitle("普通按钮", for:.normal)
        
        // 改变图片 保证图片不失真
        let buttonImage = UIImage(named:"cocktail_dog")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: UIControlState.normal)
        
        // button的处理事件
        button .addTarget(self, action: #selector(alertAction), for:.touchUpInside)
        self.view.addSubview(button)
  
    }
    
    
    func alertAction()
    {
        // 普通告警窗
//        let alertView:UIAlertController = UIAlertController(title: "警告⚠️", message: "你已超速，请注意安全行驶", preferredStyle: UIAlertControllerStyle.alert)
////        let cancelAction = UIAlertAction.init(title: "取消", style: UIAlertActionStyle.cancel, handler: nil)
//        let cancelAction = UIAlertAction(title: "好的", style: .destructive, handler: nil) // 按钮使用“告警”样式（文字颜色变红，用来来警示用户）
//        let okAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.default, handler: {
//            (action) in
//            print("点击了确定")
//        })
//        
//        alertView .addAction(cancelAction)
//        alertView .addAction(okAction)
//        
//        self.present(alertView, animated: true, completion: nil)
        
        
        // ------------------底部告警窗---------------------
        
                let alertController = UIAlertController(title: "保存或删除数据", message: "删除数据将不可恢复",
                                                        preferredStyle: .actionSheet)
                let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                let deleteAction = UIAlertAction(title: "删除", style: .destructive, handler: nil)
                let archiveAction = UIAlertAction(title: "保存", style: .default, handler: nil)
                alertController.addAction(cancelAction)
                alertController.addAction(deleteAction)
                alertController.addAction(archiveAction)
        
                self.present(alertController, animated: true, completion: nil)
        
        
        // ------------------可输入告警窗---------------------
//        let alertController = UIAlertController(title: "系统登录",
//                                                message: "请输入用户名和密码", preferredStyle: .alert)
//        alertController.addTextField {
//            (textField: UITextField!) -> Void in
//            textField.placeholder = "用户名"
//        }
//        alertController.addTextField {
//            (textField: UITextField!) -> Void in
//            textField.placeholder = "密码"
//            textField.isSecureTextEntry = true
//        }
//        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
//            action in
//            //也可以用下标的形式获取textField let login = alertController.textFields![0]
//            let login = alertController.textFields!.first!
//            let password = alertController.textFields!.last!
//            print("用户名：\(login.text) 密码：\(password.text)")
//        })
//        alertController.addAction(cancelAction)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true, completion: nil)
        
        
        
        
        // 使用代码移除提示框
//        self.presentedViewController?.dismiss(animated: false, completion: nil)
    }
    
    func setPickerView()
    {
        pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // 设置选择框默认值
        pickerView.selectRow(1, inComponent: 0, animated: true)
        pickerView.selectRow(2, inComponent: 1, animated: true)
        pickerView.selectRow(3, inComponent: 2, animated: true)
        
        self.view.addSubview(pickerView)
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        let button = UIButton()
        button.frame = CGRect(x:0 ,y:0 , width:100 , height:30 )
        button.center = self.view.center
        button.backgroundColor = UIColor.blue
        button.setTitle("获取信息", for: UIControlState.normal)
        button .addTarget(self, action: #selector(getPicker), for: UIControlEvents.touchDown)
        self.view .addSubview(button)
        
        
    }
    
    func getPicker()
    {
        let message = String(pickerView.selectedRow(inComponent: 0)) + "-"
            + String(pickerView!.selectedRow(inComponent: 1)) + "-"
            + String(pickerView.selectedRow(inComponent: 2))
        let alertController = UIAlertController(title: "被选中的索引为",
                                                message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    // 继承于UIPickerViewDataSource协议
    // 设置选择框的列数为3列
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
     //设置选择框的行数为9行
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    
    // 继承于UIPickerViewDelegate协议
    // 设置选择框各选项的内容
    func pickerView(_ pickerView:UIPickerView,titleForRow row: Int,forComponent component: Int)
        -> String?{
            return String(row)+"-"+String(component)
    }
    
//    选择框选项的内容，除了可以使字符串类型的，还可以是任意UIView类型的元素
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int,
//                    reusing view: UIView?) -> UIView {
//        let image = UIImage(named:"cocktail_dog"+String(row))
//        let imageView = UIImageView()
//        imageView.image = image
//        return imageView
//    }
    
    //设置列宽
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if(0 == component){
            //第一列变宽
            return 100
        }else{
            //第二、三列变窄
            return 60
        }
    }
    
    //设置行高
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    // 检测响应选项的选择状态
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //将在滑动停止后触发，并打印出选中列和行索引
        print(component)
        print(row)
    }
    
    
    func setStepper()  {
        stepper = UIStepper()
        stepper.center = self.view.center
        
        // 设置stepper的范围和初始值
        stepper.maximumValue = 10
        stepper.minimumValue = 1
        stepper.value = 5.5
        
        // 设置每次的增减值
        stepper.stepValue = 0.5
        // 设置stepper可以按着不放 连续改变值
        stepper.isContinuous = true

        //设置stepper是否循环（到最大值时再增加数值从最小值开始）
        stepper.wraps = true
        stepper .addTarget(self, action: #selector(stepperAction), for: UIControlEvents.valueChanged)
        self.view .addSubview(stepper)
        
        stepperLabel = UILabel()
        stepperLabel.frame = CGRect(x:130, y:270, width:300, height:30)
        print("stepper的值为：\(stepper.value)")
        stepperLabel.text = "当前值为：\(stepper.value)"
        self.view .addSubview(stepperLabel)
        
        // 使用tintColor属性可以设置微调器的颜色。 而加减符号图标，背景图片，中间分割线图片都可以替换成自己图片。
        let minusImage = UIImage(named:"minus")?.withRenderingMode(.alwaysOriginal)
        let AddImage = UIImage(named:"Add")?.withRenderingMode(.alwaysOriginal)
        stepper.setDecrementImage(minusImage, for: UIControlState.normal)
        stepper.setIncrementImage(AddImage, for: UIControlState.normal)
    }
    
    func stepperAction()  {
        stepperLabel.text="当前值为：\(stepper.value)"
    }

    func setScrollView()  {
        // 创建一个类型为contactAdd的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        
        // 设置按钮的位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        
        //设置按钮文字
        button.setTitle("普通按钮", for:.normal)
        
        // 改变图片 保证图片不失真
        let buttonImage = UIImage(named:"cocktail_dog")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: UIControlState.normal)
        
        // button的处理事件
        button .addTarget(self, action: #selector(scrollAction), for:.touchUpInside)
        self.view.addSubview(button)
    }
    
    func scrollAction()  {
       let scrollView = ScrollViewController()
        let NC = UINavigationController.init(rootViewController: scrollView)
        self.present(NC, animated: true, completion: nil)
    }
    
    
    
    // 传感器
    func setCoreMotion()  {
        
        // 创建一个类型为contactAdd的按钮
        let button:UIButton = UIButton(type:.contactAdd)
        
        // 设置按钮的位置和大小
        button.frame = CGRect(x:10, y:150, width:100, height:30)
        
        //设置按钮文字
        button.setTitle("普通按钮", for:.normal)
        
        // 改变图片 保证图片不失真
        let buttonImage = UIImage(named:"cocktail_dog")?.withRenderingMode(.alwaysOriginal)
        button.setImage(buttonImage, for: UIControlState.normal)
        
        // button的处理事件
        button .addTarget(self, action: #selector(coreMotionAction), for:.touchUpInside)
        self.view.addSubview(button)

    }
    
    func coreMotionAction()  {
        let coreMotion = CoreMotionViewController()
        let NC = UINavigationController.init(rootViewController: coreMotion)
        self.present(NC, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ImageViewController.swift
//  Swift_UI
//
//  Created by youngstar on 16/10/25.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    var imageView:UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "动画播放"
        
         addBackBtn()
        
        imageView = UIImageView()
        imageView.frame = CGRect(x:100, y:100, width:200, height:200)
        
        // 设置动画
        imageView.animationImages = [UIImage(named:"Ashe")!, UIImage(named:"Teemo")!]
        // 每隔0.5秒变化一次
        imageView.animationDuration = 0.5
        self.view .addSubview(imageView)

        // Do any additional setup after loading the view.
    }
    
    //1.添加返回按钮
    
    func addBackBtn(){
        
        let buttonImage = UIImage(named:"Add")?.withRenderingMode(.alwaysOriginal)
        
        let leftBtn:UIBarButtonItem=UIBarButtonItem(image:buttonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(actionBack))
        self.navigationItem.leftBarButtonItem = leftBtn;
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
        self.dismiss(animated: true, completion: nil)   
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageView.startAnimating()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        imageView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

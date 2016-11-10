//
//  ScrollViewController.swift
//  Swift_UI
//
//  Created by youngstar on 16/10/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController , UIScrollViewDelegate{
    
    let numOfPage = 3
    let pageWidth = 375
    let pageHeight = 360
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "UIScrollView"
        self.view.backgroundColor = UIColor.lightGray
        
        addBackBtn()
        
//        setScroll()
        
        setPageScroll()
    }
    
    func addBackBtn(){
        
        let buttonImage = UIImage(named:"Add")?.withRenderingMode(.alwaysOriginal)
        
        let leftBtn:UIBarButtonItem=UIBarButtonItem(image:buttonImage, style: UIBarButtonItemStyle.plain, target: self, action: #selector(actionBack))
        self.navigationItem.leftBarButtonItem = leftBtn;
        
    }
    
    //返回按钮事件
    
    func actionBack(){
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func setScroll() {
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        let imageView = UIImageView(image:UIImage(named:"guid1"))
        //        imageView.frame = self.view.frame
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        scrollView .addSubview(imageView)
        self.view .addSubview(scrollView)
        
        // 手势放大缩小 需要指定UIScrollView的允许缩放最大比例和最小比例（默认都是是1.0）
        scrollView.minimumZoomScale = 0.1  //最小比例
        scrollView.maximumZoomScale = 3   //最大比例

    }
    
    // UIScrollViewDelegate事件
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
         print("x:\(scrollView.contentOffset.x) y:\(scrollView.contentOffset.y)")
    }
    
//    // 缩小放大的事件
//    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
//        for subview : AnyObject in scrollView.subviews {
//            if subview.isKind(UIImageView) {
//                return subview as? UIView
//            }
//        }
//        return nil
//    }
    
    
    func setPageScroll()  {
        
        let scrollView = UIScrollView()
        scrollView.frame = self.view.bounds
        
        // 为了让内容横向滚动，设置横向内容宽度为3个页面的宽度总和
        scrollView.contentSize = CGSize(width:pageWidth * 3, height:pageHeight)
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        scrollView.scrollsToTop = false
        
        // 添加子页面
        for i in 0..<numOfPage {
            let myViewController = MyViewController(number:(i + 1))
            myViewController.view.frame = CGRect(x:pageWidth * i, y:0, width:pageWidth, height:pageHeight)
           scrollView .addSubview(myViewController.view)
        }
        self.view .addSubview(scrollView)
        
    }


}

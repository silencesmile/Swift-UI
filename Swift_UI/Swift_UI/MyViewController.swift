//
//  MyViewController.swift
//  Swift_UI
//
//  Created by youngstar on 16/10/26.
//  Copyright © 2016年 Young. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {
    
    var number:Int!
    let colorMap=[
        1:UIColor.black,
        2:UIColor.orange,
        3:UIColor.blue
    ]
    
    init(number initNumber:Int){
        self.number = initNumber
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let numberLabel = UILabel(frame:CGRect(x:130, y:50, width:150, height:30))
        numberLabel.text = "第\(number)页"
        numberLabel.textColor = UIColor.white
        self.view.addSubview(numberLabel)
        self.view.backgroundColor = colorMap[number]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

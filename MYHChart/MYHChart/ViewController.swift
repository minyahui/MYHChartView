//
//  ViewController.swift
//  MYHChart
//  作者Github地址：https://github.com/minyahui
//  作者博客地址：http://www.cnblogs.com/myh1036166261/
//  作者邮箱：18871573674@163.com
//  Created by yyy－mac on 2016/11/11.
//  Copyright © 2016年 minyahui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let dataArray : NSArray = [["total":"100","right":"80","date":"09/09"],["total":"50","right":"30","date":"09/12"],["total":"75","right":"60","date":"09/14"],["total":"100","right":"80","date":"09/15"],["total":"100","right":"90","date":"09/16"],["total":"180","right":"80","date":"09/20"],["total":"100","right":"30","date":"09/26"],["total":"170","right":"80","date":"09/29"]]
        var mutableArr : [MYHChartModel] = []
        for item in dataArray {
            let model = MYHChartModel()
            model.setValuesForKeys(item as! [String : Any])
            mutableArr.append(model)
        }
        let chart :MYHChartView?
        chart = MYHChartView.init(frame: CGRect.init(x: 0, y: 64+10, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-100))
        chart?.loadData(YMaxValue: 200, XValues: mutableArr, totalColor: UIColor.init(red: 0.27, green: 0.44, blue: 0.65, alpha: 1), trueColor: UIColor.init(red: 0.67, green: 0.27, blue: 0.26, alpha: 1), userPhoto: "mars_student__apply_item_default_avatar", userName: "游泳的小叶子")
        view.addSubview(chart!)
    }
}


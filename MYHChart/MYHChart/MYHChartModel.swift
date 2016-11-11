//
//  MYHChartModel.swift
//  MYHChart
//
//  作者Github地址：https://github.com/minyahui
//  作者博客地址：http://www.cnblogs.com/myh1036166261/
//  作者邮箱：18871573674@163.com
//
//  Created by yyy－mac on 2016/11/11.
//  Copyright © 2016年 minyahui. All rights reserved.
//

import UIKit

class MYHChartModel: NSObject {
    /**所有的题*/
    var total : String = ""
    /**正确的题**/
    var right : String = ""
    /**日期**/
    var date : String = ""
    //描述， 可以在调试的时候打印输出
    override internal var description: String {
        return "{total:\(total)\n dui:\(right)\n date:\(date)\n}"
    }
}

//
//  UIView+MYHFrame.swift
//  MYHChart
//  作者Github地址：https://github.com/minyahui
//  作者博客地址：http://www.cnblogs.com/myh1036166261/
//  作者邮箱：18871573674@163.com
//  Created by yyy－mac on 2016/11/11.
//  Copyright © 2016年 minyahui. All rights reserved.
//

import UIKit
extension UIView {
    var size : CGSize {
        get{
            return self.frame.size
        }
        set{
            var newFrame = self.frame
            newFrame.size = newValue
            self.frame = newFrame
        }
    }
    var height : CGFloat {
        get{
            return self.frame.size.height
        }
        set{
            var newFrame = self.frame
            newFrame.size = CGSize.init(width: self.frame.size.width, height: newValue)
            self.frame = newFrame
        }
    }
    var width : CGFloat {
        get{
            return self.frame.size.width
        }
        set{
            var newFrame = self.frame
            newFrame.size = CGSize.init(width: newValue, height: self.frame.size.height)
            self.frame = newFrame
        }
    }
    var x : CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            var newFrame = self.frame
            newFrame.origin = CGPoint.init(x: newValue, y: newFrame.origin.y)
            self.frame = newFrame
        }
    }
    var y : CGFloat {
        get{
            return self.frame.origin.y
        }
        set{
            var newFrame = self.frame
            newFrame.origin = CGPoint.init(x: newFrame.origin.x, y: newValue)
            self.frame = newFrame
        }
    }
    private(set) var maxX : CGFloat {
        get{
            return self.frame.size.width+self.frame.origin.x
        }
        set{
    
        }
    }
    private(set) var midX : CGFloat {
        get{
            return (self.frame.size.width+self.frame.origin.x)/2.0
        }
        set{
            
        }
    }
    private(set) var maxY : CGFloat {
        get{
            return self.frame.size.height+self.frame.origin.y
        }
        set{
            
        }
    }
    private(set) var midY : CGFloat {
        get{
            return (self.frame.size.height+self.frame.origin.y)/2
        }
        set{
            
        }
    }
}


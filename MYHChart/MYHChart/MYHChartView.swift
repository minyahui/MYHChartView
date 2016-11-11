//
//  MYHChartView.swift
//  MYHChart
//  作者Github地址：https://github.com/minyahui
//  作者博客地址：http://www.cnblogs.com/myh1036166261/
//  作者邮箱：18871573674@163.com
//  Created by yyy－mac on 2016/11/11.
//  Copyright © 2016年 minyahui. All rights reserved.
//

import UIKit

class MYHChartView: UIView {
    /****Y轴的最大值*****/
    var YMaxValue:NSInteger?
    /****y轴的值*****/
    var YValues:NSArray?
    /****总题数的颜色*****/
    var totalColor:UIColor?
    /****正确题数的颜色*****/
    var trueColor:UIColor?
    /****各个题所对应的值 x轴的值*****/
    var XValues:[MYHChartModel]?
    var backSc :UIScrollView?
    var userName = ""
    var userPhoto = ""
    
    private let kYDistanceValue:CGFloat = 40.0
    private let kTopDistanceValue:CGFloat = 20.0
    private let kXDistanceValue:CGFloat = 50.0
    private let kXWidthValue:CGFloat = 10.0
    
    internal func loadData(YMaxValue:NSInteger,XValues:[MYHChartModel] ,totalColor:UIColor,  trueColor:UIColor , userPhoto : String, userName : String){
        self.YMaxValue = YMaxValue;
        self.totalColor = totalColor;
        self.trueColor = trueColor;
        self.XValues = XValues;
        self.userName = userName
        self.userPhoto = userPhoto
        self.createXView()
        self.createLineView()
        self.createUserInfo()
    }
    private func createLineView(){//Y坐标
        for index in 0 ..< 5 {
            let lineView = UIView.init(frame: CGRect.init(x: kXDistanceValue, y: CGFloat(index)*(kYDistanceValue+1.0)+kYDistanceValue+kTopDistanceValue , width: self.frame.size.width-kXDistanceValue, height: 1))
            lineView.backgroundColor = UIColor.gray
            
            let yValueLabel = UILabel.init(frame: CGRect.init(x: 0, y: lineView.frame.midY-10, width: kXDistanceValue-10.0, height: 20))
            yValueLabel.textAlignment = .right
            yValueLabel.textColor = UIColor.init(colorLiteralRed: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            yValueLabel.text = String(self.YMaxValue!-self.YMaxValue!/5*index)
            yValueLabel.font = UIFont.systemFont(ofSize: 10)
            self.addSubview(yValueLabel)
            
            let yOValueLabel = UILabel.init(frame: CGRect.init(x: 0, y: (kYDistanceValue+1)*6-10+kTopDistanceValue, width: kXDistanceValue-10, height: 20))
            yOValueLabel.textAlignment = .right
            yOValueLabel.textColor = UIColor.init(colorLiteralRed: 0.4, green: 0.4, blue: 0.4, alpha: 1)
            yOValueLabel.text = "0"
            yOValueLabel.font = UIFont.systemFont(ofSize: 10)
            self.addSubview(yOValueLabel)
        }
    }
    private func createXView(){
        var xValue:CGFloat?
        if CGFloat((self.XValues?.count)!)*(100+kXWidthValue*2)>self.frame.size.width {
            xValue = CGFloat((self.XValues?.count)!)*(100+kXWidthValue*2)
        }else{
            xValue = self.frame.size.width
        }
        self.backSc = UIScrollView.init(frame: CGRect.init(x: kXDistanceValue, y: 40, width: self.frame.size.width-kXDistanceValue, height: (kYDistanceValue)*5+25+kTopDistanceValue))
        self.backSc?.showsVerticalScrollIndicator = false
        self.backSc?.showsHorizontalScrollIndicator = false
        //        self.backSc?.backgroundColor = UIColor.yellow
        self.backSc?.contentSize = CGSize.init(width: xValue!, height: 20)
        self.backSc?.bounces = true
        self.addSubview((self.backSc)!)
        //白色背景
        let backView = UIView.init(frame: CGRect.init(x: 0, y: kTopDistanceValue, width: xValue!, height: (kYDistanceValue)*5+25))
        backView.backgroundColor = UIColor.white
        self.backSc?.addSubview(backView)
        //5条线
        for index in 0..<5 {
            let lineView = UIView.init(frame: CGRect.init(x: 0, y: CGFloat(index)*(kYDistanceValue+1.0)+kTopDistanceValue , width: xValue!, height: 0.5))
            lineView.backgroundColor = UIColor.gray
            self.backSc?.addSubview(lineView)
        }
        //X轴
        let XView = UIView.init(frame: CGRect.init(x: 0, y: (kYDistanceValue+1)*5+kTopDistanceValue, width: xValue!, height: 1))
        XView.backgroundColor = UIColor.init(colorLiteralRed: 0.75, green: 0.82, blue: 0.88, alpha: 1)
        self.backSc?.addSubview(XView)
        //x轴的坐标
        for i in 0..<self.XValues!.count {
            let xlabel : UILabel = UILabel.init(frame: CGRect.init(x: CGFloat(i)*(kXWidthValue*2+100), y: (kYDistanceValue+1)*5+kTopDistanceValue, width: kXWidthValue*2+40, height: 20))
            let model : MYHChartModel = self.XValues![i]
            xlabel.text = model.date
            xlabel.textAlignment = .center
            xlabel.font = UIFont.systemFont(ofSize: 12)
            self.backSc?.addSubview(xlabel)
            //所有的题 条线图
            let totalHeight = CGFloat((model.total as NSString).floatValue)/(CGFloat(self.YMaxValue!))*5*(kYDistanceValue+1)
            let xTotalValue : UILabel = UILabel.init(frame: CGRect.init(x: xlabel.frame.midX-kXWidthValue, y: xlabel.frame.origin.y, width: kXWidthValue, height: 0))
            xTotalValue.backgroundColor = self.totalColor
            xTotalValue.font = UIFont.systemFont(ofSize: 10)
            xTotalValue.textAlignment = .center
            self.backSc?.addSubview(xTotalValue)
            //所有的题 数字
            let totalValueLabel : UILabel = UILabel.init(frame: CGRect.init(x: xTotalValue.frame.origin.x-6, y: xlabel.frame.origin.y-totalHeight-18-13, width: 100, height: 15))
            totalValueLabel.text = model.total
            totalValueLabel.font = UIFont.systemFont(ofSize: 10)
            totalValueLabel.textColor = UIColor.black
            
           
            
            self.backSc?.addSubview(totalValueLabel)
            //对的题 条线图
            let trueHeight = CGFloat((model.right as NSString).floatValue)/(CGFloat(self.YMaxValue!))*5*(kYDistanceValue+1)
            let xTureLabel : UILabel = UILabel.init(frame: CGRect.init(x: xlabel.frame.midX, y: xlabel.frame.origin.y, width: kXWidthValue, height: 0))
            xTureLabel.backgroundColor = self.trueColor
            xTureLabel.font = UIFont.systemFont(ofSize: 10)
            xTureLabel.textAlignment = .center
            self.backSc?.addSubview(xTureLabel)
            //对的题 数字
            let tureValueLabel : UILabel = UILabel.init(frame: CGRect.init(x: xTureLabel.frame.origin.x-3, y: xlabel.frame.origin.y-trueHeight-18-15, width: 100, height: 15))
            tureValueLabel.text = model.right
            tureValueLabel.font = UIFont.systemFont(ofSize: 10)
            tureValueLabel.textColor = UIColor.black
            
            self.backSc?.addSubview(tureValueLabel)
            UIView.animate(withDuration: 1.0, animations: {
                xTotalValue.y = xlabel.frame.origin.y-totalHeight
                xTotalValue.height = totalHeight
                xTureLabel.y = xlabel.frame.origin.y-trueHeight
                xTureLabel.height = trueHeight
                let transform : CGAffineTransform = CGAffineTransform.init(rotationAngle:CGFloat(-M_PI_4/2.0))
                totalValueLabel.transform = transform
                tureValueLabel.transform = transform
            }, completion: { (finish) in
                    
            })
        }
    }
    private func createUserInfo(){
        let width = self.Width(height: 15, font: UIFont.systemFont(ofSize: 10), text: self.userName)
        
        let photoImageView = UIImageView.init(frame: .init(x: 10, y: 0, width: 30, height: 30))
        photoImageView.image = UIImage.init(named: self.userPhoto)
        photoImageView.layer.cornerRadius = 15
        photoImageView.layer.masksToBounds = true
        self.addSubview(photoImageView)
        
        let nameLabel : UILabel = UILabel.init(frame: .init(x: photoImageView.maxX+5, y: photoImageView.midY-10, width: width, height: 20))
        nameLabel.backgroundColor = UIColor.clear
        nameLabel.textColor = UIColor.init(red: 0.24, green: 0.34, blue: 0.44, alpha: 1)
        nameLabel.text = self.userName
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.textAlignment = .center
        self.addSubview(nameLabel)
        
        let totalWidth = self.Width(height: 20, font: UIFont.systemFont(ofSize: 10), text: "总题数")
        let trueWidth = self.Width(height: 20, font: UIFont.systemFont(ofSize: 10), text: "正确题数")
        let totalView :UIView = UIView.init(frame: CGRect.init(x: (UIScreen.main.bounds.size.width-totalWidth-trueWidth-40-30),y: nameLabel.midY-7.5, width: 20, height: 15 ))
        totalView.backgroundColor = self.totalColor
        self.addSubview(totalView)
        
        
        let totalLabel : UILabel = UILabel.init(frame: CGRect.init(x: totalView.frame.maxX+5, y: totalView.frame.midY-10, width: totalWidth, height: 20))
        totalLabel.backgroundColor = UIColor.clear
        totalLabel.textColor = UIColor.init(red: 0.24, green: 0.34, blue: 0.44, alpha: 1)
        totalLabel.text = "总题数"
        totalLabel.font = UIFont.systemFont(ofSize: 10)
        totalLabel.textAlignment = .left
        self.addSubview(totalLabel)
        
        let trueView : UIView = UIView.init(frame: CGRect.init(x: totalLabel.maxX+10, y: totalView.frame.midY-7.5, width: 20, height: 15 ))
        trueView.backgroundColor = self.trueColor
        self.addSubview(trueView)
        
        let trueLabel : UILabel =  UILabel.init(frame: CGRect.init(x: trueView.frame.maxX+5, y: trueView.frame.midY-10, width: trueWidth, height: 20))
        trueLabel.backgroundColor = UIColor.clear
        trueLabel.textColor = UIColor.init(red: 0.24, green: 0.34, blue: 0.44, alpha: 1)
        trueLabel.text = "正确题数"
        trueLabel.font = UIFont.systemFont(ofSize: 10)
        trueLabel.textAlignment = .left
        self.addSubview(trueLabel)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    internal func Width(height :CGFloat , font :UIFont, text :String)->(CGFloat){
        let frame = text.boundingRect(with: CGSize.init(width: CGFloat(MAXFLOAT), height: height), options: [.usesFontLeading,.usesLineFragmentOrigin], attributes: [NSFontAttributeName:font], context: nil)
        return frame.width
    }
    internal func Height(width :CGFloat , font :UIFont, text :String)->(CGFloat){
        let frame = text.boundingRect(with: CGSize.init(width:width , height: CGFloat(MAXFLOAT)), options: [.usesFontLeading,.usesLineFragmentOrigin], attributes: [NSFontAttributeName:font], context: nil)
        return frame.height
    }
}

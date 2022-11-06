//
//  RentalHousingViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 06.10.2022.
//

import UIKit

class RentalHousingViewController: UIViewController {
    
    var txt = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.endEditing(true)

        title = "Арендное жилье"
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: view.frame.size.width, height: view.frame.size.height - 100))
        view.addSubview(scrollView)

        let lbl0 = UILabel()
        let lbl1 = UILabel()
        let lbl2 = UILabel()
        let lbl3 = UILabel()
        let lbl4 = UILabel()
        let lbl5 = UILabel()
        let lbl6 = UILabel()
        let lbl7 = UILabel()
        let lbl8 = UILabel()
        let lbl9 = UILabel()
        let lbl10 = UILabel()
        let lbl11 = UILabel()
        let lbl12 = UILabel()
        let lbl13 = UILabel()
        
        let lbltemp = UILabel()
        lbltemp.text = "123"
        lbltemp.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        
        var lowestY = 0
        var tempHeight = 0
        let w = Int(view.frame.size.width - 20)
        
        lbl0.text = txt[0]
        lbl0.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl0.numberOfLines = 0
        tempHeight = Int(lbl0.intrinsicContentSize.height)
        lbl0.frame = CGRect(x: 10, y: 10, width: w, height: tempHeight)
        lowestY += tempHeight + 20
        
        lbl1.text = txt[1]
        lbl1.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl1.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl1.text!.count) / 45) * lbltemp.intrinsicContentSize.height + 10)
        lbl1.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl2.text = txt[2]
        lbl2.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl2.numberOfLines = 0
        tempHeight = Int(lbl2.intrinsicContentSize.height)
        lbl2.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl3.text = txt[3]
        lbl3.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl3.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl3.text!.count) / 27) * lbltemp.intrinsicContentSize.height + 10)
        lbl3.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl4.text = txt[4]
        lbl4.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl4.numberOfLines = 0
        tempHeight = Int(lbl4.intrinsicContentSize.height)
        lbl4.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl5.text = txt[5]
        lbl5.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl5.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl5.text!.count) / 40) * lbltemp.intrinsicContentSize.height + 10)
        lbl5.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl6.text = txt[6]
        lbl6.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl6.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl4.text!.count) / 35) * lbltemp.intrinsicContentSize.height + 10)
        lbl6.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl7.text = txt[7]
        lbl7.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl7.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl7.text!.count) / 24) * lbltemp.intrinsicContentSize.height + 10)
        lbl7.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10

        lbl8.text = txt[8]
        lbl8.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl8.numberOfLines = 0
        tempHeight = Int(lbl8.intrinsicContentSize.height)
        lbl8.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl9.text = txt[9]
        lbl9.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl9.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl9.text!.count) / 20) * lbltemp.intrinsicContentSize.height + 10)
        lbl9.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10

        lbl10.text = txt[10]
        lbl10.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl10.numberOfLines = 0
        tempHeight = Int(lbl10.intrinsicContentSize.height)
        lbl10.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl11.text = txt[11]
        lbl11.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl11.numberOfLines = 0
        tempHeight = Int( ceil(Double(lbl11.text!.count) / 43) * lbltemp.intrinsicContentSize.height + 10)
        lbl11.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10

        lbl12.text = txt[12]
        lbl12.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        lbl12.numberOfLines = 0
        tempHeight = Int(lbl12.intrinsicContentSize.height)
        lbl12.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10
        
        lbl13.text = txt[13]
        lbl13.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lbl13.numberOfLines = 0
        tempHeight = Int(CGFloat((lbl13.text!.count / 42))*lbltemp.intrinsicContentSize.height)
        lbl13.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        lowestY += tempHeight + 10

//        scrollView.contentSize = CGSize(width: 390, height: 2000)
        scrollView.contentSize = CGSize(width: Int(view.frame.size.width), height: Int(lowestY))
//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: lowestY)

        scrollView.addSubview(lbl0)
        scrollView.addSubview(lbl1)
        scrollView.addSubview(lbl2)
        scrollView.addSubview(lbl3)
        scrollView.addSubview(lbl4)
        scrollView.addSubview(lbl5)
        scrollView.addSubview(lbl6)
        scrollView.addSubview(lbl7)
        scrollView.addSubview(lbl8)
        scrollView.addSubview(lbl9)
        scrollView.addSubview(lbl10)
        scrollView.addSubview(lbl11)
        scrollView.addSubview(lbl12)
        scrollView.addSubview(lbl13)
    }
}

//
//  MortgageDetailsViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 02.10.2022.
//

import UIKit

class MortgageDetailsViewController: UIViewController {
    let h = UIScreen.main.bounds.height - 88

    let w = UIScreen.main.bounds.width - 20
    var tempHeight: CGFloat = 0.0
    
    var lowestY: CGFloat = 0.0
    
    var id = -1
    var name = ""
    var AEIR = 0.0 // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    var firstStageRate = 0.0
    var ageOfBorrower = [""]
    var initialFee = ""
    var maxCredit = 0
    var continuousWorkExperience = ""
    
    var minTerm = 0
    var maxTerm = 0
    
    var feePercent = 0.0
    var feeInitial = 0.0
    
    var properties = [""]
    var whereToApply = [""]
    var details = [""]
    var detailsColors = [""]
    var detailsFull = ""
    var imageName = ""

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88))
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ипотека"
        print(id)
        print(name)
        
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        nameLabel.numberOfLines = 2
        
        scrollView.addSubview(nameLabel)
        nameLabel.text = name
        nameLabel.backgroundColor = .gray
        tempHeight = nameLabel.intrinsicContentSize.height*2
        
        nameLabel.frame = CGRect(x: 10, y: 10, width: w, height: tempHeight)
        
        lowestY = 20 + tempHeight
        
        
        let detailsFullLabel = UILabel()
        detailsFullLabel.font = .systemFont(ofSize: 16, weight: .light)
        detailsFullLabel.numberOfLines = 0
        
        scrollView.addSubview(detailsFullLabel)
        detailsFullLabel.text = detailsFull
        
        tempHeight = CGFloat((detailsFullLabel.text!.count / 45))*detailsFullLabel.intrinsicContentSize.height
        detailsFullLabel.backgroundColor = .lightGray
        detailsFullLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 20
        
        let aeirLabel = UILabel()
        aeirLabel.font = .systemFont(ofSize: 14, weight: .light)
        aeirLabel.numberOfLines = 0
        aeirLabel.textColor = .gray
        
        scrollView.addSubview(aeirLabel)
        aeirLabel.text = "ГЭСВ"
        
        tempHeight = aeirLabel.intrinsicContentSize.height
        aeirLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let aeirValue = UILabel()
        aeirValue.font = .systemFont(ofSize: 14, weight: .light)
        aeirValue.numberOfLines = 0
        
        scrollView.addSubview(aeirValue)
        aeirValue.text = "\(AEIR)%"
        
        tempHeight = aeirValue.intrinsicContentSize.height
        aeirValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        
        
        let firstStageRateLabel = UILabel()
        firstStageRateLabel.font = .systemFont(ofSize: 14, weight: .light)
        firstStageRateLabel.numberOfLines = 0
        firstStageRateLabel.textColor = .gray
        
        scrollView.addSubview(firstStageRateLabel)
        firstStageRateLabel.text = "Ставка первого этапа"
        
        tempHeight = firstStageRateLabel.intrinsicContentSize.height
        firstStageRateLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let firstStageRateValue = UILabel()
        firstStageRateValue.font = .systemFont(ofSize: 14, weight: .light)
        firstStageRateValue.numberOfLines = 0
        
        scrollView.addSubview(firstStageRateValue)
        firstStageRateValue.text = "\(firstStageRate)%"
        
        tempHeight = firstStageRateValue.intrinsicContentSize.height
        firstStageRateValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        
        
        let ageOfBorrowerLabel = UILabel()
        ageOfBorrowerLabel.font = .systemFont(ofSize: 14, weight: .light)
        ageOfBorrowerLabel.numberOfLines = 0
        ageOfBorrowerLabel.textColor = .gray
        
        scrollView.addSubview(ageOfBorrowerLabel)
        ageOfBorrowerLabel.text = "Возраст заемщика"
        
        tempHeight = ageOfBorrowerLabel.intrinsicContentSize.height
        ageOfBorrowerLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let ageOfBorrowerValue = UILabel()
        ageOfBorrowerValue.font = .systemFont(ofSize: 14, weight: .light)
        ageOfBorrowerValue.numberOfLines = 2
        
        scrollView.addSubview(ageOfBorrowerValue)
    
        var myString = ageOfBorrower[0] + "\n" + ageOfBorrower[1]
        
        ageOfBorrowerValue.text = myString
        
        tempHeight = ageOfBorrowerValue.intrinsicContentSize.height
        ageOfBorrowerValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        
        
        let initialFeeLabel = UILabel()
        initialFeeLabel.font = .systemFont(ofSize: 14, weight: .light)
        initialFeeLabel.numberOfLines = 0
        initialFeeLabel.textColor = .gray
        
        scrollView.addSubview(initialFeeLabel)
        initialFeeLabel.text = "Первоначальный взнос"
        
        tempHeight = initialFeeLabel.intrinsicContentSize.height
        initialFeeLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let initialFeeValue = UILabel()
        initialFeeValue.font = .systemFont(ofSize: 14, weight: .light)
        initialFeeValue.numberOfLines = 0
        
        scrollView.addSubview(initialFeeValue)
        initialFeeValue.text = initialFee
        
        tempHeight = initialFeeValue.intrinsicContentSize.height
        initialFeeValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        
        
        let maxCreditLabel = UILabel()
        maxCreditLabel.font = .systemFont(ofSize: 14, weight: .light)
        maxCreditLabel.numberOfLines = 0
        maxCreditLabel.textColor = .gray
        
        scrollView.addSubview(maxCreditLabel)
        maxCreditLabel.text = "Максимальный кредит"
        
        tempHeight = maxCreditLabel.intrinsicContentSize.height
        maxCreditLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let maxCreditValue = UILabel()
        maxCreditValue.font = .systemFont(ofSize: 14, weight: .light)
        maxCreditValue.numberOfLines = 0
        
        scrollView.addSubview(maxCreditValue)
        maxCreditValue.text = "\(maxCredit / 1000000) млн 〒"
        
        tempHeight = maxCreditValue.intrinsicContentSize.height
        maxCreditValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10


        
        
        let continuousWorkExperienceLabel = UILabel()
        continuousWorkExperienceLabel.font = .systemFont(ofSize: 14, weight: .light)
        continuousWorkExperienceLabel.numberOfLines = 0
        continuousWorkExperienceLabel.textColor = .gray
        
        scrollView.addSubview(continuousWorkExperienceLabel)
        continuousWorkExperienceLabel.text = "Непрерывный трудовой стаж"
        
        tempHeight = continuousWorkExperienceLabel.intrinsicContentSize.height
        continuousWorkExperienceLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let continuousWorkExperienceValue = UILabel()
        continuousWorkExperienceValue.font = .systemFont(ofSize: 14, weight: .light)
        continuousWorkExperienceValue.numberOfLines = 0
        
        scrollView.addSubview(continuousWorkExperienceValue)
        continuousWorkExperienceValue.text = continuousWorkExperience
        
        tempHeight = continuousWorkExperienceValue.intrinsicContentSize.height
        continuousWorkExperienceValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10
        
        
        
        
        let maxTermLabel = UILabel()
        maxTermLabel.font = .systemFont(ofSize: 14, weight: .light)
        maxTermLabel.numberOfLines = 0
        maxTermLabel.textColor = .gray
        
        scrollView.addSubview(maxTermLabel)
        maxTermLabel.text = "Срок"
        
        tempHeight = maxTermLabel.intrinsicContentSize.height
        maxTermLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let maxTermValue = UILabel()
        maxTermValue.font = .systemFont(ofSize: 14, weight: .light)
        maxTermValue.numberOfLines = 0
        
        scrollView.addSubview(maxTermValue)
        maxTermValue.text = "до \(maxTerm) лет"
        
        tempHeight = maxTermValue.intrinsicContentSize.height
        maxTermValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10



        
        let feeLabel = UILabel()
        feeLabel.font = .systemFont(ofSize: 14, weight: .light)
        feeLabel.numberOfLines = 0
        feeLabel.textColor = .gray
        
        scrollView.addSubview(feeLabel)
        feeLabel.text = "Комиссия на оформление"
                
        tempHeight = feeLabel.intrinsicContentSize.height
        feeLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let feeValue = UILabel()
        feeValue.font = .systemFont(ofSize: 14, weight: .light)
        feeValue.numberOfLines = 0
        
        scrollView.addSubview(feeValue)
        
//        print("feepercent = \(feePercent), feeinitial = \(feeInitial)")

        if feePercent != 0 {
            if feeInitial <= 0.05 {
                feeValue.text = "\(feePercent)% от суммы займа"
            } else if feeInitial < 10 {
//                print("feepercent = \(feePercent), feeinitial = \(feeInitial)")

                feeValue.text = "от \(feePercent)% для зарплатных клиентов\nот \(feeInitial)% для остальных клиентов"
            } else {
                feeValue.text = "\(feePercent)% от суммы займа+\(feeInitial)〒"
            }
        } else {
            feeValue.text = "Без комиссии"
        }

        
        tempHeight = feeValue.intrinsicContentSize.height
        feeValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10


        
        
        let propertiesLabel = UILabel()
        propertiesLabel.font = .systemFont(ofSize: 14, weight: .light)
        propertiesLabel.numberOfLines = 0
        propertiesLabel.textColor = .gray
        
        scrollView.addSubview(propertiesLabel)
        propertiesLabel.text = "Объект недвижимости"
        
        tempHeight = propertiesLabel.intrinsicContentSize.height
        propertiesLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let propertiesValue = UILabel()
        propertiesValue.font = .systemFont(ofSize: 14, weight: .light)
        propertiesValue.numberOfLines = 0
        
        scrollView.addSubview(propertiesValue)
    
        myString = ""
        
        if properties.count == 1 {
            myString = properties[0]
        } else {
            myString = properties[0]
            for i in 1..<properties.count {
                myString += "\n"
                myString += properties[i]
            }
        }
        
        propertiesValue.text = myString
        
        tempHeight = propertiesValue.intrinsicContentSize.height
        propertiesValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)   // HERE
        
        lowestY += tempHeight + 10
        
        
        
        
        let whereToApplyLabel = UILabel()
        whereToApplyLabel.font = .systemFont(ofSize: 14, weight: .light)
        whereToApplyLabel.numberOfLines = 0
        whereToApplyLabel.textColor = .gray
        
        scrollView.addSubview(whereToApplyLabel)
        whereToApplyLabel.text = "Где можно оформить"
        
        tempHeight = whereToApplyLabel.intrinsicContentSize.height
        whereToApplyLabel.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        lowestY += tempHeight + 10

        
        let whereToApplyValue = UILabel()
        whereToApplyValue.font = .systemFont(ofSize: 14, weight: .light)
        whereToApplyValue.numberOfLines = 100
        
        scrollView.addSubview(whereToApplyValue)
    
        myString = ""
        
        if whereToApply.count == 1 {
            myString = whereToApply[0]
        } else {
            myString = whereToApply[0]
            for i in 1..<whereToApply.count {
                myString += "\n"
                myString += whereToApply[i]
            }
        }
        
        whereToApplyValue.text = myString
        
        tempHeight = whereToApplyValue.intrinsicContentSize.height
        whereToApplyValue.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)   // HERE
        
        lowestY += tempHeight + 10

//        CGSize maximumLabelSize = CGSizeMake(296, FLT_MAX);
//
//        CGSize expectedLabelSize = [yourString sizeWithFont:yourLabel.font constrainedToSize:maximumLabelSize lineBreakMode:yourLabel.lineBreakMode];

        //adjust the label the the new height.
//        CGRect newFrame = yourLabel.frame;
//        newFrame.size.height = expectedLabelSize.height;
//        yourLabel.frame = newFrame;

//        secondDetail.textColor = colorDict[self.detailsColors[1]]?[0]
//        secondDetail.backgroundColor = colorDict[self.detailsColors[1]]?[1]
//
//        secondDetail.frame = CGRect(x: 10,
//                                    y: 25 + imageSize + Int(firstDetail.intrinsicContentSize.height) + 10,
//                                    width: Int(secondDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(secondDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
//                                    height: Int(secondDetail.intrinsicContentSize.height) + 10)


    }
}

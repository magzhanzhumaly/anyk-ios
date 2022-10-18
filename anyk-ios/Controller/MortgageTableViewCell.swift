//
//  MortgageTableViewCell.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 30.09.2022.
//

import UIKit

protocol MortgageTableViewCellDelegate: AnyObject {
    func didTapButton(id: Int,
                      name: String,
                      AEIR: Double,
                      firstStageRate: Double,
                      ageOfBorrower: [String],
                      initialFee: String,
                      maxCredit: Int,
                      continuousWorkExperience: String,

                      minTerm: Int,
                      maxTerm: Int,

                      feePercent: Double,
                      feeInitial: Double,

                      properties: [String],
                      whereToApply: [String],
                      details: [String],
                      detailsColors: [String],
                      detailsFull: String,
                      imageName: String)
}

class MortgageTableViewCell: UITableViewCell {
    
    weak var delegate: MortgageTableViewCellDelegate?
    
    static let identifier = "MortgageTableViewCell"
    
    private var detailCount = 0
    
    var colorDict:[String : [UIColor]] = ["orange" : [UIColor(red: 211/255.0,
                                                              green: 112/255.0,
                                                              blue: 86/255.0,
                                                              alpha: 1),
                                                      UIColor(red: 211/255.0,
                                                              green: 112/255.0,
                                                              blue: 86/255.0,
                                                              alpha: 0.1)],
                                          "blue" : [UIColor(red: 48/255.0,
                                                            green: 83/255.0,
                                                            blue: 139/255.0,
                                                            alpha: 1),
                                                    UIColor(red: 48/255.0,
                                                            green: 83/255.0,
                                                            blue: 139/255.0,
                                                            alpha: 0.1)],
                                          "purple" : [UIColor(red: 95/255.0,
                                                            green: 56/255.0,
                                                            blue: 190/255.0,
                                                            alpha: 1),
                                                    UIColor(red: 95/255.0,
                                                            green: 56/255.0,
                                                            blue: 190/255.0,
                                                            alpha: 0.1)],
                                          "green" : [UIColor(red: 68/255.0,
                                                            green: 153/255.0,
                                                            blue: 154/255.0,
                                                            alpha: 1),
                                                    UIColor(red: 68/255.0,
                                                            green: 153/255.0,
                                                            blue: 154/255.0,
                                                            alpha: 0.1)],
                                          "orangish" : [UIColor.black,
                                                        UIColor(named: "AccentColor")!]]
    
    private var id = -1
    private var name = ""
    private var AEIR = 0.0 // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    private var firstStageRate = 0.0
    private var ageOfBorrower = [""]
    private var initialFee = ""
    private var maxCredit = 0
    private var continuousWorkExperience = ""
    
    private var minTerm = 0
    private var maxTerm = 0
    
    private var feePercent = 0.0
    private var feeInitial = 0.0
    
    private var properties = [""]
    private var whereToApply = [""]
    private var details = [""]
    private var detailsColors = [""]
    private var detailsFull = ""
    private var imageName = ""
    
    private let txt1 = UILabel()
    
    private let txt2 = UILabel()
    private let txt3 = UILabel()
    private let txt4 = UILabel()
    
    private let txt2val = UILabel()
    private let txt3val = UILabel()
    private let txt4val = UILabel()

    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleText: UILabel = {
        let label = UILabel()
//        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.numberOfLines = 3
        
        return label
    }()
    
    private var firstDetail: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        
        return label
    }()
    
    private let secondDetail: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        
        return label
    }()
    
    private let thirdDetail: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 10
        label.textAlignment = .center
        
        return label
    }()
    
    private let text1: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.text = "ГЭСВ\n"
        label.numberOfLines = 2

        return label
    }()
    
    private let text2: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.text = "Перв.\nВзнос"
        label.numberOfLines = 2

        return label
    }()
    
    private let text3: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.text = "Макс.\nсумма"
        label.numberOfLines = 2

        return label    }()
    
    private let text4: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 13, weight: .light)
        label.text = "Макс. срок\n"
        label.numberOfLines = 2

        return label
    }()
    
    private let text1val:  UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        
        return label
    }()
    
    private let text2val: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        
        return label
    }()
    
    private let text3val:  UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        
        return label
    }()
    
    
    private let text4val:  UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .light)
        
        return label
    }()
    
    private let moreButton: UIButton = {
        let btn = UIButton()
        let orng = UIColor(named: "AccentColor")
        
        btn.setTitle("ПОДРОБНЕЕ", for: .normal)
        btn.setTitleColor(orng, for: .normal)
        btn.backgroundColor = .clear
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = orng?.cgColor
        btn.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        return btn
    }()
    
    @objc func didTapButton(sender: UIButton!) {
        delegate?.didTapButton(id: id, name: name, AEIR: AEIR, firstStageRate: firstStageRate, ageOfBorrower: ageOfBorrower, initialFee: initialFee, maxCredit: maxCredit, continuousWorkExperience: continuousWorkExperience, minTerm: minTerm, maxTerm: maxTerm, feePercent: feePercent, feeInitial: feeInitial, properties: properties, whereToApply: whereToApply, details: details, detailsColors: detailsColors, detailsFull: detailsFull, imageName: imageName)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        //        super.init(style: style, reuseIdentifier: self.name)
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(titleText)
        
        contentView.addSubview(firstDetail)
        contentView.addSubview(text1)
        contentView.addSubview(text2)
        contentView.addSubview(text3)
        contentView.addSubview(text4)
        
        contentView.addSubview(text1val)
        contentView.addSubview(text2val)
        contentView.addSubview(text3val)
        contentView.addSubview(text4val)
        
        contentView.addSubview(moreButton)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(id: Int, name: String, AEIR: Double, firstStageRate: Double, ageOfBorrower: [String], initialFee: String, maxCredit: Int, continuousWorkExperience: String, minTerm: Int, maxTerm: Int, feePercent: Double, feeInitial: Double, properties: [String], whereToApply: [String], details: [String], detailsColors: [String], detailsFull: String, imageName: String) {
        
        self.id = id
        self.name = name
        self.AEIR = AEIR
        self.firstStageRate = firstStageRate
        self.ageOfBorrower = ageOfBorrower
        self.initialFee = initialFee
        self.maxCredit = maxCredit
        self.continuousWorkExperience = continuousWorkExperience
        
        self.minTerm = minTerm
        self.maxTerm = maxTerm
        
        self.feePercent = feePercent
        self.feeInitial = feeInitial
        
        self.properties = properties
        self.whereToApply = whereToApply
        self.details = details
        self.detailsColors = detailsColors
        self.detailsFull = detailsFull
        self.imageName = imageName
        
        self.titleText.text = name
        self.myImageView.image = UIImage(named: imageName)
        self.detailCount = details.count
        self.firstDetail.text = details[0]
        if detailCount == 2 {
            self.secondDetail.text = details[1]
        }
        if detailCount == 3 {
            self.secondDetail.text = details[1]
            self.thirdDetail.text = details[2]
        }
        
        self.text1val.text = "\(AEIR)%"
        if initialFee.count > 2 {
            self.text2val.text = "\(initialFee.prefix(3))"
        } else {
            self.text2val.text = "\(initialFee)"
        }
        self.text3val.text = "\(maxCredit / 1000000) млн"
        self.text4val.text = "\(maxTerm) лет"
    }
    
    override func prepareForReuse() {  // important
        super.prepareForReuse()
//        titleText.text = nil
//        myImageView.image = nil
//        firstDetail.textColor = nil
//        firstDetail.backgroundColor = nil
//        firstDetail.text = nil
        firstDetail.layer.cornerRadius = 0
        firstDetail.layer.borderWidth = 0
//        firstDetail.layer.borderColor = nil
    }
        
    override func layoutSubviews() {  // this method is called when the view is gonna ask how are you gonna layout all the subviews
        super.layoutSubviews()
//        prepareForReuse()
        firstDetail.layer.cornerRadius = 0
        firstDetail.layer.borderWidth = 0

        let imageSize = 40

        if AEIR < 0 {
            secondDetail.removeFromSuperview()
            thirdDetail.removeFromSuperview()
            
            text1.removeFromSuperview()
            text2.removeFromSuperview()
            text3.removeFromSuperview()
            text4.removeFromSuperview()
            
            text1val.removeFromSuperview()
            text2val.removeFromSuperview()
            text3val.removeFromSuperview()
            text4val.removeFromSuperview()
            
            firstDetail.textColor = UIColor.label // here
            colorDict[self.detailsColors[0]]?[0]
            firstDetail.backgroundColor = .clear
            firstDetail.layer.cornerRadius = 5
            firstDetail.layer.borderWidth = 1
            firstDetail.layer.borderColor = CGColor(red: 211/255.0, green: 112/255.0, blue: 86/255.0, alpha: 1)

            var lowestY: CGFloat
            lowestY = 0
            var tempHeight = Int(firstDetail.intrinsicContentSize.height) + 10
            var width = Int(contentView.frame.size.width) - 20

            firstDetail.frame = CGRect(x: 10,
                                       y: 20 + imageSize,
                                       width: Int(firstDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(firstDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                       height: tempHeight)
            
            lowestY = CGFloat(30 + imageSize + tempHeight)
            
            
//            txt1.text = whereToApply[0]
            txt1.text = whereToApply.reduce("", { runningString, value in
                runningString + value + "\n"
                
            })
            txt1.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
            txt1.numberOfLines = 0
            tempHeight = Int(txt1.intrinsicContentSize.height + 20)
            txt1.frame = CGRect(x: 10, y: lowestY, width: contentView.frame.size.width - 20, height: CGFloat(tempHeight))
            lowestY += CGFloat(tempHeight)
            
            contentView.addSubview(txt1)
            
            txt2.text = "Стоимость (крупные города)"
            txt3.text = "Стоимость (регионы)"
            txt4.text = "Стоимость аренды"
            
            txt2.textColor = .gray
            txt3.textColor = .gray
            txt4.textColor = .gray

            txt2.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            txt3.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            txt4.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)

            
            txt2val.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            txt3val.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            txt4val.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)

            txt2val.text = properties[0]
            txt3val.text = properties[1]
            txt4val.text = properties[2]

            tempHeight = Int(txt2.intrinsicContentSize.height)
            txt2.frame = CGRect(x: 10, y: lowestY, width: CGFloat(width), height: txt2.intrinsicContentSize.height)
            lowestY += CGFloat(tempHeight + 5)
            tempHeight = Int(txt2.intrinsicContentSize.height)
            txt2val.frame = CGRect(x: 10, y: lowestY, width: CGFloat(width), height: txt2val.intrinsicContentSize.height)
            lowestY += CGFloat(tempHeight + 5)
            tempHeight = Int(txt2.intrinsicContentSize.height)
            txt3.frame = CGRect(x: 10, y: lowestY, width: CGFloat(width), height: txt2.intrinsicContentSize.height)
            lowestY += CGFloat(tempHeight + 5)
            tempHeight = Int(txt2.intrinsicContentSize.height)
            txt3val.frame = CGRect(x: 10, y: lowestY, width: CGFloat(width), height: txt2.intrinsicContentSize.height)
            lowestY += CGFloat(tempHeight + 5)
            tempHeight = Int(txt2.intrinsicContentSize.height)
            txt4.frame = CGRect(x: 10, y: lowestY, width: CGFloat(width), height: txt2.intrinsicContentSize.height)
            lowestY += CGFloat(tempHeight + 5)
            tempHeight = Int(txt2.intrinsicContentSize.height)
            txt4val.frame = CGRect(x: 10, y: lowestY, width: CGFloat(width), height: txt2.intrinsicContentSize.height)
            lowestY += CGFloat(tempHeight + 10)
            
            moreButton.frame = CGRect(x: 10,
                                      y: lowestY,
                                      width: CGFloat(width), height: 40)

            lowestY += 50
            
            contentView.addSubview(txt2)
            contentView.addSubview(txt2val)
            contentView.addSubview(txt3)
            contentView.addSubview(txt3val)
            contentView.addSubview(txt4)
            contentView.addSubview(txt4val)
            
        } else {
            
            txt1.removeFromSuperview()
            txt2.removeFromSuperview()
            txt3.removeFromSuperview()
            txt4.removeFromSuperview()
            
            txt2val.removeFromSuperview()
            txt3val.removeFromSuperview()
            txt4val.removeFromSuperview()

            
            contentView.addSubview(secondDetail)
            contentView.addSubview(thirdDetail)
            
            contentView.addSubview(text1)
            contentView.addSubview(text2)
            contentView.addSubview(text3)
            contentView.addSubview(text4)
            
            contentView.addSubview(text1val)
            contentView.addSubview(text2val)
            contentView.addSubview(text3val)
            contentView.addSubview(text4val)


            
            //        let switchSize = _switch.sizeThatFits(contentView.frame.size)
            
            myImageView.frame = CGRect(x: 10,
                                       y: 10,
                                       width: imageSize,
                                       height: imageSize)
            
            titleText.frame = CGRect(x: 20 + imageSize,
                                     y: 10,
                                     width: Int(contentView.frame.size.width) - 20 - imageSize - 10,
                                     height: imageSize)
            
            
            firstDetail.textColor = colorDict[self.detailsColors[0]]?[0]
            firstDetail.backgroundColor = colorDict[self.detailsColors[0]]?[1]
            
            var lowestY = 0
            
            if details.count == 1 {
                firstDetail.frame = CGRect(x: 10,
                                           y: 20 + imageSize,
                                           width: Int(firstDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(firstDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                           height: Int(firstDetail.intrinsicContentSize.height) + 10)
                
                lowestY = 30 + imageSize + Int(firstDetail.intrinsicContentSize.height) + 10
                secondDetail.removeFromSuperview()
                thirdDetail.removeFromSuperview()
            } else if details.count == 2 {
                firstDetail.frame = CGRect(x: 10,
                                           y: 20 + imageSize,
                                           width: Int(firstDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(firstDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                           height: Int(firstDetail.intrinsicContentSize.height) + 10)
                
                contentView.addSubview(secondDetail)
                
                secondDetail.textColor = colorDict[self.detailsColors[1]]?[0]
                secondDetail.backgroundColor = colorDict[self.detailsColors[1]]?[1]
                
                secondDetail.frame = CGRect(x: 10,
                                            y: 25 + imageSize + Int(firstDetail.intrinsicContentSize.height) + 10,
                                            width: Int(secondDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(secondDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                            height: Int(secondDetail.intrinsicContentSize.height) + 10)
                
                lowestY = 55 + imageSize + Int(firstDetail.intrinsicContentSize.height) + Int(secondDetail.intrinsicContentSize.height)
                thirdDetail.removeFromSuperview()
            } else if details.count == 3 {
                firstDetail.frame = CGRect(x: 10,
                                           y: 20 + imageSize,
                                           width: Int(firstDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(firstDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                           height: Int(firstDetail.intrinsicContentSize.height) + 10)
                
                contentView.addSubview(secondDetail)
                contentView.addSubview(thirdDetail)
                
                secondDetail.textColor = colorDict[self.detailsColors[1]]?[0]
                secondDetail.backgroundColor = colorDict[self.detailsColors[1]]?[1]
                
                
                thirdDetail.textColor = colorDict[self.detailsColors[2]]?[0]
                thirdDetail.backgroundColor = colorDict[self.detailsColors[2]]?[1]
                
                
                secondDetail.frame = CGRect(x: 10,
                                            y: 25 + imageSize + Int(firstDetail.intrinsicContentSize.height) + 10,
                                            width: Int(secondDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(secondDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                            height: Int(secondDetail.intrinsicContentSize.height) + 10)
                
                
                
                thirdDetail.frame = CGRect(x: 10,
                                           y: 30 + imageSize + Int(firstDetail.intrinsicContentSize.height) + 10 + Int(secondDetail.intrinsicContentSize.height) + 10,
                                           width: Int(thirdDetail.intrinsicContentSize.width) < Int(contentView.frame.size.width) - 20 ? Int(thirdDetail.intrinsicContentSize.width) + 10 : Int(contentView.frame.size.width) - 20,
                                           height: Int(thirdDetail.intrinsicContentSize.height) + 10)
                
                lowestY = 70 + imageSize + Int(firstDetail.intrinsicContentSize.height) + Int(secondDetail.intrinsicContentSize.height) + Int(thirdDetail.intrinsicContentSize.height)
            }
            
            var width = (Int(contentView.frame.size.width) - 20)/4
            
            text1.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: width,
                                 height: 35)
            
            text2.frame = CGRect(x: 10 + width,
                                 y: lowestY,
                                 width: width,
                                 height: 35)
            
            text3.frame = CGRect(x: 10 + width*2,
                                 y: lowestY,
                                 width: width,
                                 height: 35)
            
            text4.frame = CGRect(x: 10 + width*3,
                                 y: lowestY,
                                 width: width,
                                 height: 35)
            
            lowestY += 45
            
            text1val.frame = CGRect(x: 10,
                                    y: lowestY,
                                    width: width,
                                    height: 35)
            text2val.frame = CGRect(x: 10 + width,
                                    y: lowestY,
                                    width: width,
                                    height: 35)
            
            text3val.frame = CGRect(x: 10 + width*2,
                                    y: lowestY,
                                    width: width,
                                    height: 35)
            
            text4val.frame = CGRect(x: 10 + width*3,
                                    y: lowestY,
                                    width: width,
                                    height: 35)
            
            lowestY += 45
            
            var contWidth = Int(contentView.frame.size.width)
            
            moreButton.frame = CGRect(x: 10,
                                      y: lowestY,
                                      width: contWidth - 20, height: 40)
        }
    }
}

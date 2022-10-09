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
   
    
    
    
    // TextField 1
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

//        let txtField = UITextField(frame: CGRect(x: 20, y: 7*h/18, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

        let txtField = UITextField()
        
        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.numberPad
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()
    
    var myButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
        return btn
    }()
    
    // TextField 2
    var txtField2txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

//        let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        let lbl = UILabel()
        lbl.text = "Первоначальный взнос"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField()
        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.numberPad
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()

    
    
    // TextField 3
    var txtField3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField()
        txtField.placeholder = "0 лет"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.numberPad
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Ипотека"
        print(id)
        print(name)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        txtField1.delegate = self
        txtField2.delegate = self
        txtField3.delegate = self

        
        view.addSubview(scrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18, weight: .medium)
        nameLabel.numberOfLines = 2
        
        scrollView.addSubview(nameLabel)
        nameLabel.text = name
//        nameLabel.backgroundColor = .gray
        tempHeight = nameLabel.intrinsicContentSize.height*2
        
        nameLabel.frame = CGRect(x: 10, y: 10, width: w, height: tempHeight)
        
        lowestY = 20 + tempHeight
        
        
        let detailsFullLabel = UILabel()
        detailsFullLabel.font = .systemFont(ofSize: 16, weight: .light)
        detailsFullLabel.numberOfLines = 0
        
        scrollView.addSubview(detailsFullLabel)
        detailsFullLabel.text = detailsFull
        
        tempHeight = CGFloat((detailsFullLabel.text!.count / 45))*detailsFullLabel.intrinsicContentSize.height
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

        
        
        
        
        
        // Calculator
        let calcView = UIView()
        
        calcView.layer.cornerRadius = 20;
        calcView.layer.masksToBounds = true;
        
        
        let orng = UIColor(red: 211/255.0,
                           green: 112/255.0,
                           blue: 86/255.0,
                           alpha: 1)

        calcView.layer.borderWidth = 1
        calcView.layer.borderColor = orng.cgColor
        scrollView.addSubview(calcView)
        
        tempHeight = h/18
        var hh = lowestY
        var hhh = lowestY
        
        var txtField1txt: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 5, y: 15, width: w - 5, height: tempHeight/2))
            
//            let lbl = UILabel()
            
            lbl.text = "Стоимость жилья"
            lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            lbl.numberOfLines = 1
            lbl.textColor = .black
            lbl.textAlignment = .left

            return lbl
        }()
        
        lowestY = tempHeight/2 + 15
        
        calcView.addSubview(txtField1txt)

        txtField1.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
        calcView.addSubview(txtField1)

        lowestY += tempHeight + 10

        var txtField2txt: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w - 5, height: tempHeight/2))
            lbl.text = "Первоначальный взнос"
            lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            lbl.numberOfLines = 1
            lbl.textColor = .black
            lbl.textAlignment = .left

            return lbl
        }()
        
        lowestY += tempHeight/2
        calcView.addSubview(txtField2txt)
        
        txtField2.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
        calcView.addSubview(txtField2)

        lowestY += tempHeight + 10

        

        var txtField3txt: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w - 5, height: tempHeight/2))
            lbl.text = "Срок займа"
            lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            lbl.numberOfLines = 1
            lbl.textColor = .black
            lbl.textAlignment = .left

            return lbl
        }()
        
        lowestY += tempHeight / 2
        calcView.addSubview(txtField3txt)
        
        txtField3.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
        calcView.addSubview(txtField3)

        lowestY += tempHeight + 20

        tempHeight = h/18
        
        myButton = UIButton(frame: CGRect(x: 5, y: lowestY, width: w - 5, height: tempHeight))
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = UIColor(red: 211/255.0,
                                      green: 112/255.0,
                                      blue: 86/255.0,
                                      alpha: 1)

        myButton.setTitle("РАССЧИТАТЬ", for: .normal)

        myButton.layer.cornerRadius = 5;
        myButton.layer.masksToBounds = true;

        calcView.addSubview(myButton)
        
        
        lowestY += tempHeight + 5

        
        hh += lowestY
        
        calcView.frame = CGRect(x: 4, y: hhh, width: w + 12, height: lowestY + 20)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: hh + 350)
        myButton .addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        lowestY = hh

    }
    
    @objc func buttonAction(sender: UIButton!) {
//        myButton.backgroundColor = .lightGray
        
        let myInt1 = Double(txtField1.text ?? "0") ?? 0
        let myInt2 = Double(txtField2.text ?? "0") ?? 0
        let myInt3 = Double(txtField3.text ?? "0") ?? 0

        
        if (myInt1 < 100000 || myInt1 > 175000000) || (myInt2 < myInt1 / 5 || myInt2 > myInt1 * 0.99) || (myInt3 < Double(minTerm) || myInt3 > Double(maxTerm)) {
            
            myButton.backgroundColor = .red
            /*
            if let txtField1.text != "" && txtField2.text != "" && txtField3.text != "" && txtField4.text != "" {
                
            } else {
                
            }
            */
            
            if myInt1 < 100000 {
                myButton.setTitle("Сумма займа от 100 000 ₸", for: .normal)
            } else if myInt1 > 175000000 {
                myButton.setTitle("Сумма займа до 175 000 000 ₸", for: .normal)
            } else {
                if myInt2 < myInt1 / 5 {
                    myButton.setTitle("Первоначальный взнос от \(myInt1 / 5) ₸", for: .normal)
                } else if myInt2 > myInt1 * 0.99 {
                    myButton.setTitle("Первоначальный взнос до \(myInt1 * 0.99) ₸", for: .normal)
                }
            }
            
            if myInt3 < Double(minTerm) {
                myButton.setTitle("Срок займа от \(minTerm) лет", for: .normal)
            } else if myInt3 > Double(maxTerm) {
                myButton.setTitle("Срок займа до \(maxTerm) лет", for: .normal)
            }
            
            let timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { timer in
                self.myButton.backgroundColor = UIColor(red: 211/255.0,
                                              green: 112/255.0,
                                              blue: 86/255.0,
                                              alpha: 1)
                self.myButton.setTitle("РАССЧИТАТЬ", for: .normal)
            }

        } else {  // case .success
            
            if whereToApply != ["Жилстройсбербанк"] {
                
                // case 1
                self.performSegue(withIdentifier: "calculations1", sender: self)

                print("case 1")
            } else {
                
                if minTerm == 6 {
                    
                    // case 2
                    self.performSegue(withIdentifier: "calculations2", sender: self)
                    
                    print("case 2")
                } else {
                    
                    // case 3
                    self.performSegue(withIdentifier: "calculations3", sender: self)

                    print("case 3")
                    
                }
                
            }
            
            // segue 1 - default w/ 3 labels.   Calc1VC
            // segue 2 - zhilstroisberbank default CalcZSSBdefVC
            // segue 3 - zhilstroisberbank w/ 3 stages CalcZSSB3StagesVC
            
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calculations1" {
//            let destinationVC = segue.destination as! MortgageListViewController
        }
        if segue.identifier == "calculations2" {
        }
        if segue.identifier == "calculations3" {
        }
    }

}

extension MortgageDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        print("textFieldShouldReturn")
        return true
    }
}

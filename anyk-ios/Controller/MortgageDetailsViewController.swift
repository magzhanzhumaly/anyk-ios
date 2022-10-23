//
//  MortgageDetailsViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 02.10.2022.
//

import UIKit

class MortgageDetailsViewController: UIViewController {
    let h = UIScreen.main.bounds.height - 88

    var segueName = ""
    
    let w = UIScreen.main.bounds.width - 20
    
    var popUpOption = "срок 1-го этапа 3 года, срок 2-го этапа 6 лет"
    
    var myButtonDefaultY: CGFloat = 0
    var tempHeight: CGFloat = 0.0
    var lowestY: CGFloat = 0.0
    var hhh = 0
    var hh: CGFloat = 0
    var hiddenSegmentY: CGFloat = 0
    var zssbNoSegmentY: CGFloat = 0
    var calcViewDefaultHeight: CGFloat = 0
    let datePicker = UIDatePicker()
    
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
   
    var chosenSegment = 0
    
    let calcView = UIView()
    
    var termPopUpButton: UIButton = {
    
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton()
        
        btn.setTitle("срок 1-го этапа 3 года, срок 2-го этапа 6 лет", for: .normal)
        btn.setTitleColor(.label, for: .normal)

        btn.layer.cornerRadius = 6
        btn.titleLabel?.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
//                    btn.titleLabel?.numberOfLines = 2
        btn.layer.borderWidth = 1
        btn.backgroundColor = .systemBackground
//        btn.titleLabel?.textAlignment = .left
        
//        btn.contentHorizontalAlignment = .left
        
        btn.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)

        return btn
    }()

    // TextField 1
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

//        let txtField = UITextField(frame: CGRect(x: 20, y: 7*h/18, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

        let txtField = UITextField()
        
        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
//        txtField.textColor = .black
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
//        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField()
        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
//        txtField.textColor = .black
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
//        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.numberPad
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()
    
    var txtField1_1: UITextField = {
        let txtField = UITextField()
        return txtField
    }()
    
    var txtField1_1txt = UILabel()
    
    var txtField1_2 = UITextField()
    var txtField1_2txt = UILabel()

    var txtField1_3 = UITextField()
    var txtField1_3txt = UILabel()

    
    var txtField2_1 = UITextField()
    var txtField2_1txt = UILabel()
    var txtField2_2 = UITextField()
    var txtField2_2txt = UILabel()
    var txtField2_3 = UITextField()
    var txtField2_3txt = UILabel()

    var jaiText = UILabel()
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        
        title = "Ипотека"
        print(id)
        print(name)
        
        txtField1.delegate = self
        txtField2.delegate = self
        txtField3.delegate = self
        txtField1_1.delegate = self
        txtField1_2.delegate = self
        txtField1_3.delegate = self
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
            self.popUpOption = action.title
//            self.termPopUpButton.setTitle(action.title, for: .normal)
        }

        termPopUpButton.menu = UIMenu(children : [
            UIAction(title: "срок 1-го этапа 3 года, срок 2-го этапа 6 лет", state: .on, handler: optionClosure),
            UIAction(title: "срок 1-го этапа 4 года, срок 2-го этапа 7 лет", handler: optionClosure),
            UIAction(title: "срок 1-го этапа 5 года, срок 2-го этапа 8 лет", handler: optionClosure),
            UIAction(title: "срок 1-го этапа 6 года, срок 2-го этапа 9 лет", handler: optionClosure),
            UIAction(title: "срок 1-го этапа 7 года, срок 2-го этапа 10 лет", handler: optionClosure),
            UIAction(title: "срок 1-го этапа 8 года, срок 2-го этапа 11 лет", handler: optionClosure)])
        termPopUpButton.showsMenuAsPrimaryAction = true
        termPopUpButton.changesSelectionAsPrimaryAction = true
        

        
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
        
        calcView.layer.cornerRadius = 20;
        calcView.layer.masksToBounds = true;
        
        
        let orng = UIColor(named: "AccentColor")

        calcView.layer.borderWidth = 1
        calcView.layer.borderColor = orng?.cgColor
        scrollView.addSubview(calcView)
        
        tempHeight = h/18
        hh = lowestY
        hhh = Int(lowestY)
        
        var txtField1txt: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 5, y: 15, width: w, height: tempHeight/2))
            
//            let lbl = UILabel()
            
            lbl.text = "Стоимость жилья"
            lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            lbl.numberOfLines = 1
//            lbl.textColor = .black
            lbl.textAlignment = .left

            return lbl
        }()
        
        lowestY = tempHeight/2 + 15
        
        calcView.addSubview(txtField1txt)

        txtField1.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
        calcView.addSubview(txtField1)

        lowestY += tempHeight + 10

        var txtField2txt: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
            lbl.text = "Первоначальный взнос"
            lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            lbl.numberOfLines = 1
//            lbl.textColor = .black
            lbl.textAlignment = .left

            return lbl
        }()
        
        lowestY += tempHeight/2
        calcView.addSubview(txtField2txt)
        
        txtField2.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
        calcView.addSubview(txtField2)

        lowestY += tempHeight + 10

        

        var txtField3txt: UILabel = {
            let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
            lbl.text = "Срок займа"
            lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
            lbl.numberOfLines = 1
//            lbl.textColor = .black
            lbl.textAlignment = .left

            return lbl
        }()
        
        lowestY += tempHeight / 2
        calcView.addSubview(txtField3txt)
        
        // special cases
        if whereToApply == ["Жилстройсбербанк"] || name == "\"5-10-20\"" {
            
            if initialFee.contains("49%") {  // calculations4
                
                // 2 textFields + popup button
                termPopUpButton.frame = CGRect(x: 5, y: lowestY, width: w, height: tempHeight)
                lowestY += 10 + tempHeight
                myButton.frame = CGRect(x: 5, y: lowestY, width: w, height: tempHeight)
                calcView.addSubview(termPopUpButton)
                
                segueName = "calculations4"
//                self.performSegue(withIdentifier: "calculations4", sender: self)
                
            } else {  // calculations2
                
                // 3 textFields + button
                
                txtField3.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
                calcView.addSubview(txtField3)
                lowestY += 20 + tempHeight
                
                var txtField4txt = {
                    let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
                    lbl.text = "У меня есть депозит в ЖССБ"
                    lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                    lbl.numberOfLines = 1
//                    lbl.textColor = .black
                    lbl.textAlignment = .left

                    return lbl
                }()
                
                lowestY += tempHeight / 2
                calcView.addSubview(txtField4txt)
                
                // add segment
                var segControl: UISegmentedControl = {
                    let segmentItems = ["нет", "да"]
                    let control = UISegmentedControl(items: segmentItems)
                    control.frame = CGRect(x: 10, y: lowestY, width: (UIScreen.main.bounds.width - 20), height: 40)
                    control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
                    control.selectedSegmentIndex = 0

                    return control
                }()
                
                segControl.frame = CGRect(x: 5, y: lowestY, width: w, height: tempHeight)
                calcView.addSubview(segControl)
                lowestY += 40 + 20
                
                hiddenSegmentY = lowestY

                
                
                
                
                if feePercent != 0 {
                    
                    // 3 textFields + button + 3 more textFields
                    // add 3 more txtfields
                    
                    lowestY += 10
                    
                    jaiText = {
                        let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
                        lbl.text = "Параметры кредита по новому счету"
                        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
//                        lbl.textColor = .lightGray
                        lbl.textAlignment = .left
                        
                        return lbl
                    }()
                    
                    calcView.addSubview(jaiText)
                    
                    lowestY += 10 + tempHeight/2

                    txtField2_1txt = {
                        let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
                        lbl.text = "Сумма займа"
                        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        //                lbl.numberOfLines = 1
                        lbl.textColor = .lightGray
                        lbl.textAlignment = .left
                        
                        return lbl
                    }()
                    
                    lowestY += 10 + tempHeight/2
                                
                    txtField2_1 = {
                        let h = UIScreen.main.bounds.height - 88
                        
                        let txtField = UITextField(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight))
                        
                        txtField.placeholder = "0₸"
                        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
                        txtField.backgroundColor = .black
                        txtField.textAlignment = .left
                        
                        txtField.borderStyle = UITextField.BorderStyle.roundedRect
                        txtField.autocorrectionType = UITextAutocorrectionType.no
                        txtField.keyboardType = UIKeyboardType.numberPad
                        txtField.returnKeyType = UIReturnKeyType.done
                        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                        
                        return txtField
                    }()
                    
                    lowestY += 10 + tempHeight

                    txtField2_2txt = {
                        let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
                        lbl.text = "Первоначальный взнос"
                        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        //                lbl.numberOfLines = 1
                        lbl.textColor = .lightGray
                        lbl.textAlignment = .left
                        
                        return lbl
                    }()
                    
                    lowestY += 10 + tempHeight/2
                                
                    txtField2_2 = {
                        let h = UIScreen.main.bounds.height - 88
                        
                        let txtField = UITextField(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight))
                        
                        txtField.placeholder = "0₸"
                        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
                        txtField.backgroundColor = .black
                        txtField.textAlignment = .left
                        
                        txtField.borderStyle = UITextField.BorderStyle.roundedRect
                        txtField.autocorrectionType = UITextAutocorrectionType.no
                        txtField.keyboardType = UIKeyboardType.numberPad
                        txtField.returnKeyType = UIReturnKeyType.done
                        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                        
                        return txtField
                    }()
                    
                    lowestY += 10 + tempHeight

                    txtField2_3txt = {
                        let lbl = UILabel(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight/2))
                        lbl.text = "Срок займа"
                        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        //                lbl.numberOfLines = 1
                        //            lbl.textColor = .black
                        lbl.textAlignment = .left
                        
                        return lbl
                    }()
                    
                    lowestY += 10 + tempHeight/2
                                
                    txtField2_3 = {
                        let h = UIScreen.main.bounds.height - 88
                        
                        let txtField = UITextField(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight))
                        
                        txtField.placeholder = "0 лет"
                        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
                        txtField.backgroundColor = .black
                        txtField.textAlignment = .left
                        
                        txtField.borderStyle = UITextField.BorderStyle.roundedRect
                        txtField.autocorrectionType = UITextAutocorrectionType.no
                        txtField.keyboardType = UIKeyboardType.numberPad
                        txtField.returnKeyType = UIReturnKeyType.done
                        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                        
                        return txtField
                    }()
                    
                    lowestY += 20 + tempHeight

                    
                    calcView.addSubview(txtField2_1txt)
                    calcView.addSubview(txtField2_1)

                    calcView.addSubview(txtField2_2txt)
                    calcView.addSubview(txtField2_2)

                    calcView.addSubview(txtField2_3txt)
                    calcView.addSubview(txtField2_3)
                    
                    segueName = "calculations3"
//                    self.performSegue(withIdentifier: "calculations3", sender: self)


                } else {
                    
                    segueName = "calculations2"
//                    self.performSegue(withIdentifier: "calculations2", sender: self)
                    
                }
                
            }
            
        }
        
        // normal case
        else {
            
            txtField3.frame = CGRect(x: 6, y: lowestY, width: w, height: tempHeight)
            calcView.addSubview(txtField3)
            lowestY += tempHeight + 20
            hiddenSegmentY = lowestY
            
            segueName = "calculations1"
//            self.performSegue(withIdentifier: "calculations1", sender: self)
        }

        
                
        tempHeight = h/18
        
        
        myButtonDefaultY = lowestY
        
        myButton = UIButton(frame: CGRect(x: 5, y: lowestY, width: w, height: tempHeight))
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = UIColor(named: "AccentColor")

        myButton.setTitle("РАССЧИТАТЬ", for: .normal)

        myButton.layer.cornerRadius = 5;
        myButton.layer.masksToBounds = true;

        calcView.addSubview(myButton)

        
        lowestY += tempHeight + 5

        hh += lowestY
 
        
        calcView.frame = CGRect(x: 4, y: CGFloat(hhh), width: w + 12, height: lowestY + 20)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: hh + 250)
        myButton .addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        calcViewDefaultHeight = lowestY + 20
        
        lowestY = hh
        
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
//            txtField1.isHidden = true
            txtField1_1.removeFromSuperview()
            txtField1_1txt.removeFromSuperview()
            txtField1_2.removeFromSuperview()
            txtField1_2txt.removeFromSuperview()
            txtField1_3.removeFromSuperview()
            txtField1_3txt.removeFromSuperview()

            calcView.frame = CGRect(x: 4, y: CGFloat(hhh), width: w + 12, height: calcViewDefaultHeight)
            myButton.frame = CGRect(x: 5, y: myButtonDefaultY, width: w, height: tempHeight)
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: hh + 250)

            
            if feePercent != 0 {
                
                var tempY = hiddenSegmentY + 10
                jaiText.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_1txt.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_1.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight)
                tempY += tempHeight + 10
                
                txtField2_2txt.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_2.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight)
                tempY += tempHeight + 10
                
                txtField2_3txt.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_3.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight)
                tempY += tempHeight + 20
                
                calcView.frame = CGRect(x: 4, y: CGFloat(hhh), width: w + 12, height: tempY + 40 + 20)
                
            } else {
                
                var tempY = zssbNoSegmentY
                
                jaiText.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_1txt.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_1.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight)
                tempY += tempHeight + 10
                
                txtField2_2txt.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_2.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight)
                tempY += tempHeight + 10
                
                txtField2_3txt.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight/2)
                tempY += tempHeight/2 + 10
                
                txtField2_3.frame = CGRect(x: 5, y: tempY, width: w, height: tempHeight)
                tempY += tempHeight + 20
                
                calcView.frame = CGRect(x: 4, y: CGFloat(hhh), width: w + 12, height: tempY + 40 + 40 + 20)

            }
                        
        case 1:
            
            var localLowestY: CGFloat = 0
            txtField1_1txt = {
                let lbl = UILabel(frame: CGRect(x: 5, y: hiddenSegmentY, width: w, height: tempHeight/2))
                lbl.text = "Дата открытия депозита"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.textAlignment = .left
                
                return lbl
            }()
            
            localLowestY = hiddenSegmentY + 10 + tempHeight/2
            
            calcView.addSubview(txtField1_1txt)
            
            let h = UIScreen.main.bounds.height - 88
                
            txtField1_1 = UITextField(frame: CGRect(x: 5, y: localLowestY, width: w, height: tempHeight))
                
            txtField1_1.placeholder = "ДД/ММ/ГГ"
            txtField1_1.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
            txtField1_1.textAlignment = .left
                
            txtField1_1.borderStyle = UITextField.BorderStyle.roundedRect
            txtField1_1.autocorrectionType = UITextAutocorrectionType.no
            txtField1_1.keyboardType = UIKeyboardType.numberPad
            txtField1_1.returnKeyType = UIReturnKeyType.done
            txtField1_1.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            
            createDatePicker()

            calcView.addSubview(txtField1_1)
            localLowestY += tempHeight + 10
            
            txtField1_2txt = {
                let lbl = UILabel(frame: CGRect(x: 5, y: localLowestY, width: w, height: tempHeight/2))
                lbl.text = "Вознаграждение за прошлый период"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
//                lbl.numberOfLines = 1
                //            lbl.textColor = .black
                lbl.textAlignment = .left
                
                return lbl
            }()
            
            localLowestY += 10 + tempHeight/2
                        
            txtField1_2 = {
                let h = UIScreen.main.bounds.height - 88
                
                let txtField = UITextField(frame: CGRect(x: 5, y: localLowestY, width: w, height: tempHeight))
                
                txtField.placeholder = "0₸"
                txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
                txtField.backgroundColor = .black
                txtField.textAlignment = .left
                
                txtField.borderStyle = UITextField.BorderStyle.roundedRect
                txtField.autocorrectionType = UITextAutocorrectionType.no
                txtField.keyboardType = UIKeyboardType.numberPad
                txtField.returnKeyType = UIReturnKeyType.done
                txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                
                return txtField
            }()
            
            localLowestY += 10 + tempHeight
            
            txtField1_3txt = {
                let lbl = UILabel(frame: CGRect(x: 5, y: localLowestY, width: w, height: tempHeight/2))
                lbl.text = "Вознаграждение за текущий период"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.textAlignment = .left
                
                return lbl
            }()
            
            localLowestY += 10 + tempHeight/2
                        
            txtField1_3 = {
                let h = UIScreen.main.bounds.height - 88
                
                let txtField = UITextField(frame: CGRect(x: 5, y: localLowestY, width: w, height: tempHeight))
                
                txtField.placeholder = "0₸"
                txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
                txtField.backgroundColor = .black
                txtField.textAlignment = .left
                
                txtField.borderStyle = UITextField.BorderStyle.roundedRect
                txtField.autocorrectionType = UITextAutocorrectionType.no
                txtField.keyboardType = UIKeyboardType.numberPad
                txtField.returnKeyType = UIReturnKeyType.done
                txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
                
                return txtField
            }()
            
            localLowestY += tempHeight + 20
            
            calcView.addSubview(txtField1_2)
            calcView.addSubview(txtField1_2txt)
            calcView.addSubview(txtField1_3)
            calcView.addSubview(txtField1_3txt)

            
            if feePercent != 0 {
                zssbNoSegmentY = localLowestY
                
                jaiText.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight/2)
                localLowestY += tempHeight + 10
                
                txtField2_1txt.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight/2)
                localLowestY += tempHeight/2 + 10
                
                txtField2_1.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight)
                localLowestY += tempHeight + 10
                
                txtField2_2txt.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight/2)
                localLowestY += tempHeight/2 + 10
                
                txtField2_2.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight)
                localLowestY += tempHeight + 10
                
                txtField2_3txt.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight/2)
                localLowestY += tempHeight/2 + 10
                
                txtField2_3.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight)
                localLowestY += tempHeight + 20
                
                
                
                
                myButton.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight)
                
                localLowestY += tempHeight + 20
                
                calcView.frame = CGRect(x: 4, y: CGFloat(hhh), width: w + 12, height: localLowestY)
                                
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: hh + 500)
                
            } else {
                
                myButton.frame = CGRect(x: 5, y: localLowestY, width: w, height: tempHeight)
                
                localLowestY += tempHeight + 20
                
                calcView.frame = CGRect(x: 4, y: CGFloat(hhh), width: w + 12, height: localLowestY)
                
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: hh + 500)

            }
            
        default:
            break
        }
                
    }
    
    @objc func buttonAction(sender: UIButton!) {
//        myButton.backgroundColor = .lightGray
        
        let myInt1 = Double(txtField1.text ?? "0") ?? 0
        let myInt2 = Double(txtField2.text ?? "0") ?? 0
        let myInt3 = Double(txtField3.text ?? "0") ?? 0

//        self.performSegue(withIdentifier: segueName, sender: self)

        
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
                self.myButton.backgroundColor = UIColor(named: "AccentColor")
                self.myButton.setTitle("РАССЧИТАТЬ", for: .normal)
            }
            

        } else {  // case .success
            
            self.performSegue(withIdentifier: segueName, sender: self)
            
            /*
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
            */
            // segue 1 - default w/ 3 labels.   Calc1VC
            // segue 2 - zhilstroisberbank default CalcZSSBdefVC
            // segue 3 - zhilstroisberbank w/ 3 stages CalcZSSB3StagesVC
            
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "calculations1" {
            
//            let destinationVC = segue.destination as! Calculations1ViewController
//
//            destinationVC.txtField1 = self.txtField1.text ?? ""
//            destinationVC.txtField2 = self.txtField2.text ?? ""
//            destinationVC.txtField3 = self.txtField3.text ?? ""
//            destinationVC.id = id
//            destinationVC.name = name
//            destinationVC.AEIR = AEIR
//            destinationVC.firstStageRate = firstStageRate
//            destinationVC.ageOfBorrower = ageOfBorrower
//            destinationVC.initialFee = initialFee
//            destinationVC.maxCredit = maxCredit
//            destinationVC.continuousWorkExperience = continuousWorkExperience
//            destinationVC.minTerm = minTerm
//            destinationVC.maxTerm = maxTerm
//            destinationVC.feePercent = feePercent
//            destinationVC.feeInitial = feeInitial
//            destinationVC.properties = properties
//            destinationVC.whereToApply = whereToApply
//            destinationVC.details = details
//            destinationVC.detailsColors = detailsColors
//            destinationVC.detailsFull = detailsFull
//            destinationVC.imageName = imageName

            weak var destinationVC = segue.destination as? Calculations1ViewController

            destinationVC?.txtField1 = self.txtField1.text ?? ""
            destinationVC?.txtField2 = self.txtField2.text ?? ""
            destinationVC?.txtField3 = self.txtField3.text ?? ""

            destinationVC?.id = id
            destinationVC?.name = name
            destinationVC?.AEIR = AEIR
            destinationVC?.firstStageRate = firstStageRate
            destinationVC?.ageOfBorrower = ageOfBorrower
            destinationVC?.initialFee = initialFee
            destinationVC?.maxCredit = maxCredit
            destinationVC?.continuousWorkExperience = continuousWorkExperience
            destinationVC?.minTerm = minTerm
            destinationVC?.maxTerm = maxTerm
            destinationVC?.feePercent = feePercent
            destinationVC?.feeInitial = feeInitial
            destinationVC?.properties = properties
            destinationVC?.whereToApply = whereToApply
            destinationVC?.details = details
            destinationVC?.detailsColors = detailsColors
            destinationVC?.detailsFull = detailsFull
            destinationVC?.imageName = imageName
        }
        if segue.identifier == "calculations2" {
            weak var destinationVC = segue.destination as? Calculations2ViewController
            
            destinationVC?.id = id
            destinationVC?.name = name
            destinationVC?.AEIR = AEIR
            destinationVC?.firstStageRate = firstStageRate
            destinationVC?.ageOfBorrower = ageOfBorrower
            destinationVC?.initialFee = initialFee
            destinationVC?.maxCredit = maxCredit
            destinationVC?.continuousWorkExperience = continuousWorkExperience
            destinationVC?.minTerm = minTerm
            destinationVC?.maxTerm = maxTerm
            destinationVC?.feePercent = feePercent
            destinationVC?.feeInitial = feeInitial
            destinationVC?.properties = properties
            destinationVC?.whereToApply = whereToApply
            destinationVC?.details = details
            destinationVC?.detailsColors = detailsColors
            destinationVC?.detailsFull = detailsFull
            destinationVC?.imageName = imageName
        }
        if segue.identifier == "calculations3" {
            weak var destinationVC = segue.destination as? Calculations3ViewController
            
            destinationVC?.id = id
            destinationVC?.name = name
            destinationVC?.AEIR = AEIR
            destinationVC?.firstStageRate = firstStageRate
            destinationVC?.ageOfBorrower = ageOfBorrower
            destinationVC?.initialFee = initialFee
            destinationVC?.maxCredit = maxCredit
            destinationVC?.continuousWorkExperience = continuousWorkExperience
            destinationVC?.minTerm = minTerm
            destinationVC?.maxTerm = maxTerm
            destinationVC?.feePercent = feePercent
            destinationVC?.feeInitial = feeInitial
            destinationVC?.properties = properties
            destinationVC?.whereToApply = whereToApply
            destinationVC?.details = details
            destinationVC?.detailsColors = detailsColors
            destinationVC?.detailsFull = detailsFull
            destinationVC?.imageName = imageName
        }
        if segue.identifier == "calculations4" {
            weak var destinationVC = segue.destination as? Calculations4ViewController
            
            destinationVC?.id = id
            destinationVC?.name = name
            destinationVC?.AEIR = AEIR
            destinationVC?.firstStageRate = firstStageRate
            destinationVC?.ageOfBorrower = ageOfBorrower
            destinationVC?.initialFee = initialFee
            destinationVC?.maxCredit = maxCredit
            destinationVC?.continuousWorkExperience = continuousWorkExperience
            destinationVC?.minTerm = minTerm
            destinationVC?.maxTerm = maxTerm
            destinationVC?.feePercent = feePercent
            destinationVC?.feeInitial = feeInitial
            destinationVC?.properties = properties
            destinationVC?.whereToApply = whereToApply
            destinationVC?.details = details
            destinationVC?.detailsColors = detailsColors
            destinationVC?.detailsFull = detailsFull
            destinationVC?.imageName = imageName
        }

    }

    
    
    func createDatePicker() {

        // toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        // bar button
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolBar.setItems([doneBtn], animated: true)
        
        // assign toolbar
        txtField1_1.inputAccessoryView = toolBar
        
        // assign date picker to the text field
        txtField1_1.inputView = datePicker
        
        // date picker mode
        datePicker.datePickerMode = .date
        
        datePicker.frame.size = CGSize(width: 0, height: 250)
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        txtField1_1.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    // TODO: Deal with the datepicker
}

extension MortgageDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        print("textFieldShouldReturn")
        return true
    }
}

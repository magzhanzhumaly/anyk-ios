//
//  MortgageViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class MortgageViewController: UIViewController {
    
    var titleText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: h/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        lbl.text = "Все жилищные программы Казахстана"
        lbl.font = .systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    // TEXTFIELDS
    
    // TextField 1
    var txtField1txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h/3 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Стоимость жилья"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 7*h/18 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()
    
    
    
    // TextField 2
    var txtField2txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Первоначальный взнос"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: 7*h/18 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

//        txtField.backgroundColor = .black
        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()

    
    
    // TextField 3
    var txtField3txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h/2 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Срок до"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 5*h/9 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

        txtField.placeholder = "0 лет"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()
    
    
    
    // TextField 4
    var txtField4txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/2 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Первоначальный взнос"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField4: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: 5*h/9 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

        txtField.placeholder = "0₸"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return txtField
    }()
    
    

    // Buttons
    var firstButton: UIButton = {
        
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: 0, y: 2*h/3 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/9))
        btn.setTitle("БОЛЬШЕ ПАРАМЕТРОВ", for: .normal)
        
        btn.titleLabel?.numberOfLines = 3
        btn.setTitleColor(UIColor(red: 211/255.0,
                                  green: 112/255.0,
                                  blue: 86/255.0,
                                  alpha: 1), for: .normal)
        btn.titleLabel?.textAlignment = .left
        btn.configuration?.titleAlignment = .trailing

        return btn
        
    }()
    
    var secondButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 2*h/3 + 10 + 88, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20))
        btn.setTitle("ПОДОБРАТЬ ПРОГРАММЫ", for: .normal)
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
        btn.backgroundColor = UIColor(red: 211/255.0,
                                      green: 112/255.0,
                                      blue: 86/255.0,
                                      alpha: 1)

        return btn
    }()


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleText)
        
        view.addSubview(txtField1txt)
        view.addSubview(txtField1)

        view.addSubview(txtField2txt)
        view.addSubview(txtField2)
        
        view.addSubview(txtField3txt)
        view.addSubview(txtField3)

        view.addSubview(txtField4txt)
        view.addSubview(txtField4)
        
        view.addSubview(firstButton)
        view.addSubview(secondButton)

    }
}

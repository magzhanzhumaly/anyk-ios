//
//  HelpViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class HelpViewController: UIViewController {
    
    // BACKGROUND VIEWS (TEMPORARY)
    var myView0: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.1
        myView.alpha = 0.0

        return myView
    }()

    var myView1: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.2
        myView.alpha = 0.0

        return myView
    }()
    
    var myView2: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/3 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.3
        myView.alpha = 0.0

        return myView
    }()
    
    var myView3: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/2 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.4
        myView.alpha = 0.0

        return myView
    }()
    
    var myView4: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h*2/3 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.5
        myView.alpha = 0 // TO DELETE

        return myView
    }()
    
    var myView5: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h*5/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        
        myView.alpha = 0.6
        myView.alpha = 0.0

        return myView
    }()
    
    
    
    
    
    var titleText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: h/12))
        lbl.text = "Обратная связь"
        lbl.font = .systemFont(ofSize: 30, weight: UIFont.Weight.medium)
        lbl.numberOfLines = 2
//        lbl.backgroundColor = .gray
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    // TEXTFIELDS
    
    // TextField 1
    var txtField1txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h/12 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Имя"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 5*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

//        txtField.backgroundColor = .black
        txtField.placeholder = "Введите ваше имя"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
//        txtField.delegate = self

        return txtField
    }()
    
    
    // TextField 2
    var txtField2txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 7*h/36 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "E-mail"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: h/4 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

//        txtField.backgroundColor = .black
        txtField.placeholder = "Введите ваш E-mail"
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

        let lbl = UILabel(frame: CGRect(x: 20, y: 11*h/36 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Номер телефона"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 13*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

//        txtField.backgroundColor = .black
        txtField.placeholder = "Введите ваш номер телефона"
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
    

    var txt4: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 15*h/36 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Тип сообщения"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var myPopupButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let optionClosure = {(action : UIAction) in
            print(action.title)}

        let btn = UIButton(frame: CGRect(x: 20, y: 17*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))
        btn.menu = UIMenu(children : [
            UIAction(title: "Предложения по работе платформы", state: .on, handler: optionClosure),
            UIAction(title: "Сообщить об ошибке на онлайн-платформе", handler: optionClosure),
            UIAction(title: "Вопрос по жилищной программе", handler: optionClosure),
            UIAction(title: "Другое", handler: optionClosure)])

        btn.showsMenuAsPrimaryAction = true
        btn.changesSelectionAsPrimaryAction = true
        btn.setTitle("Выберите тип сообщения", for: .normal)
//        btn.contentHorizontalAlignment = .left
//        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)

//        btn.contentHorizontalAlignment =
        btn.setTitleColor(.black, for: .normal)
        
//        btn.backgroundColor = .gray
        btn.layer.cornerRadius = 6
        
        btn.layer.borderWidth = 1

        btn.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)
//        txtField.backgroundColor = .black
//        txtField.placeholder = "Введите ваш номер телефона"
//        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
//        txtField.textColor = .black
//        txtField.textAlignment = .left
//
//        txtField.borderStyle = UITextField.BorderStyle.roundedRect
//        txtField.autocorrectionType = UITextAutocorrectionType.no
//        txtField.keyboardType = UIKeyboardType.default
//        txtField.returnKeyType = UIReturnKeyType.done
//        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center

        return btn
    }()

    var txt5: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 19*h/36 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Сообщение"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()

    var txtField4: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 21*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/4))

//        txtField.backgroundColor = .black
        txtField.placeholder = "Введите ваше сообщение в свободной форме"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left

        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
//        txtField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        txtField.contentVerticalAlignment = .top

        return txtField
    }()
    

    var secondButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/3, y: 5*h/6 + 88 + 20, width: UIScreen.main.bounds.width/3, height: h/18))
        btn.setTitle("Отправить", for: .normal)
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
        btn.backgroundColor = UIColor(red: 211/255.0,
                                      green: 112/255.0,
                                      blue: 86/255.0,
                                      alpha: 1)
//          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
    }()


    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.addSubview(firstText)
//        view.addSubview(logoImg)
//
//        view.addSubview(secondText)
//        view.addSubview(txtField)
//        view.addSubview(firstButton)
//        view.addSubview(thirdText)
//        view.addSubview(fourthText)
//        view.addSubview(secondButton)
//        view.addSubview(fifthText)
//        view.addSubview(thirdButton)
//        view.addSubview(sixthText)
//        view.addSubview(fourthButton)


//
//
        
        view.addSubview(titleText)
//        view.addSubview(subTitleText)
        
        
        view.addSubview(txtField1txt)
        view.addSubview(txtField1)

        view.addSubview(txtField2txt)
        view.addSubview(txtField2)
        
        view.addSubview(txtField3txt)
        view.addSubview(txtField3)

        view.addSubview(txt4)
        view.addSubview(txt5)

        view.addSubview(myPopupButton)
        
//        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(txtField4)


        
        view.addSubview(myView0)
        view.addSubview(myView1)
        view.addSubview(myView2)
        view.addSubview(myView3)
        view.addSubview(myView4)
        view.addSubview(myView5)
        

        
    }
    
    func setPopupButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)}
//        monPopupButton
    }
}

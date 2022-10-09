//
//  HelpViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class HelpViewController: UIViewController {
    
    let h = UIScreen.main.bounds.height - 88

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88))
        
        return scrollView
    }()
    
    
    
    var titleText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: h/12))
        lbl.text = "Обратная связь"
        lbl.font = .systemFont(ofSize: 30, weight: UIFont.Weight.medium)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    // TextField 1
    var txtField1txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h/12 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Имя"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 5*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

        txtField.placeholder = "Введите ваше имя"
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

        let lbl = UILabel(frame: CGRect(x: 20, y: 7*h/36 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "E-mail"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: h/4 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

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

        return lbl
    }()
    
    var txtField3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 13*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

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

        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 6
        btn.layer.borderWidth = 1
        btn.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)

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

        return lbl
    }()

    var txtField4: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 21*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/4))

        txtField.placeholder = "Введите ваше сообщение в свободной форме"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textColor = .black
        txtField.textAlignment = .left

        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.default
        txtField.returnKeyType = UIReturnKeyType.done
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
        return btn
    }()
    
    @objc func secondButtonAction(sender: UIButton!) {
        secondButton.backgroundColor = .green
        secondButton.setTitle("Отправлено", for: .normal)

        /*
        if let txtField1.text != "" && txtField2.text != "" && txtField3.text != "" && txtField4.text != "" {
            
        } else {
            
        }
        */
        
        let timer = Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { timer in
            self.secondButton.backgroundColor = UIColor(red: 211/255.0,
                                          green: 112/255.0,
                                          blue: 86/255.0,
                                          alpha: 1)
            self.secondButton.setTitle("Отправить", for: .normal)
            
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)

        
        scrollView.addSubview(titleText)
        scrollView.addSubview(txtField1txt)
        scrollView.addSubview(txtField1)
        scrollView.addSubview(txtField2txt)
        scrollView.addSubview(txtField2)
        scrollView.addSubview(txtField3txt)
        scrollView.addSubview(txtField3)
        scrollView.addSubview(txt4)
        scrollView.addSubview(txt5)
        scrollView.addSubview(myPopupButton)
        scrollView.addSubview(secondButton)
        scrollView.addSubview(txtField4)
        
        secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)
        
        txtField1.delegate = self
        txtField2.delegate = self
        txtField3.delegate = self
        txtField4.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setPopupButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)}
    }
}

extension HelpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)

        return true
    }
}

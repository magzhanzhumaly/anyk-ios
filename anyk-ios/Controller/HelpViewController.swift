//
//  HelpViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//
import MessageUI
import UIKit

class HelpViewController: UIViewController {
    
    let h = UIScreen.main.bounds.height - 88

    var popUpOption = "Предложения по работе платформы"
    
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
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 5*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

        txtField.placeholder = "Введите ваше имя"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
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
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: h/4 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

        txtField.placeholder = "Введите ваш E-mail"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.emailAddress
        txtField.autocapitalizationType = .none
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
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 13*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18))

        txtField.placeholder = "Введите ваш номер телефона"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
        txtField.textAlignment = .left
        
        txtField.borderStyle = UITextField.BorderStyle.roundedRect
        txtField.autocorrectionType = UITextAutocorrectionType.no
        txtField.keyboardType = UIKeyboardType.phonePad
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
        lbl.textAlignment = .left

        return lbl
    }()

    var myPopupButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let optionClosure = {(action : UIAction) in
            print(action.title)
        }

        let btn = UIButton()
        
        return btn
    }()

    var txt5: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 20*h/36 + 88, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Сообщение"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textAlignment = .left

        return lbl
    }()

    var txtField4: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 22*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/4))

        txtField.placeholder = "Введите ваше сообщение в свободной форме"
        txtField.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light )
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

        let btn = UIButton(frame: CGRect(x: 20, y: 31*h/36 + 88 + 20, width: UIScreen.main.bounds.width - 40, height: h/18))
        btn.setTitle("Отправить", for: .normal)
        return btn
    }()
    
    @objc func secondButtonAction(sender: UIButton!) {
        if txtField1.text != "" && txtField2.text != "" && txtField3.text != "" && txtField4.text != "" {
            sendEmail()
        } else {
            self.secondButton.backgroundColor = .red
            if txtField1.text == "" {
                secondButton.setTitle("Введите ваше имя", for: .normal)
            } else if txtField2.text == "" {
                secondButton.setTitle("Введите ваш e-mail", for: .normal)
            } else if txtField3.text == "" {
                secondButton.setTitle("Введите ваш номер телефона", for: .normal)
            } else if txtField4.text == "" {
                secondButton.setTitle("Введите сообщение", for: .normal)
            }
            
            let timer = Timer.scheduledTimer(withTimeInterval: 2 , repeats: false) { timer in
                self.secondButton.backgroundColor = UIColor(named: "AccentColor")
                self.secondButton.setTitle("Отправить", for: .normal)
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPopupButton.titleLabel?.numberOfLines = 2
        myPopupButton.titleLabel?.textAlignment = .center
        myPopupButton.titleLabel?.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        myPopupButton.setTitle("Выберите тип сообщения", for: .normal)
        myPopupButton.setTitleColor(.label, for: .normal)
        myPopupButton.layer.cornerRadius = 6
        myPopupButton.layer.borderWidth = 1
        myPopupButton.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)

        myPopupButton.frame = CGRect(x: 20, y: 17*h/36 + 88, width: UIScreen.main.bounds.width - 40, height: h/18)

        
        let optionClosure = { (action : UIAction) in
            self.popUpOption = action.title
        }
        
        myPopupButton.menu = UIMenu(children : [
            UIAction(title: "Предложения по работе платформы", state: .on, handler: optionClosure),
            UIAction(title: "Сообщить об ошибке на онлайн-платформе", handler: optionClosure),
            UIAction(title: "Вопрос по жилищной программе", handler: optionClosure),
            UIAction(title: "Другое", handler: optionClosure)])


        myPopupButton.showsMenuAsPrimaryAction = true
        myPopupButton.changesSelectionAsPrimaryAction = true

        secondButton.titleLabel?.numberOfLines = 3
        secondButton.layer.cornerRadius = 20
        secondButton.titleLabel?.textAlignment = .center
        secondButton.configuration?.titleAlignment = .center
        secondButton.backgroundColor = UIColor(named: "AccentColor")

        
        setPopupButton()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.addSubview(scrollView)
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1.45*h)

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
        let optionClosure = { [weak self] (action : UIAction) in
            print(action.title)
            self?.popUpOption = action.title
            print("self?.popUpOption = \(self?.popUpOption)")
        }
    }
    
}

extension HelpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)

        return true
    }
}

extension HelpViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["magzhantheman@gmail.com"])
            mail.setMessageBody("<p>Имя отправителя: \(txtField1.text ?? "")<br>E-mail отправителя: \(txtField2.text ?? "")<br>Номер телефона отправителя: \(txtField3.text ?? "")<br><br>Сообщение:<br>\(txtField4.text ?? "")</p>", isHTML: true)
            
            if popUpOption == "Сообщить об ошибке на онлайн-платформе" {
                popUpOption = "Сообщение об ошибке на онлайн-платформе"
            }
            
            mail.setSubject(popUpOption)
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }

    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}

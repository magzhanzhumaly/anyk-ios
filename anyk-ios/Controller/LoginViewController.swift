//
//  LoginViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginVCView: UIView!
    
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
    
    
    
    

    
    var logoImg: UIImageView = {
        let h = UIScreen.main.bounds.height - 88

        let imageName = "AipotekaLogoNoText"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        imageView.frame = CGRect(x: (UIScreen.main.bounds.width - h/9)/2, y: h/6 + 88, width: h/9, height: h/9)
        return imageView
    }()

    
    var firstText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 5*h/18 + 88, width: UIScreen.main.bounds.width, height: h/18))
        lbl.text = "Войти по номеру"
        lbl.font = .systemFont(ofSize: 25, weight: UIFont.Weight.heavy)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    var secondText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: h/3 + 88, width: UIScreen.main.bounds.width, height: h/18))
        lbl.text = "Мобильный телефон"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.alpha = 0.7
        return lbl
    }()
    
    var txtField: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 50, y: 5*h/12 + 88, width: UIScreen.main.bounds.width - 100, height: h/24))

//        txtField.backgroundColor = .black
        txtField.placeholder = "+"
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
    

    var firstButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: (UIScreen.main.bounds.width)/3, y: h/2 + 88 + 20, width: (UIScreen.main.bounds.width)/3, height: h/9 - 40))
        btn.setTitle("Получить код", for: .normal)
        btn.backgroundColor = UIColor(red: 87/255.0,
                                      green: 118/255.0,
                                      blue: 243/255.0,
                                      alpha: 1)
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
//          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
    }()

    var thirdText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 7*h/12 + 88, width: UIScreen.main.bounds.width, height: h/12))
        lbl.text = "Продолжая, вы соглашаетесь на передачу данных:\nНомер телефона , Имя , Фамилия \"Anyk\"."
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    var fourthText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 2*h/3 + 88, width: UIScreen.main.bounds.width, height: h/48))
        lbl.text = "Вводя смс код, вы соглашаетесь с условиями"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 2
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        return lbl
    }()
    
    var secondButton: UIButton = {
        
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: 0, y: 11*h/16 + 88, width: UIScreen.main.bounds.width, height: h/48))
        btn.setTitle("пользовательского соглашения", for: .normal)
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)

        btn.titleLabel?.numberOfLines = 1
        btn.setTitleColor(UIColor(red: 87/255.0,
                                  green: 118/255.0,
                                  blue: 243/255.0,
                                  alpha: 1), for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .trailing
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
        
    }()
    
    var fifthText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 17*h/24 + 88, width: UIScreen.main.bounds.width, height: h/48))
        lbl.text = "и"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 2
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        return lbl
    }()
    
    var thirdButton: UIButton = {
        
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: 0, y: 35*h/48 + 88, width: UIScreen.main.bounds.width, height: h/48))
        btn.setTitle("политики конфиденциальности", for: .normal)
        
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)

        btn.titleLabel?.numberOfLines = 1
        btn.setTitleColor(UIColor(red: 87/255.0,
                                  green: 118/255.0,
                                  blue: 243/255.0,
                                  alpha: 1), for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .trailing
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
        
    }()

    var sixthText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: 3*h/4 + 88, width: UIScreen.main.bounds.width, height: h/24))
        lbl.text = "Aitu Passport - единый вход в экосистему Aitu"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 2
        lbl.textColor = .darkGray
        lbl.textAlignment = .center
        return lbl
    }()
    
    var fourthButton: UIButton = {
        
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: 0, y: 19*h/24 + 88, width: UIScreen.main.bounds.width, height: h/48))
        btn.setTitle("Отмена", for: .normal)
    
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        btn.titleLabel?.numberOfLines = 1
        btn.setTitleColor(.darkGray, for: .normal)
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .trailing
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
        
    }()

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.addSubview(firstText)
        view.addSubview(logoImg)

        view.addSubview(secondText)
        view.addSubview(txtField)
        view.addSubview(firstButton)
        view.addSubview(thirdText)
        view.addSubview(fourthText)
        view.addSubview(secondButton)
        view.addSubview(fifthText)
        view.addSubview(thirdButton)
        view.addSubview(sixthText)
        view.addSubview(fourthButton)


//
//
        view.addSubview(myView0)
        view.addSubview(myView1)
        view.addSubview(myView2)
        view.addSubview(myView3)
        view.addSubview(myView4)
        view.addSubview(myView5)
        
    }
    
}

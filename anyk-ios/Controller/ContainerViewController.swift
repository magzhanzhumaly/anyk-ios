//
//  ViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 02.09.2022.
//


import SideMenu
import UIKit

class ContainerViewController: UIViewController, MenuControllerDelegate {
    
    private var sideMenu: SideMenuNavigationController?
    
    private let loginController = LoginViewController()
    private let searchController = SearchViewController()
    private let articlesController = ArticlesViewController()
    private let residentialComplexesController = ResidentialComplexesViewController()
    private let communityController = CommunityViewController()
    private let aboutUsController = AboutUsViewController()
    private let helpController = HelpViewController()
    
    @IBOutlet var mainPageView: UIView!
    
    var segCtrl1Choice: Int = 0
    var segCtrl2Choice: Int = 0
    var segCtrl3Choice: Int = 0
    var segCtrl4Choice: Int = 0

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100))
        return scrollView
    }()
        
    let h = UIScreen.main.bounds.height - 88

    var titleText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: h/6, width: UIScreen.main.bounds.width, height: h/9))
        lbl.text = "Подберите ипотечную программу для себя"
        lbl.font = .systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        lbl.numberOfLines = 2
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    var subTitleText: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 5*h/18, width: UIScreen.main.bounds.width - 40, height: h/18))
        lbl.text = "заполните параметры и наш алгоритм рассчитает наиболее выгодные для Вас программы"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 3
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    
    // TEXTFIELDS
    
    // TextField 1
    var txtField1txt: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Стоимость жилья"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 7*h/18, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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

        let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Первоначальный взнос"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: 7*h/18, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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

        let lbl = UILabel(frame: CGRect(x: 20, y: h/2, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Срок до"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 5*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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

        let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/2, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Первоначальный взнос"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField4: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: 5*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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

        let btn = UIButton(frame: CGRect(x: 0, y: 2*h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/9))
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
    
    var isExtended: Bool = false
    
    var secondButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 2*h/3 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20))
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

    
    // extended part of the page
    var txt5: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 2*h/3, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Тип жилья"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 3
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()

    var segControl1: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["Не важно", "Первичное", "Вторичное"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 25*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl1(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0

        return control
    }()

    @objc func segmentControl1(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            segCtrl1Choice = 0
        case 1:
            segCtrl1Choice = 1
        case 2:
            segCtrl1Choice = 2
        default:
            segCtrl1Choice = 0
        }
    }
    
    var txt6: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 28*h/36, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Можете подтвердить доход?"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()

    var segControl2: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["Не выбрано", "Да", "Нет"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 29*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl2(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0

        return control
    }()

    var txt6_1: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 8*h/9, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Доход"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField6_1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18))
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
    
    var txt6_2: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Расходы"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField6_2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
)
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
    
    var txt6_3: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 10*h/9, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Количество детей до 18 лет"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField6_3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 41*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
)
        txtField.placeholder = "0"
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
    
    @objc func segmentControl2(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            segCtrl2Choice = 0
            
            txt7.frame = CGRect(x: 20, y: 8*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl3.frame = CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            txt8.frame = CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl4.frame = CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
                        
            firstButton.frame = CGRect(x: 0, y: 10*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 10*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)

            txt6_1.removeFromSuperview()
            txtField6_1.removeFromSuperview()
            
            txt6_2.removeFromSuperview()
            txtField6_2.removeFromSuperview()
            
            txt6_3.removeFromSuperview()
            txtField6_3.removeFromSuperview()
            
            
            
            
            txt8_1.frame = CGRect(x: 20, y: 10*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_1.frame = CGRect(x: 20, y: 41*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_2.frame = CGRect(x: 20, y: 44*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_2.frame = CGRect(x: 20, y: 45*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_3.frame = CGRect(x: 20, y: 48*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_3.frame = CGRect(x: 20, y: 49*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            
            if segCtrl4Choice == 1 {
                
                firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
                
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 17*h/9)
                
            }
            
        case 1:   // если "Можете подтвердить доход?" = да
            segCtrl2Choice = 1
            
            
            txt7.frame = CGRect(x: 20, y: 11*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl3.frame = CGRect(x: 20, y: 15*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            txt8.frame = CGRect(x: 20, y: 4*h/3, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl4.frame = CGRect(x: 20, y: 49*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 5*h/3)
            
            scrollView.addSubview(txt6_1)
            scrollView.addSubview(txtField6_1)
            
            scrollView.addSubview(txt6_2)
            scrollView.addSubview(txtField6_2)
            
            scrollView.addSubview(txt6_3)
            scrollView.addSubview(txtField6_3)
            
             
            // seg4 options
            
            txt8_1.frame = CGRect(x: 20, y: 13*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)

            txtField8_1.frame = CGRect(x: 20, y: 53*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_2.frame = CGRect(x: 20, y: 56*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_2.frame = CGRect(x: 20, y: 57*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_3.frame = CGRect(x: 20, y: 60*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_3.frame = CGRect(x: 20, y: 61*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
      
            if segCtrl4Choice == 1 {
                firstButton.frame = CGRect(x: 0, y: 64*h/36, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 64*h/36 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
                //
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 20*h/9)
            }
        case 2:
            segCtrl2Choice = 2
            
            txt7.frame = CGRect(x: 20, y: 8*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl3.frame = CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            txt8.frame = CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl4.frame = CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
                        
            firstButton.frame = CGRect(x: 0, y: 10*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 10*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)
            
            txt6_1.removeFromSuperview()
            txtField6_1.removeFromSuperview()
            
            txt6_2.removeFromSuperview()
            txtField6_2.removeFromSuperview()
            
            txt6_3.removeFromSuperview()
            txtField6_3.removeFromSuperview()
            
            txt8_1.frame = CGRect(x: 20, y: 10*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_1.frame = CGRect(x: 20, y: 41*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_2.frame = CGRect(x: 20, y: 44*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_2.frame = CGRect(x: 20, y: 45*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_3.frame = CGRect(x: 20, y: 48*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_3.frame = CGRect(x: 20, y: 49*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            if segCtrl4Choice == 1 {
                
                firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
                
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 17*h/9)
                
            }
            
        default:
            segCtrl2Choice = 0
           
            txt7.frame = CGRect(x: 20, y: 8*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl3.frame = CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            txt8.frame = CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36)
            segControl4.frame = CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
                        
            firstButton.frame = CGRect(x: 0, y: 10*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 10*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)
            
            txt6_1.removeFromSuperview()
            txtField6_1.removeFromSuperview()
            
            txt6_2.removeFromSuperview()
            txtField6_2.removeFromSuperview()
            
            txt6_3.removeFromSuperview()
            txtField6_3.removeFromSuperview()
            
            
            txt8_1.frame = CGRect(x: 20, y: 10*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_1.frame = CGRect(x: 20, y: 41*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_2.frame = CGRect(x: 20, y: 44*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_2.frame = CGRect(x: 20, y: 45*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

            txt8_3.frame = CGRect(x: 20, y: 48*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
            txtField8_3.frame = CGRect(x: 20, y: 49*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
            
            if segCtrl4Choice == 1 {
                
                firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
                
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 17*h/9)
                
            }
        }
    }
    
    var txt7: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 8*h/9, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Наличие жилья"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
        
        return lbl
    }()

    var segControl3: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["Не выбрано", "Есть жилье", "Нет жилья"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl3(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0

        return control
    }()

    @objc func segmentControl3(_ segmentedControl: UISegmentedControl) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            segCtrl3Choice = 0
        case 1:
            segCtrl3Choice = 1
        case 2:
            segCtrl3Choice = 2
        default:
            segCtrl3Choice = 0
        }
    }
    
    var txt8: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Есть депозит в ЖССБ"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()

    var segControl4: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["нет", "да"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl4(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0

        return control
    }()
    
    
    // HERE
    
    var txt8_1: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 10*h/9, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Дата открытия депозита"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField8_1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 41*h/36, width: UIScreen.main.bounds.width - 40, height: h/18))
//        txtField.backgroundColor = .black
        txtField.placeholder = "ДД/ММ/ГГ"
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
    
    var txt8_2: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 44*h/36, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Вознаграждение за прошлый период"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left

        return lbl
    }()
    
    var txtField8_2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 45*h/36, width: UIScreen.main.bounds.width - 40, height: h/18))
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
    
    var txt8_3: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 48*h/36, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Вознаграждение за текущий период"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    var txtField8_3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 49*h/36, width: UIScreen.main.bounds.width - 40, height: h/18))
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
    // HERE
    
    @objc func segmentControl4(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            segCtrl4Choice = 0
            txt8_1.removeFromSuperview()
            txtField8_1.removeFromSuperview()

            txt8_2.removeFromSuperview()
            txtField8_2.removeFromSuperview()

            txt8_3.removeFromSuperview()
            txtField8_3.removeFromSuperview()
            
            if segCtrl2Choice == 1 {  // if seg2 is open
                
                firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
  
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 5*h/3)
                
            } else {   // if seg2 is closed
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)
                firstButton.frame = CGRect(x: 0, y: 10*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 10*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)

            }
        case 1:   // если "Можете подтвердить доход?" = да
            segCtrl4Choice = 1
            
            
            scrollView.addSubview(txt8_1)
            scrollView.addSubview(txtField8_1)

            scrollView.addSubview(txt8_2)
            scrollView.addSubview(txtField8_2)

            scrollView.addSubview(txt8_3)
            scrollView.addSubview(txtField8_3)

            firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)

            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 17*h/9)
          
            
            if segCtrl2Choice == 1 {
                
                txt8_1.frame = CGRect(x: 20, y: 13*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)

                txtField8_1.frame = CGRect(x: 20, y: 53*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

                txt8_2.frame = CGRect(x: 20, y: 56*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
                txtField8_2.frame = CGRect(x: 20, y: 57*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)

                txt8_3.frame = CGRect(x: 20, y: 60*h/36, width: UIScreen.main.bounds.width - 40, height: h/36)
                txtField8_3.frame = CGRect(x: 20, y: 61*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
       
                firstButton.frame = CGRect(x: 0, y: 64*h/36, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
                secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 64*h/36 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)

                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 20*h/9)
            }
            
        default:
            segCtrl4Choice = 0
            
            txt8_1.removeFromSuperview()
            txtField8_1.removeFromSuperview()

            txt8_2.removeFromSuperview()
            txtField8_2.removeFromSuperview()

            txt8_3.removeFromSuperview()
            txtField8_3.removeFromSuperview()
        }
    }
    
    
    @objc func firstButtonAction(sender: UIButton!) {
        let h = UIScreen.main.bounds.height - 88

        if isExtended == false {   // when opening

            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)
            firstButton.frame = CGRect(x: 0, y: 10*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 10*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            scrollView.addSubview(txt5)
            scrollView.addSubview(segControl1)
            
            scrollView.addSubview(txt6)
            scrollView.addSubview(segControl2)

            
            scrollView.addSubview(txt7)
            scrollView.addSubview(segControl3)

            scrollView.addSubview(txt8)
            scrollView.addSubview(segControl4)
            
            isExtended = true
        } else {   // when closing
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
            firstButton.frame = CGRect(x: 0, y: 2*h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 2*h/3 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            txt5.removeFromSuperview()
            segControl1.removeFromSuperview()
            
            txt6.removeFromSuperview()
            txt6_1.removeFromSuperview()
            txt6_2.removeFromSuperview()
            txt6_3.removeFromSuperview()
            
            txtField6_1.removeFromSuperview()
            txtField6_2.removeFromSuperview()
            txtField6_3.removeFromSuperview()

            segControl2.removeFromSuperview()

            txt7.removeFromSuperview()
            segControl3.removeFromSuperview()
           
            txt8.removeFromSuperview()
            txt8_1.removeFromSuperview()
            txt8_2.removeFromSuperview()
            txt8_3.removeFromSuperview()

            txtField8_1.removeFromSuperview()
            txtField8_2.removeFromSuperview()
            txtField8_3.removeFromSuperview()

            isExtended = false

        }
    }
    
    @objc func secondButtonAction(sender: UIButton!) {
        self.performSegue(withIdentifier: "mortgageListSegue", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mortgageListSegue" {
            let destinationVC = segue.destination as! MortgageListViewController

            destinationVC.textField1 = txtField1.text!
            destinationVC.textField2 = txtField2.text!
            destinationVC.textField3 = txtField3.text!
            destinationVC.textField4 = txtField4.text!
            destinationVC.textField6_1 = txtField6_1.text!
            destinationVC.textField6_2 = txtField6_2.text!
            destinationVC.textField6_3 = txtField6_3.text!
            destinationVC.textField8_1 = txtField8_1.text!
            destinationVC.textField8_2 = txtField8_2.text!
            destinationVC.textField8_3 = txtField8_3.text!

            destinationVC.segCtrl1Choice = segCtrl1Choice
            destinationVC.segCtrl2Choice = segCtrl2Choice
            destinationVC.segCtrl3Choice = segCtrl3Choice
            destinationVC.segCtrl4Choice = segCtrl4Choice
        }
        
        if segue.identifier == "residentialComplexesListSegue" {
            let destinationVC = segue.destination as! ResidentialComplexesListViewController
            print("I was here")
            destinationVC.selectedCity = self.txtField2.text!
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu?.leftSide = true
        let menu = MenuController(with: SideMenuItem.allCases)
        
        menu.delegate = self
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        mainPageView.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)

        txtField1.delegate = self
        txtField2.delegate = self
        txtField3.delegate = self
        txtField4.delegate = self
        txtField6_1.delegate = self
        txtField6_2.delegate = self
        txtField6_3.delegate = self
        txtField8_1.delegate = self
        txtField8_2.delegate = self
        txtField8_3.delegate = self

        scrollView.addSubview(titleText)
        scrollView.addSubview(subTitleText)
        
        
        scrollView.addSubview(txtField1txt)
        scrollView.addSubview(txtField1)

        scrollView.addSubview(txtField2txt)
        scrollView.addSubview(txtField2)
        
        scrollView.addSubview(txtField3txt)
        scrollView.addSubview(txtField3)

        scrollView.addSubview(txtField4txt)
        scrollView.addSubview(txtField4)
        
        scrollView.addSubview(firstButton)
        scrollView.addSubview(secondButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

        
        firstButton .addTarget(self, action: #selector(firstButtonAction ), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)

        addChildControllers()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func addChildControllers() {
        addChild(loginController)
        addChild(searchController)
        addChild(articlesController)
        addChild(residentialComplexesController)
        addChild(communityController)
        addChild(aboutUsController)
        addChild(helpController)
     
        view.addSubview(loginController.view)
        view.addSubview(searchController.view)
        view.addSubview(articlesController.view)
        view.addSubview(residentialComplexesController.view)
        view.addSubview(communityController.view)
        view.addSubview(aboutUsController.view)
        view.addSubview(helpController.view)
        
        loginController.view.frame = view.bounds
        searchController.view.frame = view.bounds
        articlesController.view.frame = view.bounds
        residentialComplexesController.view.frame = view.bounds
        communityController.view.frame = view.bounds
        aboutUsController.view.frame = view.bounds
        helpController.view.frame = view.bounds
        
        loginController.didMove(toParent: self)
        searchController.didMove(toParent: self)
        articlesController.didMove(toParent: self)
        residentialComplexesController.didMove(toParent: self)
        communityController.didMove(toParent: self)
        aboutUsController.didMove(toParent: self)
        helpController.didMove(toParent: self)
        
        // TO DELETE
//        mainPageView.isHidden = true
        loginController.view.isHidden = true
        searchController.view.isHidden = true
        articlesController.view.isHidden = true
        residentialComplexesController.view.isHidden = true
        communityController.view.isHidden = true
        aboutUsController.view.isHidden = true
        helpController.view.isHidden = true
    }
    
    
    @IBAction func didTapMenuButton(_ sender: Any) {
        present(sideMenu!, animated: true)
    }
    
    func didSelectMenuItem(named: SideMenuItem) {
        sideMenu?.dismiss(animated: true, completion: nil)
        
        title = named.rawValue
        
        switch named {
        case .login:
            mainPageView.isHidden = true
            
            loginController.view.isHidden = false
            searchController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .search:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = false
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            

        case .mainPage:
            mainPageView.isHidden = false
            
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .articles:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = true
            articlesController.view.isHidden = false
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .residentialComplexes:
            mainPageView.isHidden = true
            
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = false
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .community:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = false
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .aboutUs:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = false
            helpController.view.isHidden = true
            
            
        case .help:
            mainPageView.isHidden = true
    
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = false
            
        }
        
    }

}

extension ContainerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        print("textFieldShouldReturn")
        return true
    }
}

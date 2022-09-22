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
    private let mainPageController = MainPageViewController()
    private let mortgageController = MortgageViewController()
    private let articlesController = ArticlesViewController()
    private let residentialComplexesController = ResidentialComplexesViewController()
    private let communityController = CommunityViewController()
    private let aboutUsController = AboutUsViewController()
    private let helpController = HelpViewController()
    
    @IBOutlet var mainPageView: UIView!
    
//    @IBOutlet var containerView: UIView!

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100))
        return scrollView
    }()
//    view.addSubview(scrollView)

    
    var segCtrl1Choice: Int = 0
    var segCtrl2Choice: Int = 0
    var segCtrl3Choice: Int = 0
    var segCtrl4Choice: Int = 0
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
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 7*h/18, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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
//        txtField.delegate = self

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
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: 7*h/18, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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

        let lbl = UILabel(frame: CGRect(x: 20, y: h/2, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
        lbl.text = "Срок до"
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

        let txtField = UITextField(frame: CGRect(x: 20, y: 5*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

//        txtField.backgroundColor = .black
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
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField4: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: 5*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))

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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()

    var segControl1: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["Не важно", "Первичное", "Вторичное"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 25*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl1(_:)), for: .valueChanged)
        //        control.text
        control.selectedSegmentIndex = 0

        //        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 2
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()

    var segControl2: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["Не выбрано", "Да", "Нет"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 29*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl2(_:)), for: .valueChanged)
        //        control.text
        control.selectedSegmentIndex = 0

        //        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 2
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField6_1: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
)
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
    
    var txt6_2: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Расходы"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField6_2: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
)
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
    
    var txt6_3: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 20, y: 10*h/9, width: UIScreen.main.bounds.width - 40, height: h/36))
        lbl.text = "Количество детей до 18 лет"
        lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        lbl.textAlignment = .left
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()
    
    var txtField6_3: UITextField = {
        let h = UIScreen.main.bounds.height - 88

        let txtField = UITextField(frame: CGRect(x: 20, y: 41*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
)
//        txtField.backgroundColor = .black
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()

    var segControl3: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["Не выбрано", "Есть жилье", "Нет жилья"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl3(_:)), for: .valueChanged)
        //        control.text
        control.selectedSegmentIndex = 0

        //        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 2
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
        return lbl
    }()

    var segControl4: UISegmentedControl = {
        
        let h = UIScreen.main.bounds.height - 88

        let segmentItems = ["нет", "да"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
        control.addTarget(self, action: #selector(segmentControl4(_:)), for: .valueChanged)
        //        control.text
        control.selectedSegmentIndex = 0

        //        UISegmentedControl.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 2
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
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
//        lbl.backgroundColor = .gray
//        lbl.alpha = 0.5
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
            

//            txt7.frame = CGRect(x: 20, y: 8*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
//            segControl3.frame = CGRect(x: 20, y: 11*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
//
//            txt8.frame = CGRect(x: 20, y: h, width: UIScreen.main.bounds.width - 40, height: h/36)
//            segControl4.frame = CGRect(x: 20, y: 37*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
//
//            firstButton.frame = CGRect(x: 0, y: 10*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
//            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 10*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
//
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 4*h/3)
//
            txt8_1.removeFromSuperview()
            txtField8_1.removeFromSuperview()

            txt8_2.removeFromSuperview()
            txtField8_2.removeFromSuperview()

            txt8_3.removeFromSuperview()
            txtField8_3.removeFromSuperview()
            
            
            // GGGGG
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
//
                scrollView.contentSize = CGSize(width: view.frame.size.width, height: 20*h/9)
            }
                // when seg2 options are NOT opened
           
//            txt7.frame = CGRect(x: 20, y: 11*h/9, width: UIScreen.main.bounds.width - 40, height: h/36)
//            segControl3.frame = CGRect(x: 20, y: 15*h/12, width: UIScreen.main.bounds.width - 40, height: h/18)
//
//            txt8.frame = CGRect(x: 20, y: 4*h/3, width: UIScreen.main.bounds.width - 40, height: h/36)
//            segControl4.frame = CGRect(x: 20, y: 49*h/36, width: UIScreen.main.bounds.width - 40, height: h/18)
//
//            firstButton.frame = CGRect(x: 0, y: 13*h/9, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
//            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 13*h/9 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
//
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 5*h/3)
//
//            scrollView.addSubview(txt6_1)
//            scrollView.addSubview(txtField6_1)
//
//            scrollView.addSubview(txt6_2)
//            scrollView.addSubview(txtField6_2)
//
//            scrollView.addSubview(txt6_3)
//            scrollView.addSubview(txtField6_3)

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

    //        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 2*h/3 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20))


            isExtended = true
        } else {   // when closing
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
            firstButton.frame = CGRect(x: 0, y: 2*h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/9)
            secondButton.frame = CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 2*h/3 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20)
            
            txt5.removeFromSuperview()
            segControl1.removeFromSuperview()
            
            txt6.removeFromSuperview()
            segControl2.removeFromSuperview()

            txt7.removeFromSuperview()
            segControl3.removeFromSuperview()

//            txt5.removeFromSuperview()
//            segControl1.removeFromSuperview()
            
            
            if segCtrl2Choice == 1 {
                
            }
            
            if segCtrl4Choice == 1 {
                
            }
            
            
            isExtended = false

        }
    }
    
    @objc func secondButtonAction(sender: UIButton!) {
        print("secondButton tapped")
        let h = Int(UIScreen.main.bounds.height) - 88
        let w = Int(UIScreen.main.bounds.width)

        let wb = (w - 120)/2
        let hb = h/9 - 20
        let x = Int.random(in: 0..<(w - wb))
        let y = Int.random(in: 0..<(h - hb))
        
//        let randomDouble = Double.random(in: 2.71828...3.14159)
//        let randomBool = Bool.random()

//        secondButton.frame = CGRect(x: x, y: y, width: wb, height: hb)
        
        let detailVC = MortgageListViewController()
        navigationController?.pushViewController(detailVC,animated:true)

    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu?.leftSide = true
        let menu = MenuController(with: SideMenuItem.allCases)
        
        menu.delegate = self
        print("UIScreen.main.bounds.height")
        print(UIScreen.main.bounds.height)
        sideMenu = SideMenuNavigationController(rootViewController: menu)
        
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        mainPageView.addSubview(scrollView)
//        scrollView.backgroundColor = .gray
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)

        
//        containerView.isHidden = true
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
        

        

        
        firstButton .addTarget(self, action: #selector(firstButtonAction ), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(secondButtonAction), for: .touchUpInside)

        addChildControllers()
    }
    
    private func addChildControllers() {
        addChild(loginController)
        addChild(searchController)
        addChild(mainPageController)
        addChild(mortgageController)
        addChild(articlesController)
        addChild(residentialComplexesController)
        addChild(communityController)
        addChild(aboutUsController)
        addChild(helpController)
     
        view.addSubview(loginController.view)
        view.addSubview(searchController.view)
        view.addSubview(mainPageController.view)
        view.addSubview(mortgageController.view)
        view.addSubview(articlesController.view)
        view.addSubview(residentialComplexesController.view)
        view.addSubview(communityController.view)
        view.addSubview(aboutUsController.view)
        view.addSubview(helpController.view)
        
        loginController.view.frame = view.bounds
        searchController.view.frame = view.bounds
        mainPageController.view.frame = view.bounds
        mortgageController.view.frame = view.bounds
        articlesController.view.frame = view.bounds
        residentialComplexesController.view.frame = view.bounds
        communityController.view.frame = view.bounds
        aboutUsController.view.frame = view.bounds
        helpController.view.frame = view.bounds
        
        loginController.didMove(toParent: self)
        searchController.didMove(toParent: self)
        mainPageController.didMove(toParent: self)
        mortgageController.didMove(toParent: self)
        articlesController.didMove(toParent: self)
        residentialComplexesController.didMove(toParent: self)
        communityController.didMove(toParent: self)
        aboutUsController.didMove(toParent: self)
        helpController.didMove(toParent: self)
        
        // TO DELETE
//        mainPageView.isHidden = true
        loginController.view.isHidden = true
        searchController.view.isHidden = true
        mainPageController.view.isHidden = true
        mortgageController.view.isHidden = true
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

//            containerView.isHidden = false
            mainPageView.isHidden = true
            
            loginController.view.isHidden = false
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .search:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = false
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            

        case .mainPage:
            mainPageView.isHidden = false
//            containerView.isHidden = true
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .mortgage:
            mainPageView.isHidden = true

//            settingsController.view.isHidden = true
//            infoController.view.isHidden = true
            
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = false
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .articles:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = false
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .residentialComplexes:
            mainPageView.isHidden = true
            
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = false
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .community:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = false
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = true
            
            
        case .aboutUs:
            mainPageView.isHidden = true

            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = false
            helpController.view.isHidden = true
            
            
        case .help:
            mainPageView.isHidden = true
    
            loginController.view.isHidden = true
            searchController.view.isHidden = true
            mainPageController.view.isHidden = true
            mortgageController.view.isHidden = true
            articlesController.view.isHidden = true
            residentialComplexesController.view.isHidden = true
            communityController.view.isHidden = true
            aboutUsController.view.isHidden = true
            helpController.view.isHidden = false
            
        }
        
    }

    
    
    
    
    
    
    
    
    
//case login = "Вход"
//case search = "Поиск"
//case mainPage = "Главная"
//case mortgage = "Ипотека"
//case articles = "Статьи"
//case residentialComplexes = "Жилые Комплексы"
//case community = "Сообщество"
//case aboutUs = "О нас"
//case help = "Помощь"
}


/*
 import UIKit
 
 class ViewController: UIViewController {
 
 
 @IBOutlet var menuTableView: UITableView!
 @IBOutlet var mainPageView: UIView!
 @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
 
 @IBOutlet var loginView: UIView!
 
 var menu = false  // if the menu is shown or not
 let screen = UIScreen.main.bounds // shortcut to make the code slimmer
 var home = CGAffineTransform() // this is how we set the initial position of the homescreen
 
 var options: [option] = [
 
 option(title: "Вход",
 segue: "ВходSegue"), // 1
 
 option(title: "Поиск",
 segue: "ПоискSegue"), // 2
 
 option(title: "Главная",
 segue: "ГлавнаяSegue"), // 3
 
 option(title: "Ипотека",
 segue: "ИпотекаSegue"), // 4
 
 option(title: "Статьи",
 segue: "СтатьиSegue"), // 5
 
 option(title: "Жилые Комплексы",
 segue: "ЖКSegue"), // 6
 
 option(title: "Сообщество",
 segue: "СообществоSegue"), // 7
 
 option(title: "О нас",
 segue: "ОНасSegue"), // 8
 
 option(title: "Помощь",
 segue: "ПомощьSegue"), // 9
 
 ]
 
 struct option {
 var title = String()
 var segue = String()
 }
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 menuTableView.delegate = self
 menuTableView.dataSource = self
 menuTableView.backgroundColor = .clear
 
 mainPageView.isHidden = false
 loginView.isHidden = true
 
 
 home = mainPageView.transform // this will set the initial position of the container view
 }
 
 func showMenu() {
 self.mainPageView.layer.cornerRadius = 40
 //        self.viewBG.layer.cornerRadius = self.containerView.layer.cornerRadius
 
 let x = screen.width * 0.8
 let originalTransform = self.mainPageView.transform
 let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
 let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
 UIView.animate(withDuration: 0.7) {
 self.mainPageView.transform = scaledAndTranslatedTransform
 }
 }
 
 @IBAction func hamburgerTapped(_ sender: UIBarButtonItem) {
 self.view.bringSubviewToFront(menuTableView)
 if menu == false {
 showMenu()
 menu = true
 }
 }
 
 @IBAction func showMenu(_ sender: UISwipeGestureRecognizer) {
 if menu == false && swipeGesture.direction == .right {
 showMenu()
 menu = true
 }
 //        } else if menu == true && swipeGesture.direction == .left {
 //            hideMenu()
 //            menu = false
 //        } // here changes made
 }
 
 func hideMenu() {
 UIView.animate(withDuration: 0.7) {
 self.mainPageView.transform = self.home
 self.mainPageView.layer.cornerRadius = 0
 self.mainPageView.layer.cornerRadius = self.mainPageView.layer.cornerRadius
 }
 }
 
 @IBAction func hideMenu(_ sender: Any) {
 if menu == true {
 hideMenu()
 menu = false
 }
 }
 }
 
 extension ViewController:UITableViewDelegate, UITableViewDataSource {
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return options.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
 
 cell.backgroundColor = .clear
 cell.descriptionLabel.text = options[indexPath.row].title
 cell.descriptionLabel.textColor = .white // Subject ot change
 
 return cell
 }
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 
 if let indexPath = tableView.indexPathForSelectedRow {
 
 let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
 
 currentCell.alpha = 0.5
 UIView.animate(withDuration: 1) {
 currentCell.alpha = 1
 }
 
 
 if options[indexPath.row].title == "Главная" {
 mainPageView.isHidden = false
 loginView.isHidden = true
 } else {
 mainPageView.isHidden = true
 loginView.isHidden = false
 }
 
 //         self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
 }
 }
 
 
 
 }
 
 class tableViewCell: UITableViewCell {
 
 @IBOutlet var descriptionLabel: UILabel!
 }
 */

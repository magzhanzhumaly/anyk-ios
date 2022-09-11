//
//  MortgageViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class MortgageViewController: UIViewController {
    
    // BACKGROUND VIEWS (TEMPORARY)
    var myView0: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.1
//        myView.alpha = 0.0

        return myView
    }()

    var myView1: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.2
//        myView.alpha = 0.0

        return myView
    }()
    
    var myView2: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/3 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.3
//        myView.alpha = 0.0

        return myView
    }()
    
    var myView3: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/2 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.4
//        myView.alpha = 0.0

        return myView
    }()
    
    var myView4: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h*2/3 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.5
//        myView.alpha = 0 // TO DELETE

        return myView
    }()
    
    var myView5: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h*5/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        
        myView.alpha = 0.6
//        myView.alpha = 0.0

        return myView
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
        view.addSubview(myView0)
        view.addSubview(myView1)
        view.addSubview(myView2)
        view.addSubview(myView3)
        view.addSubview(myView4)
        view.addSubview(myView5)
    }
}

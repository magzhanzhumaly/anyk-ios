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
        lbl.text = "Стоимость жилья"
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
//        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
        
    }()
    
    var secondButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let btn = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2 + 40, y: 2*h/3 + 10, width: (UIScreen.main.bounds.width - 120)/2, height: h/9 - 20))
        btn.setTitle("ПОДОБРАТЬ ПРОГРАММЫ", for: .normal)
        btn.setTitleColor(UIColor(red: 211/255.0,
                                  green: 112/255.0,
                                  blue: 86/255.0,
                                  alpha: 1), for: .normal)
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
//          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
    }()


    
    
    // BACKGROUND VIEWS (TEMPORARY)
    var myView0: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
//        myView.alpha = 0.1
        myView.alpha = 0.0

        return myView
    }()

    var myView1: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/6 , width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.2
        myView.alpha = 0.0

        return myView
    }()
    
    var myView2: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/3 , width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.3
        myView.alpha = 0.0

        return myView
    }()
    
    var myView3: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h/2 , width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.4
        myView.alpha = 0.0

        return myView
    }()
    
    var myView4: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h*2/3 , width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
//        myView.alpha = 0.5
        myView.alpha = 0 // TO DELETE

        return myView
    }()
    
    var myView5: UIView = {
        let h = UIScreen.main.bounds.height - 88
        
        let myView = UIView(frame: CGRect(x: 0, y: h*5/6 , width: UIScreen.main.bounds.width, height: h/6))
        myView.backgroundColor = .gray
        myView.alpha = 0.6
        myView.alpha = 0.0

        return myView
    }()

    
    
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
        
//        containerView.isHidden = true
        mainPageView.addSubview(titleText)
        mainPageView.addSubview(subTitleText)
        
        
        mainPageView.addSubview(txtField1txt)
        mainPageView.addSubview(txtField1)

        mainPageView.addSubview(txtField2txt)
        mainPageView.addSubview(txtField2)
        
        mainPageView.addSubview(txtField3txt)
        mainPageView.addSubview(txtField3)

        mainPageView.addSubview(txtField4txt)
        mainPageView.addSubview(txtField4)
        
        mainPageView.addSubview(firstButton)
        mainPageView.addSubview(secondButton)

        

        
        mainPageView.addSubview(myView0)
        mainPageView.addSubview(myView1)
        mainPageView.addSubview(myView2)
        mainPageView.addSubview(myView3)
        mainPageView.addSubview(myView4)
        mainPageView.addSubview(myView5)
//        view.addSubview(titleText)
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

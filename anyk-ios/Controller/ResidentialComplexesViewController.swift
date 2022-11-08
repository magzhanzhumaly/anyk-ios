//
//  ResidentialComplexesViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class ResidentialComplexesViewController: UIViewController {
    
    var selectedCity = "Все города"
    
    let mort72025 = MortgageModel(id: 36,
                                  name: "72025",
                                  AEIR: 7,
                                  firstStageRate: 7,
                                  ageOfBorrower: ["мужчины: с 21 до 63",
                                                  "женщины: с 21 до 63"],
                                  initialFeePercentageString: "20% - 95%",
                                  initialFeeLowerBound: 20,
                                  initialFeeUpperBound: 95,
                                  maxCredit: 25000000,
                                  continuousWorkExperience: "6 месяцев",
                                  
                                  minTerm: 6, maxTerm: 25,
                                  feePercent: 0, feeInitial: 0,
                                  
                                  properties: ["Первичное жилье (квартира и дом)"],
                                  whereToApply: ["Банк ЦентрКредит",
                                                 "Сбербанк",
                                                 "Евразийский Банк",
                                                 "АТФБанк",
                                                 "Jusanbank",
                                                 "Bank RBK",
                                                 "Народный банк Казахстана",
                                                 "Forte Bank"],
                                  details: ["первичное жилье"],
                                  detailsColors: [ColorName.purple.rawValue],
                                  detailsFull: "для приобретения жилья на первичном рынке (от застройщика) с требованиями отсутствия жилья\nCоциальная программа для граждан РК, предоставлляющая новые возможности покупки жилья на первичном рынке с доступными условиями кредитования.",
                                  imageName: ImageName.zhilStroiSberBank.rawValue)

    
    let dataArray = ["Все города",
                     "Нур-Султан (Астана)",
                     "Алматы",
                     "Актау",
                     "Актобе",
                     "Атырау",
                     "Костанай",
                     "Кызылорда",
                     "Уральск",
                     "Усть-Каменегорск",
                     "Кокшетау",
                     "Павлодар",
                     "Шымкент",
                     "Жезказган",
                     "Караганда",
                     "Семей",
                     "Петропаловск",
                     "Туркестан",
                     "Тараз",
                     "Алматинская область",
                     "Акмолинская область"]
    
    var chosenCity = "Все города"
    var is72025 = "Нет"
    
    var residentialComplexesManager = ResidentialComplexesManager()

    var par1 = 0
    var par2 = 0
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88))
        return scrollView
    }()

    let cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()

    let label72025: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()
    
    private let cityPopUpButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88
        let btn = UIButton()
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }

        return btn
    }()
    
    private let num72025PopUpButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88
        let btn = UIButton()
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }

        return btn
    }()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ResidentialComplexesTableViewCell.self, forCellReuseIdentifier: ResidentialComplexesTableViewCell.identifier)
        
        return tableView
    }()
    
    private var fullData = [ResidentialComplexModel]()
    private var data = [ResidentialComplexModel]()
    private var storeData = [ResidentialComplexModel]()
    private var tempData = [ResidentialComplexModel]()
    private var tempestData = [ResidentialComplexModel]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.endEditing(true)

//        view.backgroundColor = .red
        tableView.delegate = self
        tableView.dataSource = self
        
        cityPopUpButton.setTitleColor(.label, for: .normal)
        num72025PopUpButton.setTitleColor(.label, for: .normal)

//        view.addSubview(scrollView)
        
        residentialComplexesManager.fetchData() { [weak self] result in
            guard let strongSelf = self else {
                return
            }

            switch result {
            case .success(let data):
                strongSelf.fullData.append(contentsOf: data)
                strongSelf.data.append(contentsOf: data)
                strongSelf.storeData.append(contentsOf: data)
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData() }
            case .failure(_):
                break
            }
        }

        
        let cityOptionClosure = { [weak self] (action : UIAction) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.chosenCity = action.title
            
            // filtering
            
            strongSelf.tempestData = strongSelf.fullData
            
            strongSelf.data = strongSelf.tempestData.filter({
                if $0.city == strongSelf.chosenCity || strongSelf.chosenCity == "Все города" {
                    if strongSelf.is72025 == "Да" {
                        if $0.is72025 == true {
                            return true
                        } else {
                            return false
                        }
                    } else {
                        return true
                    }
                }
                return false
            })
//            fdsahfdjlshf
//            if strongSelf.is72025 == "Да" {
//                strongSelf.data = strongSelf.fullData.filter({
//                    if $0.is72025 == true {
//                        return true
//                    }
//                    return false
//                })
//            } else {
//                strongSelf.data = strongSelf.fullData
//            }

            strongSelf.storeData = strongSelf.data
            strongSelf.storeData = strongSelf.tempestData
            strongSelf.tableView.reloadData()
        }
        
        cityPopUpButton.menu = UIMenu(children : [
            UIAction(title: "Все города", state: .on, handler: cityOptionClosure),
            UIAction(title: "Нур-Султан (Астана)", handler: cityOptionClosure),
            UIAction(title: "Алматы", handler: cityOptionClosure),
            UIAction(title: "Актау", handler: cityOptionClosure),
            UIAction(title: "Актобе", handler: cityOptionClosure),
            UIAction(title: "Атырау", handler: cityOptionClosure),
            UIAction(title: "Костанай", handler: cityOptionClosure),
            UIAction(title: "Кызылорда", handler: cityOptionClosure),
            UIAction(title: "Уральск", handler: cityOptionClosure),
            UIAction(title: "Усть-Каменегорск", handler: cityOptionClosure),
            UIAction(title: "Кокшетау", handler: cityOptionClosure),
            UIAction(title: "Павлодар", handler: cityOptionClosure),
            UIAction(title: "Шымкент", handler: cityOptionClosure),
            UIAction(title: "Жезказган", handler: cityOptionClosure),
            UIAction(title: "Караганда", handler: cityOptionClosure),
            UIAction(title: "Семей", handler: cityOptionClosure),
            UIAction(title: "Петропаловск", handler: cityOptionClosure),
            UIAction(title: "Туркестан", handler: cityOptionClosure),
            UIAction(title: "Тараз", handler: cityOptionClosure),
            UIAction(title: "Алматинская область", handler: cityOptionClosure),
            UIAction(title: "Акмолинская область", handler: cityOptionClosure)
        ])
        
        
      /*  let cityOptionClosure = { [weak self] (action : UIAction) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.chosenCity = action.title
            
            // filtering
            strongSelf.data = strongSelf.fullData.filter({
                if $0.city == strongSelf.chosenCity || strongSelf.chosenCity == "Все города" {
                    return true
                }
                return false
            })
            
            strongSelf.storeData = strongSelf.data
            strongSelf.tableView.reloadData()
        }
        

        */
//        var num72025OptionClosure = {[weak self] (action : UIAction) in }
           
        let num72025OptionClosure = {[weak self] (action : UIAction) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.is72025 = action.title
            strongSelf.tableView.reloadData()
            
            strongSelf.tempData = strongSelf.storeData
            
            if strongSelf.is72025 == "Да" {
//                strongSelf.data = strongSelf.fullData.filter({
                strongSelf.data = strongSelf.storeData.filter({
                    if $0.is72025 == true {
                        return true
                    }
                    return false
                })
            } else {
//                strongSelf.data = strongSelf.fullData
                strongSelf.data = strongSelf.storeData
            }
                        
            strongSelf.storeData = strongSelf.tempData
            
            strongSelf.tableView.reloadData()
        }
        
//        private var fullData = [ResidentialComplexModel]()
//        private var data = [ResidentialComplexModel]()
//        private var storeData = [ResidentialComplexModel]()

        
        num72025PopUpButton.menu = UIMenu(children : [
            UIAction(title: "Да", handler: num72025OptionClosure),
            UIAction(title: "Нет", state: .on, handler: num72025OptionClosure)
        ])

        cityPopUpButton.setTitle(chosenCity, for: .normal)
        
        cityPopUpButton.showsMenuAsPrimaryAction = true
        cityPopUpButton.changesSelectionAsPrimaryAction = true
                        
        num72025PopUpButton.setTitle(is72025, for: .normal)
        num72025PopUpButton.showsMenuAsPrimaryAction = true
        num72025PopUpButton.changesSelectionAsPrimaryAction = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cityLabel.text = "Выберите город:   "
        label72025.text = "7-20-25:   "
        
        cityLabel.frame = CGRect(x: 10,
                                 y: 10 + 88,
                                 width: cityLabel.intrinsicContentSize.width,
                                 height: 50)
        
        cityPopUpButton.frame = CGRect(x: cityLabel.frame.origin.x + cityLabel.frame.width,
                                       y: cityLabel.frame.origin.y,
                                       width: view.frame.size.width - 20 - cityLabel.frame.origin.x + cityLabel.frame.width,
                                       height: 50)
        
        cityPopUpButton.contentHorizontalAlignment = .left
        
        label72025.frame = CGRect(x: 10,
                                y: cityPopUpButton.frame.origin.y + cityPopUpButton.frame.size.height + 10,
                                width: cityLabel.intrinsicContentSize.width,
                                height: 50)
        
        num72025PopUpButton.frame = CGRect(x: cityLabel.frame.origin.x + cityLabel.frame.width,
                                      y: cityPopUpButton.frame.origin.y + cityPopUpButton.frame.size.height + 10,
                                      width: view.frame.size.width - 20 - label72025.frame.origin.x + label72025.frame.width,
                                      height: 50)
        
        num72025PopUpButton.contentHorizontalAlignment = .left

        tableView.frame = CGRect(x: 0,
                                 y: num72025PopUpButton.frame.origin.y + num72025PopUpButton.frame.size.height + 10,
                                 width: view.frame.size.width,
                                 height: (view.frame.size.height - num72025PopUpButton.frame.maxY))
        
        view.addSubview(cityLabel)
        view.addSubview(label72025)
        view.addSubview(cityPopUpButton)
        view.addSubview(num72025PopUpButton)
        view.addSubview(tableView)
        
//        scrollView.contentSize = CGSize(width: view.frame.width, height: 0)
    }
}

 
extension ResidentialComplexesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResidentialComplexesTableViewCell.identifier, for: indexPath) as? ResidentialComplexesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(residentialComplexModel: data[indexPath.row])
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let newDestinationVC = ArticleDetailsViewController()
//        newDestinationVC.article = data[indexPath.row]
//        print("action")
//
//        self.navigationController?.pushViewController(newDestinationVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
//        present(newDestinationVC, animated: true, completion: { tableView.deselectRow(at: indexPath, animated: true) })
        
    }
}

extension ResidentialComplexesViewController: ResidentialComplexesTableViewCellDelegate {
    func didTapButton(par1: Int, par2: Int) {
        self.par1 = par1
        self.par2 = par2
        
        let newDestinationVC = MortgageDetailsViewController()
        
        newDestinationVC.arg1 = "\(par2)"
        newDestinationVC.arg2 = "\(par2/5)"
        
        
        newDestinationVC.id = mort72025.id
        newDestinationVC.name = mort72025.name
        newDestinationVC.AEIR = mort72025.AEIR
        newDestinationVC.firstStageRate = mort72025.firstStageRate
        newDestinationVC.ageOfBorrower = mort72025.ageOfBorrower
        newDestinationVC.initialFeePercentageString = mort72025.initialFeePercentageString
        newDestinationVC.initialFeeLowerBound = mort72025.initialFeeLowerBound
        newDestinationVC.initialFeeUpperBound = mort72025.initialFeeUpperBound
        newDestinationVC.maxCredit = mort72025.maxCredit
        newDestinationVC.continuousWorkExperience = mort72025.continuousWorkExperience
        newDestinationVC.minTerm = mort72025.minTerm
        newDestinationVC.maxTerm = mort72025.maxTerm
        newDestinationVC.feePercent = mort72025.feePercent
        newDestinationVC.feeInitial = mort72025.feeInitial
        newDestinationVC.properties = mort72025.properties
        newDestinationVC.whereToApply = mort72025.whereToApply
        newDestinationVC.details = mort72025.details
        newDestinationVC.detailsColors = mort72025.detailsColors
        newDestinationVC.detailsFull = mort72025.detailsFull
        newDestinationVC.imageName = mort72025.imageName
        
        self.navigationController?.pushViewController(newDestinationVC, animated: true)
    }
}

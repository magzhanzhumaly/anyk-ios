//
//  MortgageListViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 20.09.2022.
//

import UIKit

class MortgageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var textField1 = ""
    var textField2 = ""
    var textField3 = ""
    var textField4 = ""
    var textField6_1 = ""
    var textField6_2 = ""
    var textField6_3 = ""
    var textField8_1 = ""
    var textField8_2 = ""
    var textField8_3 = ""
    
    var segCtrl1Choice: Int = 0
    var segCtrl2Choice: Int = 0
    var segCtrl3Choice: Int = 0
    var segCtrl4Choice: Int = 0
    
    var sec1height = 20
    
    private var id = -1
    private var name = ""
    private var AEIR = 0.0 // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    private var firstStageRate = 0.0
    private var ageOfBorrower = [""]
    private var initialFee = ""
    private var maxCredit = 0
    private var continuousWorkExperience = ""
    
    private var minTerm = 0
    private var maxTerm = 0
    
    private var feePercent = 0.0
    private var feeInitial = 0.0
    
    private var properties = [""]
    private var whereToApply = [""]
    private var details = [""]
    private var detailsColors = [""]
    private var detailsFull = ""
    private var imageName = ""

    private let mortgageManager = MortgageManager()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(MortgageTableViewCell.self, forCellReuseIdentifier: MortgageTableViewCell.identifier)  // registered MortageTableViewCell.self
        
        return tableView
    }()

    private var data = [[MortgageModel]]()
    
    private let headerLabel1 = UILabel()
    private let headerLabel2 = UILabel()
    private let button1 = UIButton()
    
    private let button2: UIButton = {
        let h = UIScreen.main.bounds.height - 88

        let optionClosure = {(action : UIAction) in
            print(action.title)
        }

        let btn = UIButton()
        btn.menu = UIMenu(children : [
            UIAction(title: "общей переплате ▼", state: .on, handler: optionClosure),
            UIAction(title: "ежемесячному платежу ▼", handler: optionClosure),
            UIAction(title: "процентной ставке (ГЭСВ) ▼", handler: optionClosure),
            UIAction(title: "первоначальному взносу ▼", handler: optionClosure)])

        btn.showsMenuAsPrimaryAction = true
        btn.changesSelectionAsPrimaryAction = true
//        btn.setTitle("общей переплате ▼", for: .normal)

        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    func setPopupButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        data.append([MortgageModel]())
        data.append([MortgageModel]())
        data.append([MortgageModel]())

        title = "Ипотеки"
          
        
//        print("textField1 = \(textField1)")
//        print("textField2 = \(textField2)")
//        print("textField3 = \(textField3)")
//        print("textField4 = \(textField4)")
//        print("textField6_1 = \(textField6_1)")
//        print("textField6_2 = \(textField6_2)")
//        print("textField6_3 = \(textField6_3)")
//        print("textField8_1 = \(textField8_1)")
//        print("textField8_2 = \(textField8_2)")
//        print("textField8_3 = \(textField8_3)")


//        print("segCtrl1Choice = \(segCtrl1Choice)")
//        print("segCtrl2Choice = \(segCtrl2Choice)")
//        print("segCtrl3Choice = \(segCtrl3Choice)")
//        print("segCtrl4Choice = \(segCtrl4Choice)")
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        var hdrLbl1cnt = 0
        var hdrLbl2cnt = 0

        mortgageManager.fetchData(textField1: textField1, textField2: textField2, textField3: textField3, textField4: textField4, textField6_1: textField6_1, textField6_2: textField6_2, textField6_3: textField6_3, textField8_1: textField8_1, textField8_2: textField8_2, textField8_3: textField8_3, segCtrl1Choice: segCtrl1Choice, segCtrl2Choice: segCtrl2Choice, segCtrl3Choice: segCtrl3Choice, segCtrl4Choice: segCtrl4Choice, completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.data[0].append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                break
            }
            hdrLbl1cnt = (self?.data[0].count)!
        })
        
        mortgageManager.fetchLeftOutData(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.data[1].append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                break
            }
            hdrLbl2cnt = (self?.data[1].count)!
        })
        
        mortgageManager.fetchRentals(completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.data[2].append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                break
            }
        })
        

        
        headerLabel1.text = "Под ваши условия подходят 0 программ"
        headerLabel2.text = "К Вашим условиям не подошли "

        var lowestY = 0
        var tempHeight = 0
        
        let w = view.frame.size.width
        
        let header = UIView()
        
        
        tempHeight = Int(headerLabel1.intrinsicContentSize.height + 10)
        headerLabel1.font = .systemFont(ofSize: 16, weight: UIFont.Weight.medium)
        headerLabel1.frame = CGRect(x: 10, y: 10, width: Int(w) - 20, height: tempHeight)
        headerLabel1.textAlignment = .left
        header.addSubview(headerLabel1)
        
        
        headerLabel2.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        lowestY = 20 + tempHeight

        headerLabel1.text = "Под ваши условия подходят \(hdrLbl1cnt) программ"

        if hdrLbl2cnt == 0 {
            self.headerLabel2.text = "К Вашим условиям не подошли 0 программ "
        } else {
            if hdrLbl2cnt == 1 {
                self.headerLabel2.text = "К Вашим условиям не подошла 1 программа. "
                
            } else {
                self.headerLabel2.text = "К Вашим условиям не подошли \(hdrLbl2cnt) программы. "
            }
            
            self.button1.setTitle("Перейти", for: .normal)
            self.button1.titleLabel?.font =  .systemFont(ofSize: 12, weight: UIFont.Weight.light)
            self.button1.frame = CGRect(x: self.headerLabel2.intrinsicContentSize.width + 10,
                                        y: CGFloat(lowestY),
                                        width: self.button1.titleLabel?.intrinsicContentSize.width ?? 40,
                                        height: self.button1.titleLabel?.intrinsicContentSize.height ?? 10)
            self.button1.addTarget(self, action: #selector(self.button1Action), for: .touchUpInside)
            self.button1.setTitleColor(UIColor(named: "AccentColor"), for: .normal)
            header.addSubview(self.button1)
        }

        tempHeight = Int(headerLabel2.intrinsicContentSize.height)
        headerLabel2.frame = CGRect(x: 10, y: lowestY, width: Int(w) - 20, height: tempHeight)
        headerLabel2.textAlignment = .left
        header.addSubview(headerLabel2)

        tableView.tableHeaderView = header
        
        lowestY += 10 + tempHeight
        
        
        let headerLabel3 = UILabel()
        headerLabel3.text = "Сортировать по: "
        headerLabel3.textColor = .gray
        
        tempHeight = Int(headerLabel3.intrinsicContentSize.height)
        headerLabel3.font = .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        headerLabel3.frame = CGRect(x: 10, y: lowestY, width: Int(w) - 20, height: tempHeight)
        headerLabel3.textAlignment = .left
        header.addSubview(headerLabel3)
        
        button2.frame = CGRect(x: headerLabel3.intrinsicContentSize.width + 10,
                               y: CGFloat(lowestY),
                               width: 160,
                               height: button2.titleLabel?.intrinsicContentSize.height ?? 10)
        button2.titleLabel?.textAlignment = .left
        button2.titleLabel?.font =  .systemFont(ofSize: 12, weight: UIFont.Weight.light)
        
        lowestY += tempHeight
        header.addSubview(button2)
        header.frame = CGRect(x: 0, y: 0, width: Int(w), height: lowestY + 10)
    }
    
    @objc func button1Action(sender: UIButton!) {
        
        for i in 0..<data[0].count {
            var ret = 234
            
            if data[0][i].details.count == 1 {
                ret = 234
            } else if data[0][i].details.count == 2 {
                ret = 263
            } else if data[0][i].details.count == 3 {
                ret = 292
            }
            sec1height += ret
        }
        
        self.tableView.contentOffset.y = CGFloat(self.sec1height)
        sec1height = 20
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MortgageTableViewCell.identifier, for: indexPath) as? MortgageTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(id: data[indexPath.section][indexPath.row].pos, name: data[indexPath.section][indexPath.row].name, AEIR: data[indexPath.section][indexPath.row].AEIR, firstStageRate: data[indexPath.section][indexPath.row].firstStageRate, ageOfBorrower: data[indexPath.section][indexPath.row].ageOfBorrower, initialFee: data[indexPath.section][indexPath.row].initialFee, maxCredit: data[indexPath.section][indexPath.row].maxCredit, continuousWorkExperience: data[indexPath.section][indexPath.row].continuousWorkExperience, minTerm: data[indexPath.section][indexPath.row].minTerm, maxTerm: data[indexPath.section][indexPath.row].maxTerm, feePercent: data[indexPath.section][indexPath.row].feePercent, feeInitial: data[indexPath.section][indexPath.row].feeInitial, properties: data[indexPath.section][indexPath.row].properties, whereToApply: data[indexPath.section][indexPath.row].whereToApply, details: data[indexPath.section][indexPath.row].details, detailsColors: data[indexPath.section][indexPath.row].detailsColors, detailsFull: data[indexPath.section][indexPath.row].detailsFull, imageName: data[indexPath.section][indexPath.row].imageName)
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var ret: CGFloat
        if data[indexPath.section][indexPath.row].AEIR < 0 {
            
            if data[indexPath.section][indexPath.row].pos == 47 {
                ret = 360
            } else if data[indexPath.section][indexPath.row].pos == 48 {
                ret = 332
            } else {
                ret = 350
            }
            
            
//            ret = ret + CGFloat(whereToApply.count) * 14
            return ret
            
        } else {
            
            if data[indexPath.section][indexPath.row].details.count == 1 {
                ret = 234
            } else if data[indexPath.section][indexPath.row].details.count == 2 {
                ret = 263
            } else if data[indexPath.section][indexPath.row].details.count == 3 {
                ret = 292
            } else {
                ret = 234
            }
            
            return ret
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            if data[1].count > 0 {
                return 100
            } else {
                return 0
            }
        } else if section == 2 {
            return 100
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if data[1].count > 0 {
            if section == 1 {
                let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
                //            view.backgroundColor = .red
                let lbl = UILabel(frame: CGRect(x: 10, y: 20, width: view.frame.width - 20, height: 40))
                
                lbl.font = .systemFont(ofSize: 14, weight: UIFont.Weight.medium)
                lbl.numberOfLines = 2
                lbl.textAlignment = .center
                lbl.text = "Ничего не подошло? Есть еще \(data[1].count) программы, которые могут быть вам интересны"
                view.addSubview(lbl)
                return view
            }
        }
                
        if section == 2 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
            let lbl = UILabel(frame: CGRect(x: 10, y: 15, width: view.frame.width - 20, height: 40))
            
            lbl.font = .systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            lbl.numberOfLines = 2
            lbl.textAlignment = .center
            lbl.text = "Арендное жилье"
            view.addSubview(lbl)
            return view
        }
        return UIView()
    }
    /*
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        
        spinner.startAnimating()
        
        return footerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        /*
        if position > (tableView.contentSize.height - 100 - scrollView.frame.size.height) {
            // fetch more data
            guard !mortgageManager.isPaginating else {
                // we are already fetching more data
                return
            }
            
            self.tableView.tableFooterView = createSpinnerFooter()
            
            mortgageManager.fetchData(pagination: true) { [weak self] result in
                DispatchQueue.main.async {
                    self?.tableView.tableFooterView = nil
                }
                switch result {
                case .success(let moreData):
                    self?.data.append(contentsOf: moreData)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                case .failure(_):
                    break
                }
            }
            print("Fetch more")
        }
         */
    }*/
}

extension MortgageListViewController: MortgageTableViewCellDelegate {
    func didTapButton(id: Int, name: String, AEIR: Double, firstStageRate: Double, ageOfBorrower: [String], initialFee: String, maxCredit: Int, continuousWorkExperience: String, minTerm: Int, maxTerm: Int, feePercent: Double, feeInitial: Double, properties: [String], whereToApply: [String], details: [String], detailsColors: [String], detailsFull: String, imageName: String) {
        
        self.id = id
        self.name = name
        self.AEIR = AEIR
        self.firstStageRate = firstStageRate
        self.ageOfBorrower = ageOfBorrower
        self.initialFee = initialFee
        self.maxCredit = maxCredit
        self.continuousWorkExperience = continuousWorkExperience
        self.minTerm = minTerm
        self.maxTerm = maxTerm
        self.feePercent = feePercent
        self.feeInitial = feeInitial
        self.properties = properties
        self.whereToApply = whereToApply
        self.details = details
        self.detailsColors = detailsColors
        self.detailsFull = detailsFull
        self.imageName = imageName

        if AEIR < 0 {
            self.performSegue(withIdentifier: "showRentalHousingDetails", sender: self)
        } else {
            self.performSegue(withIdentifier: "showMortgageDetails", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMortgageDetails" {
            let destinationVC = segue.destination as! MortgageDetailsViewController
            
            destinationVC.id = id
            destinationVC.name = name
            destinationVC.AEIR = AEIR
            destinationVC.firstStageRate = firstStageRate
            destinationVC.ageOfBorrower = ageOfBorrower
            destinationVC.initialFee = initialFee
            destinationVC.maxCredit = maxCredit
            destinationVC.continuousWorkExperience = continuousWorkExperience
            destinationVC.minTerm = minTerm
            destinationVC.maxTerm = maxTerm
            destinationVC.feePercent = feePercent
            destinationVC.feeInitial = feeInitial
            destinationVC.properties = properties
            destinationVC.whereToApply = whereToApply
            destinationVC.details = details
            destinationVC.detailsColors = detailsColors
            destinationVC.detailsFull = detailsFull
            destinationVC.imageName = imageName
        }
        if segue.identifier == "showRentalHousingDetails" {
            let destinationVC = segue.destination as! RentalHousingViewController
            
            print("ageofborrower = \(self.ageOfBorrower)")
            destinationVC.txt = self.ageOfBorrower
        }
    }
}

/*
    let newDestinationVC = ResidentialComplexesListViewController()
    newDestinationVC.navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    super.inputViewController?.navigationController(newDestinationVC, animated: true)
    //        self.navigationController?.pushViewController(newDestinationVC, animated: true)

    //        self.performSegue(withIdentifier: "mortgageListSegue", sender: self)
    }
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "mortgageListSegue" {
        let destinationVC = segue.destination as! MortgageDetailsViewController
        
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


*/

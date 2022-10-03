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
    
    private var data = [MortgageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hayuhai")
        view.backgroundColor = .white
        
        title = "Ипотеки"
        
        print("textField1 = \(textField1)")
        print("textField2 = \(textField2)")
        print("textField3 = \(textField3)")
        print("textField4 = \(textField4)")
        print("textField6_1 = \(textField6_1)")
        print("textField6_2 = \(textField6_2)")
        print("textField6_3 = \(textField6_3)")
        print("textField8_1 = \(textField8_1)")
        print("textField8_2 = \(textField8_2)")
        print("textField8_3 = \(textField8_3)")


        print("segCtrl1Choice = \(segCtrl1Choice)")
        print("segCtrl2Choice = \(segCtrl2Choice)")
        print("segCtrl3Choice = \(segCtrl3Choice)")
        print("segCtrl4Choice = \(segCtrl4Choice)")
        
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        mortgageManager.fetchData(pagination: false, completion: { [weak self] result in
            switch result {
            case .success(let data):
                self?.data.append(contentsOf: data)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(_):
                break
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MortgageTableViewCell.identifier, for: indexPath) as? MortgageTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(id: data[indexPath.row].id, name: data[indexPath.row].name, AEIR: data[indexPath.row].AEIR, firstStageRate: data[indexPath.row].firstStageRate, ageOfBorrower: data[indexPath.row].ageOfBorrower, initialFee: data[indexPath.row].initialFee, maxCredit: data[indexPath.row].maxCredit, continuousWorkExperience: data[indexPath.row].continuousWorkExperience, minTerm: data[indexPath.row].minTerm, maxTerm: data[indexPath.row].maxTerm, feePercent: data[indexPath.row].feePercent, feeInitial: data[indexPath.row].feeInitial, properties: data[indexPath.row].properties, whereToApply: data[indexPath.row].whereToApply, details: data[indexPath.row].details, detailsColors: data[indexPath.row].detailsColors, detailsFull: data[indexPath.row].detailsFull, imageName: data[indexPath.row].imageName)
        
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if data[indexPath.row].details.count == 1 {
            return 234
        } else if data[indexPath.row].details.count == 2 {
            return 263
        } else if data[indexPath.row].details.count == 3 {
            return 292
        } else {
            return 234
        }
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
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
        
        self.performSegue(withIdentifier: "showMortgageDetails", sender: self)
        
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

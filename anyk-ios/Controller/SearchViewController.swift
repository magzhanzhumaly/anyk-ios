//
//  SearchViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private var mortgageName = "72025"
    
    private let mortgageManager = MortgageManager()
    
    private var currentID = 0
    
    private var mortgages = [MortgageModel]()

    var valuesArray = [String]()
    
    let dataArray = [36 : "72025",
                     35 : "Баспана ХИТ",
                     34 : "Жилищный заем \"Баспана\"",
                     46 : "5-10-20",
                     45 : "Бақытты отбасы",
                     33 : "\"Стандартный\" для вторичного жилья",
                     32 : "\"Стандартный\" для первичного жилья",
                     31 : "\"Стандартный\" промежуточный заем для \"Свой дом\"",
                     30 : "\"Женил 2\" для вторичного жилья",
                     29 : "\"Женил 2\" для первичного жилья",
                     28 : "\"Женил 2\" промежуточный заем для \"Свой дом\"",
                     27 : "\"Женил\" для вторичного жилья",
                     26 : "\"Женил\" для первичного жилья",
                     25 : "\"Женил\" промежуточный заем для \"Свой дом\"",
                     23 : "Ипотека \"Орда\" от АО \"КИК\"",
                     21 : "Ипотека \"Орда\"",
                     44 : "Военная ипотека",
                     43 : "\"Стандартный\" для военных",
                     42 : "\"Женил\" для военных",
                     41 : "\"Женил 2\" для военных",
                     40 : "Жилищный заем по программе \"Нұрлы жер\"",
                     38 : "\"Стандартный\" заем для \"Нұрлы жер\"",
                     37 : "\"Женил 2\" заем для \"Нұрлы жер\"",
                     20 : "\"Жас отбасы\" с типом займа \"Жеңіл\"",
                     18 : "\"Стандартный\" заем от \"Жилстройсбербанка и BI Group\"",
                     16 : "\"Женил\" от \"Жилстройсбербанка и BI Group\"",
                     15 : "Ипотека от Halykbank с подтверждением дохода без первоначального взноса",
                     14 : "Ипотека от Halykbank с подтверждением дохода",
                     13 : "Жилищный кредит от Сбербанка с полным подтверждением доходов",
                     12 : "Жилищный кредит от Сбербанка с частичным подтверждением доходов",
                     10 : "Ипотека от Fortebank с подтверждением дохода",
                     9 : "Ипотека от Fortebank без подтверждения дохода",
                     8 : "Ипотека от АТФ Банка с полным подтверждением доходов",
                     7 : "Ипотека от АТФ Банка с частичным подтверждением доходов",
                     3 : "Ипотека от Bank RBK",
                     5 : "Ипотека Nurbank",
                     4 : "Ипотека от Halykbank без подтверждения дохода",
                     1 : "Ипотека от Altynbank с полным подтверждением доходов",
                     2 : "Ипотека от Altynbank с частичным подтверждением доходов"
    ]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = valuesArray[0]
        return row
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 400, height: 44));
        label.lineBreakMode = .byWordWrapping;
        label.font = UIFont.systemFont(ofSize: 12.0)

        label.numberOfLines = 0;
        label.text = dataArray[row]
        label.sizeToFit()
        label.textAlignment = .center
        return label;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mortgageName = dataArray[row] ?? ""
    }

    
    var lbl: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: h/4 + 88, width: UIScreen.main.bounds.width, height: h/12))
        lbl.text = "Выберите опцию"
        lbl.font = .systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        lbl.numberOfLines = 1
        lbl.textColor = UIColor(named: "AccentColor")
        lbl.textAlignment = .center

        return lbl
    }()


    var UIPicker: UIPickerView = {
        let h = UIScreen.main.bounds.height - 88

        let UIPicker = UIPickerView(frame: CGRect(x: 0, y: h*5/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        
        return UIPicker
    }()
    
    
    var btn: UIButton = {
        let h = UIScreen.main.bounds.height - 88
        let w = UIScreen.main.bounds.width/3
        
        let btn = UIButton(frame: CGRect(x: w, y: 5*h/9 + 88, width: w, height: h/18))
        btn.setTitle("Искать", for: .normal)
        btn.backgroundColor = UIColor(named: "AccentColor")
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
    }()

    @objc func buttonAction(sender: UIButton!) {
                
        for i in dataArray {
            if i.value == mortgageName {
                currentID = i.key
                break
            }
        }
        print("currentID = \(currentID)")
        
                
        var newData = mortgages
        var returnData = newData.filter({ $0.id == currentID })

        let currentMortgageChosen = returnData[0]
        
        
        let newDestinationVC = MortgageDetailsViewController()

        print("currentMortgageChosen = \(currentMortgageChosen)")
        newDestinationVC.id = currentMortgageChosen.id
        newDestinationVC.name = currentMortgageChosen.name
        newDestinationVC.AEIR = currentMortgageChosen.AEIR
        newDestinationVC.firstStageRate = currentMortgageChosen.firstStageRate
        newDestinationVC.ageOfBorrower = currentMortgageChosen.ageOfBorrower
        newDestinationVC.initialFeePercentageString = currentMortgageChosen.initialFeePercentageString
        newDestinationVC.initialFeeLowerBound = currentMortgageChosen.initialFeeLowerBound
        newDestinationVC.initialFeeUpperBound = currentMortgageChosen.initialFeeUpperBound
        newDestinationVC.maxCredit = currentMortgageChosen.maxCredit
        newDestinationVC.continuousWorkExperience = currentMortgageChosen.continuousWorkExperience
        newDestinationVC.minTerm = currentMortgageChosen.minTerm
        newDestinationVC.maxTerm = currentMortgageChosen.maxTerm
        newDestinationVC.feePercent = currentMortgageChosen.feePercent
        newDestinationVC.feeInitial = currentMortgageChosen.feeInitial
        newDestinationVC.properties = currentMortgageChosen.properties
        newDestinationVC.whereToApply = currentMortgageChosen.whereToApply
        newDestinationVC.details = currentMortgageChosen.details
        newDestinationVC.detailsColors = currentMortgageChosen.detailsColors
        newDestinationVC.detailsFull = currentMortgageChosen.detailsFull
        newDestinationVC.imageName = currentMortgageChosen.imageName
        
        self.navigationController?.pushViewController(newDestinationVC, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lbl)
        view.addSubview(btn)
        view.endEditing(true)


        valuesArray = Array(dataArray.values)
        
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        self.view.addSubview(UIPicker)
        UIPicker.center = self.view.center
        
        
        mortgageManager.fetchData(textField1: "", textField2: "", textField3: "", textField4: "Не выбрано", textField6_1: "", textField6_2: "", textField6_3: "", textField8_1: "", textField8_2: "", textField8_3: "", segCtrl1Choice: 0, segCtrl2Choice: 0, segCtrl3Choice: 0, segCtrl4Choice: 0) { [weak self] result in
            switch result {
            case .success(let data):
                self?.mortgages.append(contentsOf: data)
            case .failure(_):
                break
            }
        }
    }
}

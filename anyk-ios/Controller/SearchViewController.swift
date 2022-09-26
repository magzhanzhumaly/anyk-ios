//
//  SearchViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var mortgageName = "72025"
    
    let dataArray = ["72025",
                     "Баспана ХИТ",
                     "Жилищный заем \"Баспана\"",
                     "5-10-20",
                     "Бақытты отбасы",
                     "\"Стандартный\" для вторичного жилья",
                     "\"Стандартный\" для первичного жилья",
                     "\"Стандартный\" промежуточный заем для \"Свой дом\"",
                     "\"Женил 2\" для вторичного жилья",
                     "\"Женил 2\" для первичного жилья",
                     "\"Женил 2\" для промежуточный заем для \"Свой дом\"",
                     "\"Женил\" для вторичного жилья",
                     "\"Женил\" для первичного жилья",
                     "\"Женил\" для промежуточный заем для \"Свой дом\"",
                     "Ипотека \"Орда\" от АО \"КИК\"",
                     "Ипотека \"Орда\"",
                     "Военная ипотека",
                     "\"Стандартный\" для военных",
                     "\"Женил\" для военных",
                     "\"Женил 2\" для военных",
                     "Жилищный заем по программе \"Нұрлы жер\"",
                     "\"Стандартный\" заем для \"Нұрлы жер\"",
                     "\"Женил 2\" заем для \"Нұрлы жер\"",
                     "\"Жас отбасы\" с типом займа \"Жеңіл\"",
                     "\"Стандартный\" заем от \"Жилстройсбербанка и BI Group\"",
                     "\"Женил\" от \"Жилстройсбербанка и BI Group\"",
                     "Ипотека от Halykbank с подтверждением дохода без первоначального взноса",
                     "Ипотека от Halykbank с подтверждением дохода",
                     "Жилищный кредит от Сбербанка с полным подтверждением доходов",
                     "Жилищный кредит от Сбербанка с частичным подтверждением доходов",
                     "Ипотека от Fortebank с подтверждением дохода",
                     "Ипотека от Fortebank без подтверждения дохода",
                     "Ипотека от АТФ Банка с полным подтверждением доходов",
                     "Ипотека от АТФ Банка с частичным подтверждением доходов",
                     "Ипотека от Bank RBK",
                     "Ипотека Nurbank",
                     "Ипотека от Halykbank без подтверждения дохода",
                     "Ипотека от Altynbank с полным подтверждением доходов",
                     "Ипотека от Altynbank с частичным подтверждением доходов"
    ]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
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
        mortgageName = dataArray[row]
    }

    
    var lbl: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: h/4 + 88, width: UIScreen.main.bounds.width, height: h/12))
        lbl.text = "Выберите опцию"
        lbl.font = .systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        lbl.numberOfLines = 1
        lbl.textColor = UIColor(red: 211/255.0,
                                green: 112/255.0,
                                blue: 86/255.0,
                                alpha: 1)
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
        btn.backgroundColor = UIColor(red: 211/255.0,
                                      green: 112/255.0,
                                      blue: 86/255.0,
                                      alpha: 1)
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
    }()

    @objc func buttonAction(sender: UIButton!) {
        let newDestinationVC = SingleMortgageViewController()
        newDestinationVC.mortgageName = mortgageName
        
        self.navigationController?.pushViewController(newDestinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lbl)
        view.addSubview(btn)

        
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        self.view.addSubview(UIPicker)
        UIPicker.center = self.view.center
    }
}

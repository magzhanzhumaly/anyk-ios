//
//  ResidentialComplexesViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class ResidentialComplexesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectedCity = "Все города"
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCity = dataArray[row]
//        print("The selected row value is : \(selectedCity)")
    }
    
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

    var lbl: UILabel = {
        let h = UIScreen.main.bounds.height - 88

        let lbl = UILabel(frame: CGRect(x: 0, y: h/4 + 88, width: UIScreen.main.bounds.width, height: h/12))
        lbl.text = "Выберите город"
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
        let newDestinationVC = ResidentialComplexesListViewController()
        newDestinationVC.selectedCity = selectedCity
        
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

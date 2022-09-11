//
//  ResidentialComplexesViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class ResidentialComplexesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
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
        lbl.textColor = UIColor(red: 211/255.0,
                                green: 112/255.0,
                                blue: 86/255.0,
                                alpha: 1)
        lbl.textAlignment = .center
//        lbl.backgroundColor = .black
//        lbl.alpha = 0.5
        return lbl
    }()

    var UIPicker: UIPickerView = {
        let h = UIScreen.main.bounds.height - 88

        let UIPicker = UIPickerView(frame: CGRect(x: 0, y: h*5/6 + 88, width: UIScreen.main.bounds.width, height: h/6))
        
//        UIPicker.lines
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
//        btn.setTitleColor(UIColor(red: 211/255.0,
//                                  green: 112/255.0,
//                                  blue: 86/255.0,
//                                  alpha: 1), for: .normal)
        btn.titleLabel?.numberOfLines = 3
        btn.layer.cornerRadius = 20
        btn.titleLabel?.textAlignment = .center
        btn.configuration?.titleAlignment = .center
//          button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        return btn
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(lbl)
        view.addSubview(btn)
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        self.view.addSubview(UIPicker)
        UIPicker.center = self.view.center


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

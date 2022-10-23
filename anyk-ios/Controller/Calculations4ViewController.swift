//
//  Calculations4ViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 19.10.2022.
//

import UIKit

class Calculations4ViewController: UIViewController {

    var id = -1
    var name = ""
    var AEIR = 0.0 // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    var firstStageRate = 0.0
    var ageOfBorrower = [""]
    var initialFee = ""
    var maxCredit = 0
    var continuousWorkExperience = ""
    
    var minTerm = 0
    var maxTerm = 0
    
    var feePercent = 0.0
    var feeInitial = 0.0
    
    var properties = [""]
    var whereToApply = [""]
    var details = [""]
    var detailsColors = [""]
    var detailsFull = ""
    var imageName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "calculations4"

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

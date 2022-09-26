//
//  ResidentialComplexesListViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 25.09.2022.
//

import UIKit

class ResidentialComplexesListViewController: UIViewController {

    var selectedCity = "Все города"

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedCity
        
        view.backgroundColor = .white
        print("residential complexes list view controller")
        print("chosen city is \(selectedCity)")
        
    }
    
}

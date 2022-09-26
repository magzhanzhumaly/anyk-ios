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
    
    private let mortgageManager = MortgageManager()

    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    private var data = [String]()
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
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
    }
}

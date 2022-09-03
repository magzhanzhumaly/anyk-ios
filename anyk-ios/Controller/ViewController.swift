//
//  ViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 02.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var menuTableView: UITableView!
    
    
    var options: [option] = [
        
        option(title: "Вход",
               segue: "ВходSegue"), // 1
        
        option(title: "Поиск",
               segue: "ПоискSegue"), // 2
        
        option(title: "Главная",
               segue: "ГлавнаяSegue"), // 3
        
        option(title: "Ипотека",
                   segue: "ИпотекаSegue"), // 4
        
        option(title: "Статьи",
               segue: "СтатьиSegue"), // 5
        
        option(title: "Жилые Комплексы",
               segue: "ЖКSegue"), // 6
        
        option(title: "Сообщество",
               segue: "СообществоSegue"), // 7
        
        option(title: "О нас",
               segue: "ОНасSegue"), // 8
        
        option(title: "Помощь",
               segue: "ПомощьSegue"), // 9
        
    ]
    
    struct option {
        var title = String()
        var segue = String()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.delegate = self
        menuTableView.dataSource = self
        menuTableView.backgroundColor = .clear
    }


}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! tableViewCell
        
        cell.backgroundColor = .clear
        cell.descriptionLabel.text = options[indexPath.row].title
        cell.descriptionLabel.textColor = .white // Subject ot change
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let indexPath = tableView.indexPathForSelectedRow {
            
            let currentCell = (tableView.cellForRow(at: indexPath) ?? UITableViewCell()) as UITableViewCell
            
            currentCell.alpha = 0.5
            UIView.animate(withDuration: 1) {
                currentCell.alpha = 1
            }
            
            self.parent?.performSegue(withIdentifier: options[indexPath.row].segue, sender: self)
        }
    }
    
}

class tableViewCell: UITableViewCell {
    
    @IBOutlet var descriptionLabel: UILabel!
}

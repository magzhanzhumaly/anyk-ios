//
//  SideMenu.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

protocol MenuControllerDelegate {
    func didSelectMenuItem(named: SideMenuItem)
}

enum SideMenuItem: String, CaseIterable {
    case login = "Вход"
    case search = "Поиск"
    case mainPage = "Главная"
    case articles = "Статьи"
    case residentialComplexes = "Жилые Комплексы"
    case community = "Сообщество"
    case aboutUs = "О нас"
    case help = "Помощь"
}

class MenuController: UITableViewController {
    public var delegate: MenuControllerDelegate?
    
    private let menuItems: [SideMenuItem]
    private let color = UIColor(red: 211/255.0,
                                green: 112/255.0,
                                blue: 86/255.0,
                                alpha: 1)
    
    init(with menuItems: [SideMenuItem]) {
        self.menuItems = menuItems
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = color
        view.backgroundColor = color
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row].rawValue
        cell.textLabel?.textColor = .white
        cell.backgroundColor = color
        cell.contentView.backgroundColor = color
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedItem = menuItems[indexPath.row]
        delegate?.didSelectMenuItem(named: selectedItem)
    }
}

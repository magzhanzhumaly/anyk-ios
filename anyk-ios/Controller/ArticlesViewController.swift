//
//  ArticlesViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    var chosenType = "Все статьи"
    var chosenTag = "Не выбрано"
    
    var articleManager = ArticleManager()

    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88))
        return scrollView
    }()

    let typeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()

    let tagLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()
    
    private let typePopUpButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88
        let btn = UIButton()
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }

        return btn
    }()
    
    private let tagPopUpButton: UIButton = {
        let h = UIScreen.main.bounds.height - 88
        let btn = UIButton()
        
        let optionClosure = {(action : UIAction) in
            print(action.title)
        }

        return btn
    }()
    
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ArticleTableViewCell.self, forCellReuseIdentifier: ArticleTableViewCell.identifier)
        
        return tableView
    }()
    
    private var fullData = [ArticleModel]()
    private var data = [ArticleModel]()
    private var storeData = [ArticleModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.endEditing(true)

        tableView.delegate = self
        tableView.dataSource = self
        
        typePopUpButton.setTitleColor(.label, for: .normal)
        tagPopUpButton.setTitleColor(.label, for: .normal)

        view.addSubview(scrollView)
        
        articleManager.fetchData() { [weak self] result in
            guard let strongSelf = self else {
                return
            }

            switch result {
            case .success(let data):
                strongSelf.fullData.append(contentsOf: data)
                strongSelf.data.append(contentsOf: data)
                strongSelf.storeData.append(contentsOf: data)
                DispatchQueue.main.async {
                    strongSelf.tableView.reloadData() }
            case .failure(_):
                break
            }
        }

        var artTagOptionClosure = {[weak self] (action : UIAction) in }
           
        artTagOptionClosure = {[weak self] (action : UIAction) in
            guard let strongSelf = self else {
                return
            }
            strongSelf.chosenTag = action.title
            strongSelf.tableView.reloadData()
            
            
            // filtering
            strongSelf.data = strongSelf.storeData.filter({
                if $0.tags.contains(strongSelf.chosenTag) || strongSelf.chosenTag == "Не выбрано" {
                    return true
                }
                return false
            })
            
            strongSelf.tableView.reloadData()

        }
        
        tagPopUpButton.menu = UIMenu(children : [
            UIAction(title: Tags.neVybrano.rawValue , state: .on, handler: artTagOptionClosure),
            UIAction(title: Tags.ocheredNaZhilie.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.arendnoyeZhilie.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.lgotnyeProgrammy.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.programmyZSSB.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.bakyttyOtbasy.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.tag72025.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.baspanaHit.rawValue, handler: artTagOptionClosure),
            UIAction(title: Tags.tag51020.rawValue, handler: artTagOptionClosure)
        ])


        let artTypeOptionClosure = { [weak self] (action : UIAction) in
            guard let strongSelf = self else {
                return
            }
            
            strongSelf.chosenType = action.title
            print("strongSelf.chosenType = \(strongSelf.chosenType)")
            
            print(action.title)
            if action.title == "Новости" {
                strongSelf.tagPopUpButton.menu = UIMenu(children : [
                    UIAction(title: Tags.neVybrano.rawValue , state: .on, handler: artTagOptionClosure),
                    UIAction(title: Tags.lgotnyeProgrammy.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.priyomZayavok.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.nedvizhimost.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.obshestvo.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.zhilFond.rawValue, handler: artTagOptionClosure)
                ])

            } else if action.title == "Полезные статьи" {
                strongSelf.tagPopUpButton.menu = UIMenu(children : [
                    UIAction(title: Tags.neVybrano.rawValue , state: .on, handler: artTagOptionClosure),
                    UIAction(title: Tags.ocheredNaZhilie.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.arendnoyeZhilie.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.pensionnyeNakopleniya.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.lgoty.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.zalog.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.vozngarozhdeniya.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.depozit.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.otsenochnyiPokazatel.rawValue, handler: artTagOptionClosure)
                ])

            } else if action.title == "История клиента" || action.title == "Ипотека" {
                strongSelf.tagPopUpButton.menu = UIMenu(children : [
                    UIAction(title: Tags.neVybrano.rawValue , state: .on, handler: artTagOptionClosure),
                    UIAction(title: Tags.lgotnyeProgrammy.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.programmyZSSB.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.bakyttyOtbasy.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.tag72025.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.baspanaHit.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.tag51020.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.nurlyZher.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.voyennyiProdukt.rawValue, handler: artTagOptionClosure)
                ])

            } else { // Все статьи
                strongSelf.tagPopUpButton.menu = UIMenu(children : [
                    UIAction(title: Tags.neVybrano.rawValue , state: .on, handler: artTagOptionClosure),
                    UIAction(title: Tags.ocheredNaZhilie.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.arendnoyeZhilie.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.lgotnyeProgrammy.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.programmyZSSB.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.bakyttyOtbasy.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.tag72025.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.baspanaHit.rawValue, handler: artTagOptionClosure),
                    UIAction(title: Tags.tag51020.rawValue, handler: artTagOptionClosure)
                ])
            }
            
            // filtering
            strongSelf.data = strongSelf.fullData.filter({
                if $0.articleType == strongSelf.chosenType || strongSelf.chosenType == "Все статьи" {
                    return true
                }
                return false
            })
            
            strongSelf.storeData = strongSelf.data
            
            strongSelf.tableView.reloadData()
        }
        
        typePopUpButton.menu = UIMenu(children : [
            UIAction(title: "Все статьи", state: .on, handler: artTypeOptionClosure),
            UIAction(title: "Новости", handler: artTypeOptionClosure),
            UIAction(title: "Полезные статьи", handler: artTypeOptionClosure),
            UIAction(title: "История клиента", handler: artTypeOptionClosure),
            UIAction(title: "Ипотека", handler: artTypeOptionClosure)
        ])
        
        typePopUpButton.setTitle(chosenType, for: .normal)
        
        typePopUpButton.showsMenuAsPrimaryAction = true
        typePopUpButton.changesSelectionAsPrimaryAction = true
               
        if chosenType == "Все статьи" {
                    } else if chosenType == "Новости" {
                    } else if chosenType == "Полезные статьи" {
                    } else if chosenType == "История клиента" || chosenType == "Ипотека" {
                    }
        
                        
        tagPopUpButton.setTitle(chosenTag, for: .normal)
        tagPopUpButton.showsMenuAsPrimaryAction = true
        tagPopUpButton.changesSelectionAsPrimaryAction = true
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        typeLabel.text = "Тип:   "
        tagLabel.text = "Тэг:   "
        
        typeLabel.frame = CGRect(x: 10,
                                 y: 10,
                                 width: typeLabel.intrinsicContentSize.width,
                                 height: 50)
        
        typePopUpButton.frame = CGRect(x: typeLabel.frame.origin.x + typeLabel.frame.width,
                                       y: 10,
                                       width: view.frame.size.width - 20 - typeLabel.frame.origin.x + typeLabel.frame.width,
                                       height: 50)
        
        typePopUpButton.contentHorizontalAlignment = .left
        
        tagLabel.frame = CGRect(x: 10,
                                y: typePopUpButton.frame.origin.y + typePopUpButton.frame.size.height + 10,
                                width: typeLabel.intrinsicContentSize.width,
                                height: 50)
        
        tagPopUpButton.frame = CGRect(x: typeLabel.frame.origin.x + typeLabel.frame.width,
                                      y: typePopUpButton.frame.origin.y + typePopUpButton.frame.size.height + 10,
                                      width: view.frame.size.width - 20 - tagLabel.frame.origin.x + tagLabel.frame.width,
                                      height: 50)
        
        tagPopUpButton.contentHorizontalAlignment = .left

        tableView.frame = CGRect(x: 0,
                                 y: tagPopUpButton.frame.origin.y + tagPopUpButton.frame.size.height + 10,
                                 width: view.frame.size.width,
                                 height: (view.frame.size.height - tagPopUpButton.frame.maxY) - 88)
        
        scrollView.addSubview(typeLabel)
        scrollView.addSubview(tagLabel)
        scrollView.addSubview(typePopUpButton)
        scrollView.addSubview(tagPopUpButton)
        scrollView.addSubview(tableView)
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: 0)
    }
}

 
extension ArticlesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as? ArticleTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(articleModel: data[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let newDestinationVC = ArticleDetailsViewController()
        newDestinationVC.article = data[indexPath.row]
        print("action")
        
        self.navigationController?.pushViewController(newDestinationVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
//        present(newDestinationVC, animated: true, completion: { tableView.deselectRow(at: indexPath, animated: true) })
        
    }
}

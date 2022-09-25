//
//  ArticlesViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class ArticlesViewController: UIViewController {
    
    var segControl: UISegmentedControl = {
        let segmentItems = ["Все статьи", "Новости", "Полезные статьи", "История клиента", "Ипотека"]
        let control = UISegmentedControl(items: segmentItems)
        control.frame = CGRect(x: 10, y: 88, width: (UIScreen.main.bounds.width - 20), height: 40)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 1

        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(segControl)
    }
    
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            var txt: UILabel = {
                let h = UIScreen.main.bounds.height - 88
                
                let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
                lbl.text = "0"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.numberOfLines = 1
                lbl.textColor = .black
                lbl.textAlignment = .left
                //        lbl.backgroundColor = .black
                //        lbl.alpha = 0.5
                return lbl
            }()
            view.addSubview(txt)
            // First segment tapped
        case 1:
            var txt: UILabel = {
                let h = UIScreen.main.bounds.height - 88
                
                let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
                lbl.text = "1"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.numberOfLines = 1
                lbl.textColor = .black
                lbl.textAlignment = .left
                //        lbl.backgroundColor = .black
                //        lbl.alpha = 0.5
                return lbl
            }()
            view.addSubview(txt)
            // Second segment tapped
        case 2:
            var txt: UILabel = {
                let h = UIScreen.main.bounds.height - 88

                let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
                lbl.text = "3"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.numberOfLines = 1
                lbl.textColor = .black
                lbl.textAlignment = .left
        //        lbl.backgroundColor = .black
        //        lbl.alpha = 0.5
                return lbl
            }()
            view.addSubview(txt)
        case 3:
            var txt: UILabel = {
                let h = UIScreen.main.bounds.height - 88

                let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
                lbl.text = "3"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.numberOfLines = 1
                lbl.textColor = .black
                lbl.textAlignment = .left
                
                return lbl
            }()
            view.addSubview(txt)
        case 4:
            var txt: UILabel = {
                let h = UIScreen.main.bounds.height - 88

                let lbl = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2 + 10, y: h/3, width: (UIScreen.main.bounds.width - 60)/2, height: h/18))
                lbl.text = "4"
                lbl.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
                lbl.numberOfLines = 1
                lbl.textColor = .black
                lbl.textAlignment = .left
        
                return lbl
            }()
            view.addSubview(txt)
        default:
            break
        }
    }
}

extension UISegmentedControl {
    func makeMultiline(withFontName fontName: String, fontSize: CGFloat, textColor: UIColor){
        for index in 0...self.numberOfSegments - 1 {
            
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width/CGFloat(self.numberOfSegments), height: self.frame.height))
            label.font = UIFont(name: fontName, size: fontSize)
            label.textColor = textColor
            label.text = self.titleForSegment(at: index)
            label.numberOfLines = 3
            label.textAlignment = .center
            label.adjustsFontSizeToFitWidth = true
            
            self.setTitle("", forSegmentAt: index)
            self.subviews[index].addSubview(label)
        }
    }
}


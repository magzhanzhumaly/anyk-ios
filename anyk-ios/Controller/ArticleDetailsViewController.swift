//
//  ArticleDetailsViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 03.11.2022.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    
    var article = ArticleModel(id: 0, articleType: "", tags: [""], title: "", imageName: "", author: "", authorPhotoName: "", text: ["":""], day: 0, month: 0, year: 0)
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 88))
        return scrollView
    }()
    
    private var bodyText = NSMutableAttributedString()
    
    private let titleImage = UIImageView()
    
    private let titleText = UILabel()
    
    private let shareButton = UIButton()
    
    private let authorNameText = UILabel()
    
    private let authorPhoto = UIImageView()
    
    private let dateText = UILabel()
    
    private let bodyLabel = UILabel()
    
    private let tags = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.endEditing(true)

        
        view.addSubview(scrollView)
        print(article)
        
        //        scrollView.addSubview(titleImage)
        scrollView.addSubview(titleText)
        scrollView.addSubview(shareButton)
        scrollView.addSubview(authorNameText)
        scrollView.addSubview(authorPhoto)
        scrollView.addSubview(dateText)
        scrollView.addSubview(bodyLabel)
        scrollView.addSubview(tags)
    }
    
    override func viewDidLayoutSubviews() {// 26
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        scrollView.backgroundColor = UIColor(named: "BackgroundColor")
        
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height*2)
        
        titleImage.image = UIImage(named: article.imageName)
        titleImage.contentMode = .scaleToFill
        titleImage.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 120)
        
        titleText.text = article.title
        titleText.font = .systemFont(ofSize: 20, weight: .medium)
        
        var myHeight = 0.0
        if titleText.text!.count > 50 {
            myHeight = CGFloat(titleText.intrinsicContentSize.height * (CGFloat(titleText.text!.count) / 26) + 1)
        } else if titleText.text!.count < 34 {
            myHeight = CGFloat(titleText.intrinsicContentSize.height)
        }
        else {
            myHeight = CGFloat((titleText.intrinsicContentSize.height) * 2)
        }
        
        titleText.frame = CGRect(x: 10, y: 20, width: CGFloat(scrollView.frame.width - 20), height: myHeight)
        titleText.numberOfLines = 0
        
        authorPhoto.image = UIImage(named: article.authorPhotoName)
        authorPhoto.contentMode = .scaleAspectFill
        authorPhoto.frame = CGRect(x: 10, y: titleText.frame.maxY + 20, width: 50, height: 50)
        authorPhoto.layer.cornerRadius = authorPhoto.frame.height / 2
        authorPhoto.clipsToBounds = true
        
        
        authorNameText.text = article.author
        authorNameText.font = .systemFont(ofSize: 12)
        authorNameText.frame = CGRect(x: Int(authorPhoto.frame.maxX) + 10, y: Int(authorPhoto.frame.origin.y), width: Int(authorNameText.intrinsicContentSize.width + 50) + 10, height: Int(authorPhoto.frame.height) / 2)
        
        
        shareButton.frame = CGRect(x: Int(view.frame.width) - 10 - 50, y: Int(authorPhoto.frame.origin.y), width: 50, height: 50)
        shareButton.setImage(UIImage(systemName: "arrowshape.turn.up.right.fill"), for: .normal)
        shareButton.addTarget(self, action: #selector(self.shareTextButton), for: .touchUpInside)
        
        var dateString = "\(article.day) "
        
        if article.month == 1 {
            dateString.append("января")
        } else if article.month == 2 {
            dateString.append("февраля")
        } else if article.month == 3 {
            dateString.append("марта")
        } else if article.month == 4 {
            dateString.append("апреля")
        } else if article.month == 5 {
            dateString.append("мая")
        } else if article.month == 6 {
            dateString.append("июня")
        } else if article.month == 7 {
            dateString.append("июля")
        } else if article.month == 8 {
            dateString.append("августа")
        } else if article.month == 9 {
            dateString.append("сентября")
        } else if article.month == 10 {
            dateString.append("октября")
        } else if article.month == 11 {
            dateString.append("ноября")
        } else if article.month == 12 {
            dateString.append("декабря")
        }
        
        dateString.append(" \(article.year)")
        
        dateText.text = dateString
        dateText.font = .systemFont(ofSize: 12)
        dateText.frame = CGRect(x: Int(authorNameText.frame.origin.x), y: Int(authorNameText.frame.maxY), width: Int(dateText.intrinsicContentSize.width) + 10, height: Int(authorPhoto.frame.height) / 2)
        
        
        
        for dict in article.text {
            
            var textToAppend = ""
            
            var attrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)]
            
            if dict.value == "bold" {
                attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]
            } else if dict.value == "italic" {
                attrs = [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 16)]
            }
            
            let normalString = NSMutableAttributedString(string: dict.key, attributes: attrs)
            bodyText.append(normalString)
            
            bodyText.append(NSMutableAttributedString(string: "\n\n"))
            
        }
        
        bodyLabel.numberOfLines = 0
        bodyLabel.attributedText = bodyText
        // [47, 37]
        bodyLabel.frame = CGRect(x: 10, y: authorPhoto.frame.maxY + 20, width: scrollView.frame.width - 20, height: 10000)
        bodyLabel.sizeToFit()
        
        authorNameText.font = .systemFont(ofSize: 16)
        
        scrollView.contentSize = CGSize(width: view.frame.width,
                                        height: CGFloat(( bodyLabel.text?.count ?? 0 ) / 22) * authorNameText.intrinsicContentSize.height)
        
        //        scrollView.contentSize = CGSize(width: view.frame.width, height: authorNameText.intrinsicContentSize.height)
        
        print("authorNameText.intrinsicContentSize.height \(authorNameText.intrinsicContentSize.height)")
        //        bodyLabel.verticalAL
    }
    
    @IBAction func shareTextButton(_ sender: UIButton) {
        
        // text to share
        
        var typeString = ""
        
        if article.articleType == Types.novosti.rawValue {
            typeString = "NEWS"
        } else if article.articleType == Types.poleznyeStatii.rawValue  {
            typeString = "ARTICLE"
        } else if article.articleType == Types.istoriaKlienta.rawValue {
            typeString = "CLIENT_STORY"
        } else if article.articleType == Types.ipoteka.rawValue {
            typeString = "IPOTEKA"
        }
        
        let text = "https://anyk.kz/ru/posts/\(typeString)/\(article.id)"
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
//        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook, UIActivity.ActivityType.addToReadingList, UIActivity.ActivityType.mail, UIActivity.ActivityType.markupAsPDF, UIActivity.ActivityType.sharePlay ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
}

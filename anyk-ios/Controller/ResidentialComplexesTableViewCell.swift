//
//  ResidentialComplexesTableViewCell.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 05.11.2022.
//

import UIKit

class ResidentialComplexesTableViewCell: UITableViewCell {
    
    static let identifier = "ResidentialComplexesTableViewCell"
    
    private var residentialComplexModel = ResidentialComplexModel(id: 0, name: "", city: "", address: "", dict: [0:0], company: "", is72025: false)
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleText = UILabel()
    
    private let secondText = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(titleText)
        contentView.addSubview(secondText)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(residentialComplexModel: ResidentialComplexModel) {
        self.residentialComplexModel = residentialComplexModel
    }

    override func prepareForReuse() {  // important
        super.prepareForReuse()
        residentialComplexModel = ResidentialComplexModel(id: 0, name: "", city: "", address: "", dict: [0:0], company: "", is72025: false)
        //ArticleModel(id: 0, articleType: "", tags: [""], title: "", imageName: "", author: "", authorPhotoName: "", text: ["":""], day: 0, month: 0, year: 0)
    }
    
    override func layoutSubviews() {  // this method is called when the view is gonna ask how are you gonna layout all the subviews
        super.layoutSubviews()
        
        myImageView.frame = CGRect(x: 0,
                                   y: 2,
                                   width: contentView.frame.width*0.4,
                                   height: contentView.frame.height - 4)
        
        titleText.frame = CGRect(x: myImageView.frame.width + 10,
                                 y: 5,
                                 width: contentView.frame.width - myImageView.frame.width - 10,
                                 height: contentView.frame.height*0.75 - 5)
        
        secondText.frame = CGRect(x: myImageView.frame.width + 10,
                                  y: titleText.frame.maxY,
                                  width: contentView.frame.width - myImageView.frame.width,
                                  height: contentView.frame.height*0.25 - 5)
            
        myImageView.image = UIImage(named: residentialComplexModel.name)
        myImageView.contentMode = .scaleAspectFill
        titleText.text = residentialComplexModel.name
        titleText.numberOfLines = 0
        titleText.font = .systemFont(ofSize: 14)
        secondText.text = "\(residentialComplexModel.address) • \(residentialComplexModel.company)"
        secondText.font = .systemFont(ofSize: 12)

        secondText.numberOfLines = 0
    }
}


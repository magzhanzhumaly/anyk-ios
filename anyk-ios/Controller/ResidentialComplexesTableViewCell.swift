//
//  ResidentialComplexesTableViewCell.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 05.11.2022.
//

import UIKit

protocol ResidentialComplexesTableViewCellDelegate: AnyObject {
    func didTapButton(par1: Int, par2: Int)
}

class ResidentialComplexesTableViewCell: UITableViewCell {
    
    weak var delegate: ResidentialComplexesTableViewCellDelegate?

    static let identifier = "ResidentialComplexesTableViewCell"
    
    private var residentialComplexModel = ResidentialComplexModel(id: 0, name: "", city: "", address: "", dict: [0:0], company: "", is72025: false)
    
    private let photo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat1")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel = UILabel()
    private let addressLabel = UILabel()
    
    private let upperOption = UIButton()
    private let middleOption = UIButton()
    private let lowerOption = UIButton()

    private let companyLabel = UILabel()

    var upperOptionArr = [1, 2]
    var middleOptionArr = [1, 2]
    var lowerOptionArr = [1, 2]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(photo)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(addressLabel)
        
        contentView.addSubview(upperOption)
        contentView.addSubview(middleOption)
        contentView.addSubview(lowerOption)
        
        contentView.addSubview(companyLabel)
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
        
        photo.image = UIImage(named: residentialComplexModel.name)
        photo.contentMode = .scaleAspectFill
        
        photo.frame = CGRect(x: 0,
                             y: 0,
                             width: contentView.frame.width,
                             height: 200)
        
        
        nameLabel.text = residentialComplexModel.name
        nameLabel.numberOfLines = 0
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.textColor = .darkGray
        
        nameLabel.frame = CGRect(x: 10,
                                 y: photo.frame.maxY + 10,
                                 width: contentView.frame.width - 20,
                                 height: 50)
        
        
        addressLabel.text = residentialComplexModel.address
        addressLabel.font = .systemFont(ofSize: 12)
        addressLabel.numberOfLines = 0
        addressLabel.textColor = .gray

        addressLabel.frame = CGRect(x: 10,
                                    y: nameLabel.frame.maxY,
                                    width: contentView.frame.width - 20,
                                    height: 50)
        
        upperOption.titleLabel?.numberOfLines = 0
        upperOption.contentHorizontalAlignment = .left
//        upperOption.titleLabel?.textAlignment = .center
        upperOption.titleLabel?.font = .systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        
        middleOption.titleLabel?.numberOfLines = 0
        middleOption.contentHorizontalAlignment = .left
        middleOption.titleLabel?.font = .systemFont(ofSize: 13, weight: UIFont.Weight.medium)

        lowerOption.titleLabel?.numberOfLines = 0
        lowerOption.contentHorizontalAlignment = .left
        lowerOption.titleLabel?.font = .systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        
        var firstOption = 0
        var secondOption = 0
        var thirdOption = 0
        
        var arr = Array(residentialComplexModel.dict.keys)
        
        arr.sort()
        
        print("arr = \(arr)")
        if arr.count == 1 {
            for i in residentialComplexModel.dict {
                if i.key == arr[0] {
                    secondOption = i.key
                    break
                }
            }
            
            upperOption.isHidden = true
            middleOption.isHidden = false
            lowerOption.isHidden = true

            middleOption.setTitle("  \(secondOption)-комнатная квартира: \(residentialComplexModel.dict[secondOption] ?? 0) ₸", for: .normal)
            
            upperOptionArr[0] = secondOption
            upperOptionArr[1] = residentialComplexModel.dict[secondOption] ?? 0

        } else if arr.count == 2 {
            for i in residentialComplexModel.dict {
                if i.key == arr[0] {
                    firstOption = i.key
                    break
                }
            }
            for i in residentialComplexModel.dict {
                if i.key == arr[1] {
                    secondOption = i.key
                    break
                }
            }
            
            upperOption.isHidden = false
            middleOption.isHidden = false
            lowerOption.isHidden = true

            upperOption.setTitle("  \(firstOption)-комнатная квартира: \(residentialComplexModel.dict[firstOption] ?? 0) ₸", for: .normal)
            upperOptionArr[0] = firstOption
            upperOptionArr[1] = residentialComplexModel.dict[firstOption] ?? 0
            
            middleOption.setTitle("  \(secondOption)-комнатная квартира: \(residentialComplexModel.dict[secondOption] ?? 0) ₸", for: .normal)
            middleOptionArr[0] = secondOption
            middleOptionArr[1] = residentialComplexModel.dict[secondOption] ?? 0


        } else if arr.count == 3 {
            for i in residentialComplexModel.dict {
                if i.key == arr[0] {
                    firstOption = i.key
                    break
                }
            }
            
            for i in residentialComplexModel.dict {
                if i.key == arr[1] {
                    secondOption = i.key
                    break
                }
            }

            for i in residentialComplexModel.dict {
                if i.key == arr[2] {
                    thirdOption = i.key
                    break
                }
            }
            
            upperOption.isHidden = false
            middleOption.isHidden = false
            lowerOption.isHidden = false

            upperOption.setTitle("  \(firstOption)-комнатная квартира: \(residentialComplexModel.dict[firstOption] ?? 0) ₸", for: .normal)
            upperOptionArr[0] = firstOption
            upperOptionArr[1] = residentialComplexModel.dict[firstOption] ?? 0

            middleOption.setTitle("  \(secondOption)-комнатная квартира: \(residentialComplexModel.dict[secondOption] ?? 0) ₸", for: .normal)
            middleOptionArr[0] = secondOption
            middleOptionArr[1] = residentialComplexModel.dict[secondOption] ?? 0

            lowerOption.setTitle("  \(thirdOption)-комнатная квартира: \(residentialComplexModel.dict[thirdOption] ?? 0) ₸", for: .normal)
            lowerOptionArr[0] = thirdOption
            lowerOptionArr[1] = residentialComplexModel.dict[thirdOption] ?? 0

        }


//        upperOption.setTitle("1-комнатная квартира: \(residentialComplexModel.dict[1]) ₸", for: .normal)
        upperOption.setTitleColor(.label, for: .normal)
        upperOption.layer.cornerRadius = 6
        upperOption.layer.borderWidth = 1
        upperOption.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)

        middleOption.setTitleColor(.label, for: .normal)
        middleOption.layer.cornerRadius = 6
        middleOption.layer.borderWidth = 1
        middleOption.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)

        lowerOption.setTitleColor(.label, for: .normal)
        lowerOption.layer.cornerRadius = 6
        lowerOption.layer.borderWidth = 1
        lowerOption.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.1)


        upperOption.frame = CGRect(x: 10,
                                   y: Int(addressLabel.frame.maxY) + 10,
                                   width: Int(contentView.frame.width) - 20,
                                   height: 30)
        
        middleOption.frame = CGRect(x: 10,
                                   y: Int(upperOption.frame.maxY) + 5,
                                   width: Int(contentView.frame.width) - 20,
                                   height: 30)

        lowerOption.frame = CGRect(x: 10,
                                   y: Int(middleOption.frame.maxY) + 5,
                                   width: Int(contentView.frame.width) - 20,
                                   height: 30)

        companyLabel.text = residentialComplexModel.company
        companyLabel.font = .systemFont(ofSize: 12)
        companyLabel.textColor = .gray

        companyLabel.frame = CGRect(x: 10,
                                    y: lowerOption.frame.maxY + 10,
                                    width: contentView.frame.width - 20,
                                    height: 20)

        upperOption.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        middleOption.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        lowerOption.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton(sender: UIButton!) {
        
        
        print("didtapbutton \(sender)")
        if sender == upperOption {
            delegate?.didTapButton(par1: upperOptionArr[0], par2: upperOptionArr[1])
        } else if sender == middleOption {
            delegate?.didTapButton(par1: middleOptionArr[0], par2: middleOptionArr[1])
        } else if sender == lowerOption {
            delegate?.didTapButton(par1: lowerOptionArr[0], par2: lowerOptionArr[1])
        }
    
    }
}


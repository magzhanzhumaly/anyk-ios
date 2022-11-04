//
//  DepositScheduleTableViewCell.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 30.10.2022.
//

import UIKit

class DepositScheduleTableViewCell: UITableViewCell {

    static let identifier = "DepositScheduleTableViewCell"

    private var par1 = ""
    private var par2 = 0
    private var par3 = 0
    private var par4 = 0
    private var par5 = 0
    private var par6 = 0
    private var par7 = 0.0


    private var totalPar2 = 0
    private var totalPar5 = 0
    private var totalPar6 = 0
    private var totalPar7 = 0

    private let w = UIScreen.main.bounds.width - 20

    private let par1text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()
    
    private let par2text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()

    
    private let par3text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()

    
    private let par4text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()

    
    private let par5text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()

    private let par6text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()

    private let par7text: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 11, weight: .light)
        
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        par1text.frame = CGRect(x: 10, y: 5, width: 0.15*w - 5, height: par1text.intrinsicContentSize.height)
        par2text.frame = CGRect(x: 10 + 0.15*w, y: 5, width: 0.15*w - 5, height: par2text.intrinsicContentSize.height)
        par3text.frame = CGRect(x: 10 + 0.3*w, y: 5, width: 0.15*w - 5, height: par3text.intrinsicContentSize.height)
        par4text.frame = CGRect(x: 10 + 0.45*w, y: 5, width: 0.15*w - 5, height: par4text.intrinsicContentSize.height)
        par5text.frame = CGRect(x: 10 + 0.6*w, y: 5, width: 0.4*w/3 - 5, height: par5text.intrinsicContentSize.height)
        par6text.frame = CGRect(x: 10 + (0.6 + 0.4/3)*w, y: 5, width: 0.4*w/3 - 5, height: par6text.intrinsicContentSize.height)
        par7text.frame = CGRect(x: 10 + (0.6 + 0.8/3)*w, y: 5, width: 0.4*w/3 - 5, height: par7text.intrinsicContentSize.height)

        contentView.addSubview(par1text)
        contentView.addSubview(par2text)
        contentView.addSubview(par3text)
        contentView.addSubview(par4text)
        contentView.addSubview(par5text)
        contentView.addSubview(par6text)
        contentView.addSubview(par7text)
    }
    
    public func configure(par1: String, par2: Int, par3: Int, par4: Int, par5: Int, par6: Int, par7: Double) {
        self.par1 = par1
        par1text.text = par1
        
        self.par2 = par2
        par2text.text = "\(par2)"

        self.par3 = par3
        par3text.text = "\(par3)"

        self.par4 = par4
        par4text.text = "\(par4)"

        self.par5 = par5
        par5text.text = "\(par5)"
        
        self.par6 = par6
        par6text.text = "\(par6)"

        self.par7 = par7
        let doubleStr = String(format: "%.2f", par7) // "3.14"
        par7text.text = doubleStr
    }
}

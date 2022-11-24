//
//  PaymentScheduleTableViewCell.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 23.10.2022.
//

import UIKit

class PaymentScheduleTableViewCell: UITableViewCell {

    static let identifier = "PaymentScheduleTableViewCell"

    private var par1 = ""
    private var par2 = 0
    private var par3 = 0
    private var par4 = 0
    private var par5 = 0

    private var totalPar2 = 0
    private var totalPar3 = 0
    private var totalPar4 = 0
    private var totalPar5 = 0

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
        
        par1text.frame = CGRect(x: 10, y: 5, width: w/5, height: par1text.intrinsicContentSize.height)
        par2text.frame = CGRect(x: 10 + w/5, y: 5, width: w/5, height: par2text.intrinsicContentSize.height)
        par3text.frame = CGRect(x: 10 + 2*w/5, y: 5, width: w/5, height: par3text.intrinsicContentSize.height)
        par4text.frame = CGRect(x: 10 + 3*w/5, y: 5, width: w/5, height: par4text.intrinsicContentSize.height)
        par5text.frame = CGRect(x: 10 + 4*w/5, y: 5, width: w/5, height: par5text.intrinsicContentSize.height)
        
        contentView.addSubview(par1text)
        contentView.addSubview(par2text)
        contentView.addSubview(par3text)
        contentView.addSubview(par4text)
        contentView.addSubview(par5text)

//        contentView.backgroundColor = .red
    }
    
    public func configure(par1: String, par2: Int, par3: Int, par4: Int, par5: Int) {
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
    }
}

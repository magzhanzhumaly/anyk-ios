//
//  Calculations3ViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 06.10.2022.
//

import UIKit

class Calculations3ViewController: UIViewController {
    
    // mortgage details
    var id = -1
    var name = ""
    var AEIR = 0.0 // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    var firstStageRate = 0.0
    var ageOfBorrower = [""]
    var initialFeePercentageString = ""
    var initialFeeLowerBound = 0
    var initialFeeUpperBound = 0

    var maxCredit = 0
    var continuousWorkExperience = ""
    var minTerm = 0
    var maxTerm = 0
    var feePercent = 0.0
    var feeInitial = 0.0
    var properties = [""]
    var whereToApply = [""]
    var details = [""]
    var detailsColors = [""]
    var detailsFull = ""
    var imageName = ""
    
    
    // input details
    var txtField1 = ""
    var txtField2 = ""
    var txtField3 = ""
    var chosenSegment = 0
    var txtField1_1 = ""
    var txtField1_2 = ""
    var txtField1_3 = ""
    
    var txtField2_1 = ""
    var txtField2_2 = ""
    var txtField2_3 = ""
    
    
    // local vars
    private let w = UIScreen.main.bounds.width - 20
    private let h = UIScreen.main.bounds.height - 88
    
    private var lowestY: CGFloat = 0
    private var tempHeight: CGFloat = 0
    
    private var multiplier = 1.0
    
    var X = 0.0
    var S = 0.0
    var initialS = 0
    var p = 0.0
    var m = 0
    
    var totalPayout = 0.0
    var totalOverpayment = 0.0
    var type = 0
    
    var amortization = 0.0 // ПОГАШЕНИЕ_ДОЛГА
    var percentagePart = 0.0// ПРОЦЕНТНАЯ_ЧАСТЬ
    var percentagePartTotal = 0.0
    var paymentForMonth = 0.0 // ПЛАТЕЖ_ЗА_МЕСЯЦ
    var credit = 0.0
    
    let date = Date()
    let calendar = Calendar.current
    var month = 0
    var year = 0
    
    // outlets
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    private var toggleButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("График платежа ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        //        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left
        btn .addTarget(self, action: #selector(toggleButtonAction), for: .touchUpInside)
        
        return btn
    }()
    
    private var txt1val = UILabel()
    private var txt2val = UILabel()
    private var txt3val = UILabel()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()
    
    private var graphicToggler = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "calculations3"
        view.backgroundColor = UIColor(named: "BackgroundColor")

        tableView.dataSource = self
        tableView.delegate = self
        
        
        month = calendar.component(.month, from: date)
        month += 1
        year = calendar.component(.year, from: date)
        
        if month > 12 {
            month = 1
            year += 1
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 3500)
        
        tempHeight = h / 36
        
        lowestY += 10
        
        let titleText: UILabel = {
            let label = UILabel()
            label.text = name
            label.font = .systemFont(ofSize: 18, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        titleText.frame = CGRect(x: 10,
                                   y: lowestY,
                                   width: titleText.intrinsicContentSize.width < w ? titleText.intrinsicContentSize.width + 10.0 : w,
                                   height: tempHeight)
        
        scrollView.addSubview(titleText)

        lowestY += 20 + tempHeight


        let argument1: UILabel = {
            let label = UILabel()
            label.text = "Стоимость жилья: \(txtField1)"
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        argument1.frame = CGRect(x: 10,
                                   y: lowestY,
                                   width: w,
                                   height: tempHeight)
        
        scrollView.addSubview(argument1)

        lowestY += tempHeight

        let argument2: UILabel = {
            let label = UILabel()
            label.text = "Первоначальный взнос: \(txtField2)"
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        argument2.frame = CGRect(x: 10,
                                   y: lowestY,
                                   width: w,
                                   height: tempHeight)
        
        scrollView.addSubview(argument2)

        lowestY += tempHeight

        let argument3: UILabel = {
            let label = UILabel()
            label.text = "Срок займа: \(txtField3) лет"
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        argument3.frame = CGRect(x: 10,
                                   y: lowestY,
                                   width: w,
                                   height: tempHeight)
        
        scrollView.addSubview(argument3)

        lowestY += tempHeight + 20

        
        tempHeight = h / 18

        
        
        lowestY += tempHeight + 10
        
        var firstDetail: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 12, weight: .light)
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            label.textAlignment = .center
            
            return label
        }()
        
        let tempDetailString = detailsFull.components(separatedBy: "\n")
        firstDetail.text = tempDetailString[0]
        
        firstDetail.layer.cornerRadius = 5
        firstDetail.layer.borderWidth = 1
        firstDetail.layer.borderColor = UIColor(named: "AccentColor")?.cgColor
        
        tempHeight = CGFloat(firstDetail.intrinsicContentSize.height + 10)
        
        firstDetail.frame = CGRect(x: 10,
                                   y: lowestY,
                                   width: firstDetail.intrinsicContentSize.width < w ? firstDetail.intrinsicContentSize.width + 10.0 : w,
                                   height: tempHeight)
        
        scrollView.addSubview(firstDetail)
        
        lowestY += 20 + tempHeight
        
        
        
        let txt1 = UILabel()
        txt1.font = .systemFont(ofSize: 14, weight: .light)
        txt1.text = "Первоначальный взнос"
        tempHeight = txt1.intrinsicContentSize.height
        txt1.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        txt1.alpha = 0.7
        
        scrollView.addSubview(txt1)
        
        lowestY += tempHeight + 10
        
        txt1val.text = "\(4056) ₸"
        txt1val.font = .systemFont(ofSize: 16, weight: .medium)
        tempHeight = txt1val.intrinsicContentSize.height
        txt1val.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(txt1val)
        
        lowestY += tempHeight + 10
        
        
        
        let txt2 = UILabel()
        txt2.font = .systemFont(ofSize: 14, weight: .light)
        txt2.text = "Общая сумма выплат"
        tempHeight = txt2.intrinsicContentSize.height
        txt2.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        txt2.alpha = 0.7
        
        scrollView.addSubview(txt2)
        
        lowestY += tempHeight + 10
        
        txt2val.text = "\(226917) ₸"
        txt2val.font = .systemFont(ofSize: 16, weight: .medium)
        tempHeight = txt2val.intrinsicContentSize.height
        txt2val.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(txt2val)
        
        lowestY += tempHeight + 10
        
        
        
        let txt3 = UILabel()
        txt3.font = .systemFont(ofSize: 14, weight: .light)
        txt3.text = "Общая переплата"
        tempHeight = txt3.intrinsicContentSize.height
        txt3.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        txt3.alpha = 0.7
        
        scrollView.addSubview(txt3)
        
        lowestY += tempHeight + 10
        
        txt3val.text = "\(66917) ₸"
        txt3val.font = .systemFont(ofSize: 16, weight: .medium)
        tempHeight = txt3val.intrinsicContentSize.height
        txt3val.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(txt3val)
        
        lowestY += tempHeight + 20
        
        
        calculateDifferentiated()
        
        toggleButton.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        scrollView.addSubview(toggleButton)
        lowestY += tempHeight + 10
        
        
        tempHeight = 4000
        tableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(tableView)
        
        tableView.isHidden = true
        
        let tableViewHeight = CGFloat(130 + 40*m)
        tableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: lowestY + tableViewHeight)
        
    }
    
    
    func calculateDifferentiated() {
        //        Х — это ежемесячный взнос по ипотеке, который мы пытаемся рассчитать.
        //        S — это общая сумма кредита.
        //        P обозначает месячную ставку по кредиту (это годовая процентная ставка, разделенная на 12).
        //        M — это срок кредитования в месяцах.
        
        S = (Double(txtField1) ?? 0) - (Double(txtField2) ?? 0)
        initialS = Int(S)
        p = AEIR/1200
        m = 12 * (Int(txtField3) ?? 0)
        
        credit = S / Double(m)
        
        percentagePart = S * p
        //        percentagePartTotal += percentagePart
        X = credit + percentagePart
        txt1val.text = "\(Int(X))"
        
        totalPayout = X * Double(m)
        txt2val.text = "\(Int(totalPayout))"
        
        totalOverpayment = totalPayout - S
        txt3val.text = "\(Int(totalOverpayment))"
        S -= credit
    }
    
    func calculateAnnuity() {
        //        Х — это ежемесячный взнос по ипотеке, который мы пытаемся рассчитать.
        //        S — это общая сумма кредита.
        //        P обозначает месячную ставку по кредиту (это годовая процентная ставка, разделенная на 12).
        //        M — это срок кредитования в месяцах.
        
        S = (Double(txtField1) ?? 0) - (Double(txtField2) ?? 0)
        initialS = Int(S)
        p = AEIR/1200
        m = 12 * (Int(txtField3) ?? 0)
        
        var totalRate = Double(pow(Double(1+p), Double(m))) //Int(pow(Double(a),Double(b)))
        
        X = S * p * totalRate / (totalRate - 1)
        
        txt1val.text = "\(Int(X))"
        
        totalPayout = X * Double(m)
        txt2val.text = "\(Int(totalPayout))"
        
        totalOverpayment = X * Double(m) - S
        
        txt3val.text = "\(Int(totalOverpayment))"
        
        percentagePart = S * p
        credit = X - percentagePart
        
        print("percentagePart = \(percentagePart), credit = \(credit)")
        S -= Double(credit)
    }
    
    
    @objc func toggleButtonAction(sender: UIButton!) {
        
        if !tableView.isHidden {
            toggleButton.setTitle("График платежа ▼", for: .normal)
            tableView.isHidden = true
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
        } else {
            toggleButton.setTitle("График платежа ▲", for: .normal)
            
            tableView.isHidden = false
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 3500)
        }
    }
    
}



extension Calculations3ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentScheduleTableViewCell.identifier, for: indexPath) as? PaymentScheduleTableViewCell else {
            return UITableViewCell()
        }
        
        if type == 0 {  // differentiated
            cell.configure(par1: "\(month)/\(year)", par2: Int(X), par3: Int(percentagePart), par4: Int(credit), par5: Int(S))
            percentagePartTotal += percentagePart
            
            percentagePart = S * p
            X = credit + percentagePart
            
            S -= credit
            
        }
        if type == 1 { // annuity
            
            cell.configure(par1: "\(month)/\(year)", par2: Int(X), par3: Int(percentagePart), par4: Int(credit), par5: Int(S))
            
            
            percentagePart = S * p
            credit = X - percentagePart
            
            S -= Double(credit)
            
            //            paymentForMonth = amortization + percentagePart
            //            cell.configure(par1: "\(month)/\(year)", par2: Int(X), par3: Int(X/2), par4: Int(X/2+20), par5: Int(S) - Int(X))
        }
        
        month += 1
        if month > 12 {
            month = 1
            year += 1
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let par1text = UILabel()
        par1text.font = .systemFont(ofSize: 11, weight: .light)
        par1text.text = "Итого"
        par1text.numberOfLines = 3
        par1text.textColor = .gray
        par1text.frame = CGRect(x: 10, y: 5, width: w/5 - 5, height: par1text.intrinsicContentSize.height*3)
        
        let par2text = UILabel()
        par2text.font = .systemFont(ofSize: 11, weight: .light)
        if type == 1 {
            par2text.text = "\(Int(totalPayout))"
        } else {
            par2text.text = "\(Int(Double(initialS) + percentagePartTotal))"
        }
        par2text.numberOfLines = 3
        par2text.textColor = .gray
        par2text.frame = CGRect(x: 10 + w/5, y: 5, width: w/5 - 5, height: par2text.intrinsicContentSize.height*3)
        
        let par3text = UILabel()
        par3text.font = .systemFont(ofSize: 11, weight: .light)
        if type == 1 {
            par3text.text = "\(Int(totalOverpayment))"
        } else {
            par3text.text = "\(Int(percentagePartTotal))"
        }
        par3text.numberOfLines = 3
        par3text.textColor = .gray
        par3text.frame = CGRect(x: 10 + 2*w/5, y: 5, width: w/5 - 5, height: par3text.intrinsicContentSize.height*3)
        
        let par4text = UILabel()
        par4text.font = .systemFont(ofSize: 11, weight: .light)
        if type == 1 {
            par4text.text = "\(initialS)"
        } else {
            par4text.text = "\(initialS)"
        }
        par4text.numberOfLines = 3
        par4text.textColor = .gray
        par4text.frame = CGRect(x: 10 + 3*w/5, y: 5, width: w/5 - 5, height: par4text.intrinsicContentSize.height*3)
        
        let par5text = UILabel()
        par5text.font = .systemFont(ofSize: 11, weight: .light)
        par5text.text = "0"
        par5text.numberOfLines = 3
        par5text.textColor = .gray
        par5text.frame = CGRect(x: 10 + 4*w/5, y: 5, width: w/5 - 5, height: par5text.intrinsicContentSize.height*3)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        
        view.addSubview(par1text)
        view.addSubview(par2text)
        view.addSubview(par3text)
        view.addSubview(par4text)
        view.addSubview(par5text)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let par1text = UILabel()
        par1text.font = .systemFont(ofSize: 11, weight: .light)
        par1text.text = "Период мм/гггг"
        par1text.numberOfLines = 3
        par1text.frame = CGRect(x: 10, y: 5, width: w/5 - 5, height: par1text.intrinsicContentSize.height*3)
        
        let par2text = UILabel()
        par2text.font = .systemFont(ofSize: 11, weight: .light)
        par2text.text = "Общ. сумма выплаты, ₸"
        par2text.numberOfLines = 3
        par2text.frame = CGRect(x: 10 + w/5, y: 5, width: w/5 - 5, height: par2text.intrinsicContentSize.height*3)
        
        let par3text = UILabel()
        par3text.font = .systemFont(ofSize: 11, weight: .light)
        par3text.text = "Проценты, ₸"
        par3text.numberOfLines = 3
        par3text.frame = CGRect(x: 10 + 2*w/5, y: 5, width: w/5 - 5, height: par3text.intrinsicContentSize.height*3)
        
        let par4text = UILabel()
        par4text.font = .systemFont(ofSize: 11, weight: .light)
        par4text.text = "Кредит, ₸"
        par4text.numberOfLines = 3
        par4text.frame = CGRect(x: 10 + 3*w/5, y: 5, width: w/5 - 5, height: par4text.intrinsicContentSize.height*3)
        
        let par5text = UILabel()
        par5text.font = .systemFont(ofSize: 11, weight: .light)
        par5text.text = "Осталось выплатить, ₸"
        par5text.numberOfLines = 3
        par5text.frame = CGRect(x: 10 + 4*w/5, y: 5, width: w/5 - 5, height: par5text.intrinsicContentSize.height*3)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
        
        if type == 0 {
            txt2val.text = "\(Int(Double(initialS) + percentagePartTotal))"
            
            txt3val.text = "\(Int(percentagePartTotal))"
        }
        
        view.addSubview(par1text)
        view.addSubview(par2text)
        view.addSubview(par3text)
        view.addSubview(par4text)
        view.addSubview(par5text)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m
    }
}






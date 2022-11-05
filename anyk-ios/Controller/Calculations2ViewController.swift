//
//  Calculations2ViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 06.10.2022.
//

import UIKit

class Calculations2ViewController: UIViewController {
    
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
    
    
    // local vars
    private let w = UIScreen.main.bounds.width - 20
    private let h = UIScreen.main.bounds.height - 88
    
    private var lowestY: CGFloat = 0
    private var tempHeight: CGFloat = 1565
    
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
    
    var pageTotalHeight = 0.0
    
    let tableViewHeight = CGFloat(130 + 40*12*3)
    
    var paymentStage2TableViewHeight = 0.0
    
    // outlets
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    
    var yDepositScheduleToggleButton1 = 0.0
    private var depositScheduleToggleButton: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("График депозита ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        //        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left
        
        return btn
    }()
    
    var yPaymentScheduleToggleButton1 = 0.0
    private var paymentScheduleToggleButton1: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("График платежа ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        
        btn.contentHorizontalAlignment = .left
        
        return btn
    }()
    
    var yPaymentScheduleToggleButton2 = 0.0
    private var paymentScheduleToggleButton2: UIButton = {
        let btn = UIButton()
        
        btn.setTitle("График платежа ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        //        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left
        
        return btn
    }()
    
    
    
    let label4: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()
    
    let label1_1: UILabel = {
        let label = UILabel()
        label.text = "Этап 2 \"Жилищный заем\""
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()

    let label1_2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()
    
    let label1_3: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        //
        //            • по ставке вознаграждения 5% годовых
        //
        //            • Вы вносите на депозит \((Int(txtField2)!) / (Int(txtField1)!))% от стоимости жилья \(txtField2)\n • Первые 3 года Вы ежемесячно платите \(Int(X)) тенге\n\nНа этом этапе Вы оплачиваете долг по промежуточному займу \(name) с процентной ставкой \(AEIR) на всю стоимость жилья (100%) \(txtField1)"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()

    let label1_5: UILabel = {
        let label = UILabel()
        label.text = "Приобретение жилья"
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()

    let label1_6: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.layer.masksToBounds = true
        
        return label
    }()

    
    
    
    
    
    
    
    
    
    
    private var txt1val = UILabel()
    private var txt2val = UILabel()
    private var txt3val = UILabel()
    
        
    var yDefaultDepositStage1TableView = 0.0

    private let depositStageTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(DepositScheduleTableViewCell.self, forCellReuseIdentifier: DepositScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()
    
    
    
    var yDefaultPaymentStage1TableView = 0.0
    var yTempPaymentStage1TableView = 0.0
    var yNo1PaymentStage1TableView = 0.0

    private let paymentStage1TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()

    
    
    var yDefaultPaymentStage2TableView = 0.0
    var yTempPaymentStage2TableView = 0.0
    var yNo1PaymentStage2TableView = 0.0
    var yNo2PaymentStage2TableView = 0.0
    var yNo1And2PaymentStage2TableView = 0.0

    private let paymentStage2TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()
    
    var scrollViewHeight = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "calculations2"
        view.backgroundColor = UIColor(named: "BackgroundColor")

        label4.text = " конце срока 3 года от суммы 90 000 тенге:\n\n • По предварительному займу будет погашено: 0 тенге\n • По депозиту начислено 7 353 тенге, из которых:\n    • начислено процентов: 1 821 тенге\n    • государственная премия: 5 532 тенге\n\nПереплата по предварительному займу составит 7 647 тенге"
        
        label1_2.text = "Ежемесячный платеж: \(Int(X))\n\nСтавка: \(txtField3)\n\nСрок этапа: \(Int(txtField3)!-3) года\n\nПереплата: \(Int(totalOverpayment))"
        label1_3.text = "С учетом погашенного долга, нояб. 2025 Вы переходите на Жилищный заем. Ваш займ будет: 44 348 тенге\n\n • со сроком кредитования \(Int(txtField3)!-3) лет\n • по ставке вознаграждения \(AEIR)% годовых\n\nЗа срок в \(Int(txtField3)!-3) лет:\n\n • Размер ежемесячной выплаты: 714 тенге\n • Сумма выплат по жилищному займу: 51 424 тенге\n • Переплата по жилищному займу составляет: 7 076 тенге"
        label1_6.text = "Для приобретения жилья стоимостью 100 000 тенге в итоге за весь срок 9 лет Ваши затраты составят 114 723 тенге из них:\n\n • Взнос 10% на депозит 10 000 тенге\n • Взносы по предварительному займу в течение 3 года - 53 300 тенге\n • Взносы по жилищному займу в течение 6 лет - 51 424 тенге\n • Общая переплата составит 14 723 тенге"
        
        depositScheduleToggleButton.addTarget(self, action: #selector(depositSchedule1ToggleButtonAction), for: .touchUpInside)
        depositScheduleToggleButton.setTitleColor(.label, for: .normal)
        paymentScheduleToggleButton1.addTarget(self, action: #selector(paymentSchedule1ToggleButtonAction), for: .touchUpInside)
        paymentScheduleToggleButton1.setTitleColor(.label, for: .normal)
        paymentScheduleToggleButton2.addTarget(self, action: #selector(paymentSchedule2ToggleButtonAction), for: .touchUpInside)
        paymentScheduleToggleButton2.setTitleColor(.label, for: .normal)

        calculateDifferentiated()
        
        paymentStage1TableView.dataSource = self
        paymentStage1TableView.delegate = self
        
        paymentStage2TableView.dataSource = self
        paymentStage2TableView.delegate = self

        depositStageTableView.dataSource = self
        depositStageTableView.delegate = self

        
        
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
        //        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 10000)
        
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
        
        lowestY += tempHeight
        
        
        let argument4: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        if chosenSegment == 0 {
            argument4.text = "У меня есть депозит в ЖССБ: нет"
        } else if chosenSegment == 1 {
            argument4.text = "У меня есть депозит в ЖССБ: да"
        }
        
        
        argument4.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)
        
        scrollView.addSubview(argument4)
        
        if chosenSegment == 1 {
            
            lowestY += tempHeight
            
            let argument5: UILabel = {
                let label = UILabel()
                label.text = "Дата открытия депозита: \(txtField1_1)"
                label.font = .systemFont(ofSize: 14, weight: .medium)
                label.layer.masksToBounds = true
                
                return label
            }()
            
            argument5.frame = CGRect(x: 10,
                                     y: lowestY,
                                     width: w,
                                     height: tempHeight)
            
            scrollView.addSubview(argument5)
            
            lowestY += tempHeight
            
            let argument6: UILabel = {
                let label = UILabel()
                label.text = "Вознаграждение за прошлый период: \(txtField1_2)"
                label.font = .systemFont(ofSize: 14, weight: .medium)
                label.layer.masksToBounds = true
                
                return label
            }()
            
            argument6.frame = CGRect(x: 10,
                                     y: lowestY,
                                     width: w,
                                     height: tempHeight)
            
            scrollView.addSubview(argument6)
            
            lowestY += tempHeight
            
            let argument7: UILabel = {
                let label = UILabel()
                label.text = "Вознаграждение за текущий период: \(txtField1_3)"
                label.font = .systemFont(ofSize: 14, weight: .medium)
                label.layer.masksToBounds = true
                
                return label
            }()
            
            argument7.frame = CGRect(x: 10,
                                     y: lowestY,
                                     width: w,
                                     height: tempHeight)
            
            scrollView.addSubview(argument7)
            
        }
        
        lowestY += tempHeight + 20
        
        
        
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
        
        lowestY += 10 + tempHeight
        
        
        tempHeight = h / 18
        
        
        let label1: UILabel = {
            let label = UILabel()
            label.text = "Этап 1 \"Промежуточный заем\""
            label.font = .systemFont(ofSize: 17, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label1.frame = CGRect(x: 10,
                              y: lowestY,
                              width: w,
                              height: tempHeight)
        
        scrollView.addSubview(label1)
        
        lowestY += tempHeight + 10
        
        tempHeight = h/6
        
        let label2: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Ежемесячный платеж: \(Int(X))\n\nСтавка: \(txtField3)\n\nСрок этапа: 3 года\n\nПереплата: \(Int(totalOverpayment))"
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label2.frame = CGRect(x: 10,
                              y: lowestY,
                              width: w,
                              height: tempHeight)
        
        scrollView.addSubview(label2)
        
        lowestY += tempHeight
        
        tempHeight = h/7
        
        let label3: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = " • Вы вносите на депозит \((Int(txtField2)!) / (Int(txtField1)!))% от стоимости жилья \(txtField2)\n • Первые 3 года Вы ежемесячно платите \(Int(X)) тенге\n\nНа этом этапе Вы оплачиваете долг по промежуточному займу \(name) с процентной ставкой \(AEIR) на всю стоимость жилья (100%) \(txtField1)"
            label.font = .systemFont(ofSize: 12, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label3.frame = CGRect(x: 10,
                              y: lowestY,
                              width: w,
                              height: tempHeight)
        
        scrollView.addSubview(label3)
        
        lowestY += tempHeight
        
        yDefaultDepositStage1TableView = lowestY
        
        tempHeight = 45
        depositScheduleToggleButton.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        scrollView.addSubview(depositScheduleToggleButton)
        lowestY += tempHeight
        
        depositStageTableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)
        scrollView.addSubview(depositStageTableView)
        
        depositStageTableView.isHidden = true
        
        
        
        
        tempHeight = 45
        paymentScheduleToggleButton1.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        scrollView.addSubview(paymentScheduleToggleButton1)
        lowestY += tempHeight
        
        
        
        yDefaultPaymentStage1TableView = lowestY + tableViewHeight + 20
        yNo1PaymentStage1TableView = lowestY - 20
        
        paymentStage1TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)
        
        scrollView.addSubview(paymentStage1TableView)
        
        paymentStage1TableView.isHidden = true
        
        
        tempHeight = h/4 - 10
        
                
        label4.frame = CGRect(x: 10,
                              y: lowestY,
                              width: w,
                              height: tempHeight)
        
        scrollView.addSubview(label4)
        
        lowestY += tempHeight
        
        
        
        
        //  этап 2
        
        
        
        
        tempHeight = h / 18
        
        
                
        label1_1.frame = CGRect(x: 10,
                                y: lowestY,
                                width: w,
                                height: tempHeight)
        
        scrollView.addSubview(label1_1)
        
        lowestY += tempHeight + 10
        
        tempHeight = h/6
        
        
        label1_2.frame = CGRect(x: 10,
                                y: lowestY,
                                width: w,
                                height: tempHeight)
        
        scrollView.addSubview(label1_2)
        
        lowestY += tempHeight
        
        
                
        tempHeight = h/4
        
        label1_3.frame = CGRect(x: 10,
                                y: lowestY,
                                width: w,
                                height: tempHeight)
        
        scrollView.addSubview(label1_3)
        
        lowestY += tempHeight
        
        
        tempHeight = 45
        paymentScheduleToggleButton2.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        
        scrollView.addSubview(paymentScheduleToggleButton2)
        lowestY += tempHeight
        
        
        
        m = Int(txtField3)! - 36
        paymentStage2TableViewHeight = CGFloat((125 + m - 36)*40) + 200
        
        yDefaultPaymentStage2TableView = lowestY + tableViewHeight*2 + 40
        yNo1PaymentStage2TableView = lowestY - tableViewHeight - 20
        yNo2PaymentStage2TableView = yNo1PaymentStage2TableView
        yNo1And2PaymentStage2TableView = lowestY - tableViewHeight*2 - 40
        
        paymentStage2TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: paymentStage2TableViewHeight)
        scrollView.addSubview(paymentStage2TableView)
        
        
        paymentStage2TableView.isHidden = true
        
        tempHeight = h / 18
        
        label1_5.frame = CGRect(x: 10,
                                y: lowestY,
                                width: w,
                                height: tempHeight)
        
        scrollView.addSubview(label1_5)
        
        lowestY += tempHeight + 10
        
        
        tempHeight = h/5
        
        
        label1_6.frame = CGRect(x: 10,
                                y: lowestY,
                                width: w,
                                height: tempHeight)
        
        scrollView.addSubview(label1_6)
        
        lowestY += tempHeight + 20
        
        pageTotalHeight = lowestY
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: pageTotalHeight)
        
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
    
    
    @objc func depositSchedule1ToggleButtonAction(sender: UIButton!) {
        
        if !depositStageTableView.isHidden {   // hiding
            
            depositScheduleToggleButton.setTitle("График депозита ▼", for: .normal)
            depositStageTableView.isHidden = true

            paymentScheduleToggleButton1.frame = paymentScheduleToggleButton1.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            paymentStage1TableView.frame = paymentStage1TableView.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
        
            label4.frame = label4.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            label1_1.frame = label1_1.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            label1_2.frame = label1_2.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            label1_3.frame = label1_3.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            paymentScheduleToggleButton2.frame = paymentScheduleToggleButton2.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            paymentStage2TableView.frame = paymentStage2TableView.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            label1_5.frame = label1_5.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            label1_6.frame = label1_6.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            var localPageTotalHeight = pageTotalHeight
            
            if !depositStageTableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage1TableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage2TableView.isHidden {
                localPageTotalHeight += paymentStage2TableViewHeight + 20
            }
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: localPageTotalHeight)

        } else {   // unhiding
            depositScheduleToggleButton.setTitle("График депозита ▲", for: .normal)
            
            depositStageTableView.isHidden = false
           
            paymentScheduleToggleButton1.frame = paymentScheduleToggleButton1.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            paymentStage1TableView.frame = paymentStage1TableView.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            label4.frame = label4.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            label1_1.frame = label1_1.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            label1_2.frame = label1_2.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            label1_3.frame = label1_3.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            paymentScheduleToggleButton2.frame = paymentScheduleToggleButton2.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            paymentStage2TableView.frame = paymentStage2TableView.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            label1_5.frame = label1_5.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            label1_6.frame = label1_6.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            var localPageTotalHeight = pageTotalHeight
            
            if !depositStageTableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage1TableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage2TableView.isHidden {
                localPageTotalHeight += paymentStage2TableViewHeight + 20
            }
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: localPageTotalHeight)
        }
    }
    
    
    
    @objc func paymentSchedule1ToggleButtonAction(sender: UIButton!) {
        
        if !paymentStage1TableView.isHidden {
            paymentScheduleToggleButton1.setTitle("График платежа ▼", for: .normal)
            paymentStage1TableView.isHidden = true

            paymentScheduleToggleButton1.frame = paymentScheduleToggleButton1.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            paymentStage1TableView.frame = paymentStage1TableView.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
        
            label4.frame = label4.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            label1_1.frame = label1_1.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            label1_2.frame = label1_2.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            label1_3.frame = label1_3.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))
            
            paymentScheduleToggleButton2.frame = paymentScheduleToggleButton2.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            paymentStage2TableView.frame = paymentStage2TableView.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            label1_5.frame = label1_5.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            label1_6.frame = label1_6.frame.offsetBy(dx: 0, dy: -(tableViewHeight+20))

            var localPageTotalHeight = pageTotalHeight
            
            if !depositStageTableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage1TableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage2TableView.isHidden {
                localPageTotalHeight += paymentStage2TableViewHeight + 20
            }
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: localPageTotalHeight)

        } else {
            
            paymentScheduleToggleButton1.setTitle("График платежа ▲", for: .normal)
            
            paymentStage1TableView.isHidden = false
            
//            paymentScheduleToggleButton1.frame = paymentScheduleToggleButton1.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
//            paymentStage1TableView.frame = paymentStage1TableView.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
                                
            label4.frame = label4.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            label1_1.frame = label1_1.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            label1_2.frame = label1_2.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            label1_3.frame = label1_3.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))
            
            paymentScheduleToggleButton2.frame = paymentScheduleToggleButton2.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            paymentStage2TableView.frame = paymentStage2TableView.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            label1_5.frame = label1_5.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            label1_6.frame = label1_6.frame.offsetBy(dx: 0, dy: (tableViewHeight+20))

            var localPageTotalHeight = pageTotalHeight
            
            if !depositStageTableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage1TableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage2TableView.isHidden {
                localPageTotalHeight += paymentStage2TableViewHeight + 20
            }
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: localPageTotalHeight)
        }
        
    }
    
    
    @objc func paymentSchedule2ToggleButtonAction(sender: UIButton!) {
        
        if !paymentStage2TableView.isHidden {
            paymentScheduleToggleButton2.setTitle("График платежа ▼", for: .normal)
            paymentStage2TableView.isHidden = true

            label1_5.frame = label1_5.frame.offsetBy(dx: 0, dy: -(paymentStage2TableViewHeight+20))

            label1_6.frame = label1_6.frame.offsetBy(dx: 0, dy: -(paymentStage2TableViewHeight+20))

            var localPageTotalHeight = pageTotalHeight
            
            if !depositStageTableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage1TableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage2TableView.isHidden {
                localPageTotalHeight += paymentStage2TableViewHeight + 20
            }
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: localPageTotalHeight)

        } else {
            paymentScheduleToggleButton2.setTitle("График платежа ▲", for: .normal)
            
            paymentStage2TableView.isHidden = false
            
            label1_5.frame = label1_5.frame.offsetBy(dx: 0, dy: (paymentStage2TableViewHeight+20))

            label1_6.frame = label1_6.frame.offsetBy(dx: 0, dy: (paymentStage2TableViewHeight+20))

            var localPageTotalHeight = pageTotalHeight
            
            if !depositStageTableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage1TableView.isHidden {
                localPageTotalHeight += tableViewHeight + 20
            }
            if !paymentStage2TableView.isHidden {
                localPageTotalHeight += paymentStage2TableViewHeight + 20
            }
            
            scrollView.contentSize = CGSize(width: view.frame.size.width, height: localPageTotalHeight)
        }
    }
    
    
}



extension Calculations2ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == depositStageTableView {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DepositScheduleTableViewCell.identifier, for: indexPath) as? DepositScheduleTableViewCell else {
                return UITableViewCell()
            }
            
            if type == 0 {  // differentiated
                cell.configure(par1: "\(month)/\(year)", par2: Int(X), par3: Int(percentagePart), par4: Int(credit), par5: Int(S), par6: 12, par7: 12.414123)
                percentagePartTotal += percentagePart
                
                percentagePart = S * p
                X = credit + percentagePart
                
                S -= credit
                
            }
//            if type == 1 { // annuity
//                cell.configure(par1: "\(month)/\(year)", par2: Int(X), par3: Int(percentagePart), par4: Int(credit), par5: Int(S), par6: 12, par7: 12.414123)
//
//                percentagePart = S * p
//                credit = X - percentagePart
//
//                S -= Double(credit)
//
//                //            paymentForMonth = amortization + percentagePart
//                //            cell.configure(par1: "\(month)/\(year)", par2: Int(X), par3: Int(X/2), par4: Int(X/2+20), par5: Int(S) - Int(X))
//            }
            
            month += 1
            if month > 12 {
                month = 1
                year += 1
            }
            
            return cell
            
        }
        
        if tableView == paymentStage1TableView {
            
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
        
        if tableView == paymentStage2TableView {
            
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
        return UITableViewCell()
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
        
        if tableView == paymentStage1TableView || tableView == paymentStage2TableView {
            
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
            
        } else if tableView == depositStageTableView {
           
            let par1text = UILabel()
            par1text.font = .systemFont(ofSize: 11, weight: .light)
            par1text.text = "Итого"
            par1text.numberOfLines = 3
            par1text.textColor = .gray
            par1text.frame = CGRect(x: 10, y: 5, width: 0.15*w - 5, height: par1text.intrinsicContentSize.height*3)

            let par2text = UILabel()
            par2text.font = .systemFont(ofSize: 11, weight: .light)
            par2text.text = "\(Int(totalPayout))"
            par2text.numberOfLines = 3
            par2text.textColor = .gray
            par2text.frame = CGRect(x: 10 + 0.15*w, y: 5, width: 0.15*w - 5, height: par2text.intrinsicContentSize.height*3)
            
            let par5text = UILabel()
            par5text.font = .systemFont(ofSize: 11, weight: .light)
            par5text.text = "451089"
            par5text.numberOfLines = 3
            par5text.textColor = .gray
            par5text.frame = CGRect(x: 10 + 0.6*w, y: 5, width: 0.4*w/3 - 5, height: par5text.intrinsicContentSize.height*3)
            
            let par6text = UILabel()
            par6text.font = .systemFont(ofSize: 11, weight: .light)
            par6text.text = "444480"
            par6text.numberOfLines = 3
            par6text.textColor = .gray
            par6text.frame = CGRect(x: 10 + (0.6 + 0.4/3)*w, y: 5, width: 0.4*w/3 - 5, height: par6text.intrinsicContentSize.height*3)
            
            let par7text = UILabel()
            par7text.font = .systemFont(ofSize: 11, weight: .light)
            par7text.text = "45.11"
            par7text.numberOfLines = 3
            par7text.textColor = .gray
            par7text.frame = CGRect(x: 10 + (0.6 + 0.8/3)*w, y: 5, width: 0.4*w/3 - 5, height: par7text.intrinsicContentSize.height*3)
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 60))
            
            view.addSubview(par1text)
            view.addSubview(par2text)
            view.addSubview(par5text)
            view.addSubview(par6text)
            view.addSubview(par7text)
            
            return view

        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 55))

        if tableView == paymentStage1TableView || tableView == paymentStage2TableView {
            
//            view.subviews.forEach({ $0.removeFromSuperview() })
            
            let par1text = UILabel()
            par1text.font = .systemFont(ofSize: 11, weight: .light)
            par1text.text = "Период"
            par1text.numberOfLines = 3
            par1text.frame = CGRect(x: 10, y: 5, width: w/5 - 5, height: par1text.intrinsicContentSize.height*3)
            
            let par2text = UILabel()
            par2text.font = .systemFont(ofSize: 11, weight: .light)
            par2text.text = "Общ. сумма выплаты"
            par2text.numberOfLines = 3
            par2text.frame = CGRect(x: 10 + w/5, y: 5, width: w/5 - 5, height: par2text.intrinsicContentSize.height*3)
            
            let par3text = UILabel()
            par3text.font = .systemFont(ofSize: 11, weight: .light)
            par3text.text = "Проценты"
            par3text.numberOfLines = 3
            par3text.frame = CGRect(x: 10 + 2*w/5, y: 5, width: w/5 - 5, height: par3text.intrinsicContentSize.height*3)
            
            let par4text = UILabel()
            par4text.font = .systemFont(ofSize: 11, weight: .light)
            par4text.text = "Кредит"
            par4text.numberOfLines = 3
            par4text.frame = CGRect(x: 10 + 3*w/5, y: 5, width: w/5 - 5, height: par4text.intrinsicContentSize.height*3)
            
            let par5text = UILabel()
            par5text.font = .systemFont(ofSize: 11, weight: .light)
            par5text.text = "Осталось выплатить"
            par5text.numberOfLines = 3
            par5text.frame = CGRect(x: 10 + 4*w/5, y: 5, width: w/5 - 5, height: par5text.intrinsicContentSize.height*3)
            
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
            
        } else if tableView == depositStageTableView {
            
//            view.subviews.forEach({ $0.removeFromSuperview() })
            
            let par1text = UILabel()
            par1text.font = .systemFont(ofSize: 11, weight: .light)
            par1text.text = "Период"
            par1text.numberOfLines = 3
            par1text.frame = CGRect(x: 10, y: 5, width: 0.15*w - 5, height: par1text.intrinsicContentSize.height*3)

            let par2text = UILabel()
            par2text.font = .systemFont(ofSize: 11, weight: .light)
            par2text.text = "Сумма в депозите"
            par2text.numberOfLines = 3
            par2text.frame = CGRect(x: 10 + 0.15*w, y: 5, width: 0.15*w - 5, height: par2text.intrinsicContentSize.height*3)
            
            let par3text = UILabel()
            par3text.font = .systemFont(ofSize: 11, weight: .light)
            par3text.text = "Вознаграждение"
            par3text.numberOfLines = 3
            par3text.frame = CGRect(x: 10 + 0.3*w, y: 5, width: 0.15*w - 5, height: par3text.intrinsicContentSize.height*3)
            
            let par4text = UILabel()
            par4text.font = .systemFont(ofSize: 11, weight: .light)
            par4text.text = "Ежемес. взнос"
            par4text.numberOfLines = 3
            par4text.frame = CGRect(x: 10 + 0.45*w, y: 5, width: 0.15*w - 5, height: par4text.intrinsicContentSize.height*3)
            
            let par5text = UILabel()
            par5text.font = .systemFont(ofSize: 11, weight: .light)
            par5text.text = "Капитализация за год"
            par5text.numberOfLines = 3
            par5text.frame = CGRect(x: 10 + 0.6*w, y: 5, width: 0.4*w/3 - 5, height: par5text.intrinsicContentSize.height*3)
            
            let par6text = UILabel()
            par6text.font = .systemFont(ofSize: 11, weight: .light)
            par6text.text = "Бонус"
            par6text.numberOfLines = 3
            par6text.frame = CGRect(x: 10 + (0.6 + 0.4/3)*w, y: 5, width: 0.4*w/3 - 5, height: par6text.intrinsicContentSize.height*3)
            
            let par7text = UILabel()
            par7text.font = .systemFont(ofSize: 11, weight: .light)
            par7text.text = "ОП"
            par7text.numberOfLines = 3
            par7text.frame = CGRect(x: 10 + (0.6 + 0.8/3)*w, y: 5, width: 0.4*w/3 - 5, height: par7text.intrinsicContentSize.height*3)

            view.addSubview(par1text)
            view.addSubview(par2text)
            view.addSubview(par3text)
            view.addSubview(par4text)
            view.addSubview(par5text)
            view.addSubview(par6text)
            view.addSubview(par7text)

            return view
            
        } else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == paymentStage2TableView {
            return 60
        }
        return 12*3
    }
}






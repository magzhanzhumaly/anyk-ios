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

    
    private var depositScheduleToggleButton1: UIButton = {
        let btn = UIButton()
     
        btn.setTitle("График депозита ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
//        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left

        return btn
    }()

    
    private var paymentScheduleToggleButton1: UIButton = {
        let btn = UIButton()
     
        btn.setTitle("График платежа ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
//        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left

        return btn
    }()

    private var depositScheduleToggleButton2: UIButton = {
        let btn = UIButton()
     
        btn.setTitle("График депозита ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
//        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left

        return btn
    }()

    
    private var paymentScheduleToggleButton2: UIButton = {
        let btn = UIButton()
     
        btn.setTitle("График платежа ▼", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
//        btn.titleLabel?.textAlignment = .left
        btn.contentHorizontalAlignment = .left

        return btn
    }()
    

    private var txt1val = UILabel()
    private var txt2val = UILabel()
    private var txt3val = UILabel()
    
    private let paymentStage1TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()
    
    private let depositStage1TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()
    
    private let paymentStage2TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()

    private let depositStage2TableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PaymentScheduleTableViewCell.self, forCellReuseIdentifier: PaymentScheduleTableViewCell.identifier)  // registered PaymentScheduleTableViewCell.self
        
        return tableView
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "calculations2"
        
        depositScheduleToggleButton1.addTarget(self, action: #selector(depositSchedule1ToggleButtonAction), for: .touchUpInside)
        paymentScheduleToggleButton1.addTarget(self, action: #selector(paymentSchedule1ToggleButtonAction), for: .touchUpInside)
        
        depositScheduleToggleButton2.addTarget(self, action: #selector(depositSchedule2ToggleButtonAction), for: .touchUpInside)
        paymentScheduleToggleButton2.addTarget(self, action: #selector(paymentSchedule2ToggleButtonAction), for: .touchUpInside)
        
        calculateDifferentiated()

        paymentStage1TableView.dataSource = self
        paymentStage1TableView.delegate = self


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
        


        tempHeight = 45
        depositScheduleToggleButton1.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)

        scrollView.addSubview(depositScheduleToggleButton1)
        lowestY += tempHeight
 
        
        tempHeight = 1565
        depositStage1TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(depositStage1TableView)
        
//        depositStage1TableView.isHidden = true
        
        let tableViewHeight = CGFloat(130 + 40*12*3)
        depositStage1TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)

        
        lowestY += tempHeight + 20

        
        
        
        tempHeight = 45
        paymentScheduleToggleButton1.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
      
        scrollView.addSubview(paymentScheduleToggleButton1)
        lowestY += tempHeight
 
        
        
        tempHeight = 1565
        paymentStage1TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(paymentStage1TableView)
        
//        paymentStage1TableView.isHidden = true
        
//        let tableViewHeight = CGFloat(130 + 40*m)
        paymentStage1TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)
        
        
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 8000)

//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: lowestY + tableViewHeight)
        
        lowestY += tempHeight + 20
        
        tempHeight = h/3
        
        let label4: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "В конце срока 3 года от суммы \(Int(txtField1)! - Int(txtField2)!) тенге:\n\n • По предварительному займу будет погашено: 0 тенге\n\n • По депозиту начислено 7 353 тенге, из которых:\n    • начислено процентов: 1 821 тенге\n    • государственная премия: 5 532 тенге\n\nПереплата по предварительному займу составит 7 647 тенге"
            label.font = .systemFont(ofSize: 12, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label4.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)
        
        scrollView.addSubview(label4)

        lowestY += tempHeight
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        tempHeight = h / 18

        
        let label1_1: UILabel = {
            let label = UILabel()
            label.text = "Этап 2 \"Жилищный заем\""
            label.font = .systemFont(ofSize: 17, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label1_1.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)
        
        scrollView.addSubview(label1_1)

        lowestY += tempHeight + 10
        
        tempHeight = h/6

        let label1_2: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Ежемесячный платеж: \(Int(X))\n\nСтавка: \(txtField3)\n\nСрок этапа: \(Int(txtField3)!-3) года\n\nПереплата: \(Int(totalOverpayment))"
            label.font = .systemFont(ofSize: 14, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label1_2.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)
        
        scrollView.addSubview(label1_2)

        lowestY += tempHeight

        let label1_3: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "С учетом погашенного долга, нояб. 2025 Вы переходите на Жилищный заем. Ваш займ будет: 44 348 тенге\n\n • со сроком кредитования \(Int(txtField3)!-3) лет\n • по ставке вознаграждения \(AEIR)% годовых\n\nЗа срок в \(Int(txtField3)!-3) лет:\n\n • Размер ежемесячной выплаты: 714 тенге\n • Сумма выплат по жилищному займу: 51 424 тенге\n • Переплата по жилищному займу составляет: 7 076 тенге"
//
//            • по ставке вознаграждения 5% годовых
//
//            • Вы вносите на депозит \((Int(txtField2)!) / (Int(txtField1)!))% от стоимости жилья \(txtField2)\n • Первые 3 года Вы ежемесячно платите \(Int(X)) тенге\n\nНа этом этапе Вы оплачиваете долг по промежуточному займу \(name) с процентной ставкой \(AEIR) на всю стоимость жилья (100%) \(txtField1)"
            label.font = .systemFont(ofSize: 12, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        tempHeight = h/3
        
        label1_3.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)
        
        scrollView.addSubview(label1_3)

        lowestY += tempHeight
        


        tempHeight = 45
        depositScheduleToggleButton2.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)

        scrollView.addSubview(depositScheduleToggleButton2)
        lowestY += tempHeight


        tempHeight = 1565
        depositStage2TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(depositStage2TableView)

//        depositStage2TableView.isHidden = true

//        tableViewHeight = CGFloat(130 + 40*12*3)
        depositStage2TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)


        lowestY += tempHeight + 20




        tempHeight = 45
        paymentScheduleToggleButton2.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)

        scrollView.addSubview(paymentScheduleToggleButton2)
        lowestY += tempHeight



        tempHeight = 1565
        paymentStage2TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(paymentStage2TableView)

//        paymentStage2TableView.isHidden = true

//        tableViewHeight = CGFloat(130 + 40*m)
        paymentStage2TableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tableViewHeight)


        lowestY += tempHeight + 20

//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 35000)

//        scrollView.contentSize = CGSize(width: view.frame.size.width, height: lowestY + tableViewHeight)


        
        
        
        
        
        tempHeight = h / 18

        
        let label1_5: UILabel = {
            let label = UILabel()
            label.text = "Приобретение жилья"
            label.font = .systemFont(ofSize: 17, weight: .medium)
            label.layer.masksToBounds = true
            
            return label
        }()
        
        label1_5.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)
        
        scrollView.addSubview(label1_5)

        lowestY += tempHeight + 10
        
        
        tempHeight = h/3

        let label1_6: UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "Для приобретения жилья стоимостью 100 000 тенге в итоге за весь срок 9 лет Ваши затраты составят 114 723 тенге из них:\n\n • Взнос 10% на депозит 10 000 тенге\n • Взносы по предварительному займу в течение 3 года - 53 300 тенге\n • Взносы по жилищному займу в течение 6 лет - 51 424 тенге\n • Общая переплата составит 14 723 тенге"
            label.font = .systemFont(ofSize: 12, weight: .medium)
            label.layer.masksToBounds = true

            return label
        }()

        label1_6.frame = CGRect(x: 10,
                                 y: lowestY,
                                 width: w,
                                 height: tempHeight)

        scrollView.addSubview(label1_6)

        lowestY += tempHeight



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

        if !depositStage1TableView.isHidden {
            paymentScheduleToggleButton1.setTitle("График депозита ▼", for: .normal)
            depositStage1TableView.isHidden = true
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
        } else {
            paymentScheduleToggleButton1.setTitle("График депозита ▲", for: .normal)

            depositStage1TableView.isHidden = false
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 35000)
        }
    }

    
    @objc func paymentSchedule1ToggleButtonAction(sender: UIButton!) {

        if !paymentStage1TableView.isHidden {
            paymentScheduleToggleButton1.setTitle("График платежа ▼", for: .normal)
            paymentStage1TableView.isHidden = true
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
        } else {
            paymentScheduleToggleButton1.setTitle("График платежа ▲", for: .normal)

            paymentStage1TableView.isHidden = false
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 35000)
        }
    }
    
    @objc func depositSchedule2ToggleButtonAction(sender: UIButton!) {

        if !depositStage2TableView.isHidden {
            paymentScheduleToggleButton2.setTitle("График депозита ▼", for: .normal)
            depositStage2TableView.isHidden = true
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
        } else {
            paymentScheduleToggleButton2.setTitle("График депозита ▲", for: .normal)

            depositStage2TableView.isHidden = false
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 35000)
        }
    }

    
    @objc func paymentSchedule2ToggleButtonAction(sender: UIButton!) {

        if !paymentStage2TableView.isHidden {
            paymentScheduleToggleButton2.setTitle("График платежа ▼", for: .normal)
            paymentStage2TableView.isHidden = true
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 0)
        } else {
            paymentScheduleToggleButton2.setTitle("График платежа ▲", for: .normal)

            paymentStage2TableView.isHidden = false
//            scrollView.contentSize = CGSize(width: view.frame.size.width, height: 35000)
        }
    }

    
}



extension Calculations2ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentScheduleTableViewCell.identifier, for: indexPath) as? PaymentScheduleTableViewCell else {
            return UITableViewCell()
        }

        if tableView == depositStage1TableView {
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
        if tableView == paymentStage1TableView {
            
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
        if tableView == depositStage2TableView {
        }
        if tableView == paymentStage2TableView {
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
        return 12*3
    }
}






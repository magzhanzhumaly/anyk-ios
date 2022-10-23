//
//  Calculations1ViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 06.10.2022.
//
 import UIKit

class Calculations1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // mortgage details
    var id = -1
    var name = ""
    var AEIR = 0.0 // ГЭСВ Годовая Эффективная Ставка Вознаграждения - Annual Effective Interest Rate
    var firstStageRate = 0.0
    var ageOfBorrower = [""]
    var initialFee = ""
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

    
    // local vars
    private let w = UIScreen.main.bounds.width - 20
    private let h = UIScreen.main.bounds.height - 88

    private var lowestY: CGFloat = 98
    private var tempHeight: CGFloat = 0
    
    private var multiplier = 1.0
    
    var X = 0.0
    var S = 0.0
    var p = 0.0
    var m = 0
    
    // outlets
    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100))

    private var segControl: UISegmentedControl = {
        let segmentItems = ["Дифференцированный", "Аннуитетный"]
        let control = UISegmentedControl(items: segmentItems)
        control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
        control.selectedSegmentIndex = 0

        return control
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
        title = "calculations1"
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 3000)

        
        tempHeight = h / 18
        
        segControl.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)

        scrollView.addSubview(segControl)
        
        lowestY += tempHeight + 10
        
        
        
        var firstDetail: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 12, weight: .light)
            label.layer.masksToBounds = true
            label.layer.cornerRadius = 10
            label.textAlignment = .center
            
            return label
        }()
        
        
        firstDetail.text = details[0]

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

        lowestY += tempHeight + 10

        
        calculateDifferentiated()
        
        
        tempHeight = 2000
        tableView.frame = CGRect(x: 10, y: lowestY, width: w, height: tempHeight)
        scrollView.addSubview(tableView)
    }
    

    func calculateDifferentiated() {
        //        Х — это ежемесячный взнос по ипотеке, который мы пытаемся рассчитать.
        //        S — это общая сумма кредита.
        //        P обозначает месячную ставку по кредиту (это годовая процентная ставка, разделенная на 12).
        //        M — это срок кредитования в месяцах.
        
        S = (Double(txtField1) ?? 0) - (Double(txtField2) ?? 0)
        p = AEIR/1200
        m = 12 * (Int(txtField3) ?? 0)
        
        X = S/Double(m) + S*p

        txt1val.text = "\(Int(X))"
        
        let totalPayout = Int(X) * m
        txt2val.text = "\(Int(totalPayout))"

        let totalOverpayment = totalPayout - Int(S)
        txt3val.text = "\(Int(totalOverpayment))"
        S -= X
        
        // kredit = S / m
    }
    
    func calculateAnnuity() {
//        Х — это ежемесячный взнос по ипотеке, который мы пытаемся рассчитать.
//        S — это общая сумма кредита.
//        P обозначает месячную ставку по кредиту (это годовая процентная ставка, разделенная на 12).
//        M — это срок кредитования в месяцах.
        
        S = (Double(txtField1) ?? 0) - (Double(txtField2) ?? 0)
        p = AEIR/1200
        m = 12 * (Int(txtField3) ?? 0)
        
        X = (S*p) / (1 - pow((1+p), Double((1-m))))
        
        
//        X = (S*p/1200) / 1 - pow((1+p/1200), -m)

        txt1val.text = "\(Int(X))"
        
        let totalPayout = Int(X) * m
        txt2val.text = "\(Int(totalPayout))"

        let totalOverpayment = totalPayout - Int(S)
        txt3val.text = "\(Int(totalOverpayment))"
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
        
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            multiplier = 1
            calculateDifferentiated()
        case 1:
            multiplier = 1.2
            calculateAnnuity()
        default:
            break
        }
        
    }
   
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PaymentScheduleTableViewCell.identifier, for: indexPath) as? PaymentScheduleTableViewCell else {
            return UITableViewCell()
        }

        cell.configure(par1: "\(X)", par2: Int(S), par3: Int(m), par4: Int(X), par5: Int(S))
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
        return 40.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40))
        //            view.backgroundColor = .red
        let lbl = UILabel(frame: CGRect(x: 10, y: 20, width: view.frame.width - 20, height: 40))
        
        lbl.font = .systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.text = "Ничего не подошло? Есть еще \(1) программы, которые могут быть вам интересны"
        view.addSubview(lbl)
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m
    }
    
}

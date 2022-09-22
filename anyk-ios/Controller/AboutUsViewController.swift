//
//  AboutUsViewController.swift
//  anyk-ios
//
//  Created by Magzhan Zhumaly on 08.09.2022.
//

import UIKit

class AboutUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 88, width: view.frame.size.width, height: view.frame.size.height - 100))
        view.addSubview(scrollView)
        
//        let topButton = UIButton(frame: CGRect(x: 20, y: 20, width: 100, height: 100))
//        topButton.backgroundColor = .blue
//        scrollView.addSubview(topButton)
//
//        let bottomButton = UIButton(frame: CGRect(x: 20, y: 2000, width: 100, height: 100))
//        bottomButton.backgroundColor = .blue
//        scrollView.addSubview(bottomButton)
        
        let lbl1 = UILabel(frame: CGRect(x: 20, y: 20, width: view.frame.size.width - 40, height: 50))
        lbl1.text = "Купи собственное жилье вместе с нами!"
//        lbl1.backgroundColor = .gray
        lbl1.numberOfLines = 2
        lbl1.font = .systemFont(ofSize: 20, weight: UIFont.Weight.light)
        
        let lbl2 = UILabel(frame: CGRect(x: 20, y: 70, width: view.frame.size.width - 40, height: 320))
        lbl2.text = "\"Мой дом\" - это жилищный агрегатор, который предоставляет жителям Республики Казахстан (РК) консолидированную информацию о доступных жилищных объектах и способах их покупки. \n\nПлатформа \"Мой дом\" позволяет гражданину РК получить информацию обо всех жилищных программах Казахстана в доступной форме, а также персонально подобрать доступные ему программы, получить персонализированные расчеты по ипотеке и инструкции пошаговых действий. \n\nЦелью создание платформы является предоставление актуальной информации по всем жилищным программам от государства и строительных компаний для граждан РК. Исходя из указанных персональных данных (доход, расходы, кредиты, семейное положение, наличие недвижимости, социальный статус) Вы сможете подобрать оптимальный и подходящий вариант приобретения жилья."
//        lbl2.backgroundColor = .lightGray
        lbl2.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl2.numberOfLines = 20
        
        let lbl3 = UILabel(frame: CGRect(x: 20, y: 390, width: view.frame.size.width - 40, height: 50))
        lbl3.text = "Какие есть возможности у пользователей платформы \"Мой дом\""
//        lbl3.backgroundColor = .gray
        lbl3.numberOfLines = 2
        lbl3.font = .systemFont(ofSize: 20, weight: UIFont.Weight.light)
        
        let lbl4 = UILabel(frame: CGRect(x: 20, y: 440, width: view.frame.size.width - 40, height: 260))
        lbl4.text = " • Осуществить персональный подбор по жилищным программам \n • Сделать расчет по ежемесячным выплатам по ипотеке \n • Сделать персональный расчет платежеспособности потенциального клиента \n • Выгрузить персональные расчеты по выбранной программе \n • Просматривать описание жилищных программ \n • Просматривать описание жилых комплексов \n • Просматривать списки банков-партнеров \n • Просматривать списки документов \n • Просматривать истории успехов покупки жилья посредством ипотечных программ других лиц \n • Получить онлайн консультацию в Aitu \n • Комментировать доступные жилищные программы"
//        lbl4.backgroundColor = .lightGray
        lbl4.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl4.numberOfLines = 20
        
        
        let lbl5 = UILabel(frame: CGRect(x: 20, y: 700, width: view.frame.size.width - 40, height: 50))
        lbl5.text = "Преимущества платформы \"Мой дом\""
//        lbl5.backgroundColor = .gray
        lbl5.numberOfLines = 2
        lbl5.font = .systemFont(ofSize: 20, weight: UIFont.Weight.light)
        
        let lbl6 = UILabel(frame: CGRect(x: 20, y: 750, width: view.frame.size.width - 40, height: 150))
        lbl6.text = "Жилищный агрегатор \"Мой дом\" единственная в Казахстане платформа, обеспечивающая актуальной и cтруктурированной информацией по государственным и коммерческим жилищным программам. Главным преимуществам платформы является персональный подбор доступных программ и осуществление расчетов с возможностью получения персональной рекомендации/инструкции по покупке жилья по определенной программе."
//        lbl6.backgroundColor = .lightGray
        lbl6.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl6.numberOfLines = 20

        
        let lbl7 = UILabel(frame: CGRect(x: 20, y: 900, width: view.frame.size.width - 40, height: 25))
        lbl7.text = "Как работает платформа \"Мой дом\"?"
//        lbl7.backgroundColor = .gray
        lbl7.numberOfLines = 2
        lbl7.font = .systemFont(ofSize: 20, weight: UIFont.Weight.light)
        
        let lbl8 = UILabel(frame: CGRect(x: 20, y: 925, width: view.frame.size.width - 40, height: 40))
        lbl8.text = "Шаг 1. \"Отображение всех доступных жилищных программ\""
//        lbl8.backgroundColor = .lightGray
        lbl8.font = .systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        lbl8.numberOfLines = 20

        let lbl9 = UILabel(frame: CGRect(x: 20, y: 965, width: view.frame.size.width - 40, height: 90))
        lbl9.text = "На главной странице Вам отображаются все доступные жилищные программы с указанием основных параметров, таких как первоначальный взнос, процентная ставка, срок займа,ограничение по стоимости кредита и краткое описание."
//        lbl9.backgroundColor = .lightGray
        lbl9.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl9.numberOfLines = 20

        let lbl10 = UILabel(frame: CGRect(x: 20, y: 1055, width: view.frame.size.width - 40, height: 20))
        lbl10.text = "Шаг 2. \"Персональный подбор\""
//        lbl10.backgroundColor = .lightGray
        lbl10.font = .systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        lbl10.numberOfLines = 20


        let lbl11 = UILabel(frame: CGRect(x: 20, y: 1075, width: view.frame.size.width - 40, height: 140))
        lbl11.text = "После указания в фильтре персональных данных (доход, расходы, кредиты, семейное положение, наличие недвижимости, социальный статус) Вам отображается список доступных и недоступных программ с отображением рекомендаций. Также отображаются другие возможности приобретния жилья, такие как арендное жилье, получение право на приобретение земли."
//        lbl11.backgroundColor = .lightGray
        lbl11.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl11.numberOfLines = 20
        
        let lbl12 = UILabel(frame: CGRect(x: 20, y: 1215, width: view.frame.size.width - 40, height: 20))
        lbl12.text = "Шаг 3. \"Персональные расчеты\""
//        lbl12.backgroundColor = .lightGray
        lbl12.font = .systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        lbl12.numberOfLines = 20


        let lbl13 = UILabel(frame: CGRect(x: 20, y: 1235, width: view.frame.size.width - 40, height: 90))
        lbl13.text = "Вы можете указать в онлайн калькуляторе входные данные: стоимость недвижимости, срок займа, сумму первоначального взноса, депозитные данные (при наличии депозита) и осуществить расчеты. После вывода результатов, Вы можете осуществить выгрузку."
//        lbl13.backgroundColor = .lightGray
        lbl13.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl13.numberOfLines = 20


        let lbl14 = UILabel(frame: CGRect(x: 20, y: 1325, width: view.frame.size.width - 40, height: 25))
        lbl14.text = "Операторы платформы \"Мой дом\""
//        lbl14.backgroundColor = .gray
        lbl14.numberOfLines = 2
        lbl14.font = .systemFont(ofSize: 20, weight: UIFont.Weight.light)

        let lbl15 = UILabel(frame: CGRect(x: 20, y: 1350, width: view.frame.size.width - 40, height: 200))
        lbl15.text = "Оператор \"Мой дом\" - эта компания, которая обеспечивает бесперебойную работу платформы и улучшает функциональные возможности системы. \n\nОператором \"Мой дом\" является ТОО \"Умные города\". \n\nТОО \"Умные города\", IT компания, основная цель которой разработка экосистемы цифровых продуктов для граждан РК, чтобы предоставить жителям доступ к качественным онлайн-сервисам и повлиять на повышение качества и уровня жизни населения Республики Казахстан."
//        lbl15.backgroundColor = .lightGray
        lbl15.font = .systemFont(ofSize: 13, weight: UIFont.Weight.light)
        lbl15.numberOfLines = 20

        
        scrollView.addSubview(lbl1)
        scrollView.addSubview(lbl2)
        scrollView.addSubview(lbl3)
        scrollView.addSubview(lbl4)
        scrollView.addSubview(lbl5)
        scrollView.addSubview(lbl6)
        scrollView.addSubview(lbl7)
        scrollView.addSubview(lbl8)
        scrollView.addSubview(lbl9)
        scrollView.addSubview(lbl10)
        scrollView.addSubview(lbl11)
        scrollView.addSubview(lbl12)
        scrollView.addSubview(lbl13)
        scrollView.addSubview(lbl14)
        scrollView.addSubview(lbl15)
//        scrollView.addSubview(lbl16)
//        scrollView.addSubview(lbl17)
        
        let lbl = UILabel(frame: CGRect(x: 20, y: 0, width: view.frame.size.width - 40, height: 2000))
        lbl.text = "Купи собственное жилье вместе с нами! \n\"Мой дом\" - это жилищный агрегатор, который предоставляет жителям Республики Казахстан (РК) консолидированную информацию о доступных жилищных объектах и способах их покупки. \nПлатформа \"Мой дом\" позволяет гражданину РК получить информацию обо всех жилищных программах Казахстана в доступной форме, а также персонально подобрать доступные ему программы, получить персонализированные расчеты по ипотеке и инструкции пошаговых действий. \nЦелью создание платформы является предоставление актуальной информации по всем жилищным программам от государства и строительных компаний для граждан РК. Исходя из указанных персональных данных (доход, расходы, кредиты, семейное положение, наличие недвижимости, социальный статус) Вы сможете подобрать оптимальный и подходящий вариант приобретения жилья.\nКакие есть возможности у пользователей платформы \"Мой дом\"\nОсуществить персональный подбор по жилищным программам \nСделать расчет по ежемесячным выплатам по ипотеке \nСделать персональный расчет платежеспособности потенциального клиента \nыгрузить персональные расчеты по выбранной программе       \nПросматривать описание жилищных программ \nПросматривать описание жилых комплексов \nПросматривать списки банков-партнеров \nПросматривать списки документов \nПросматривать истории успехов покупки жилья посредством ипотечных программ других лиц \nПолучить онлайн консультацию в Aitu \nКомментировать доступные жилищные программы \nПреимущества платформы \"Мой дом\" \nЖилищный агрегатор \"Мой дом\" единственная в Казахстане платформа, обеспечивающая актуальной и cтруктурированной информацией по государственным и коммерческим жилищным программам. Главным преимуществам платформы является персональный подбор доступных программ и осуществление расчетов с возможностью получения персональной рекомендации/инструкции по покупке жилья по определенной программе. \nКак работает платформа \"Мой дом\"?  \n\"Отображение всех доступных жилищных программ\" \nНа главной странице Вам отображаются все доступные жилищные программы с указанием основных параметров, таких как первоначальный взнос, процентная ставка, срок займа,ограничение по стоимости кредита и краткое описание. \"Персональный подбор\"     \nПосле указания в фильтре персональных данных (доход, расходы, кредиты, семейное положение, наличие недвижимости, социальный статус) Вам отображается список доступных и недоступных программ с отображением рекомендаций. Также отображаются другие возможности приобретния жилья, такие как арендное жилье, получение право на приобретение земли.  \n\"Персональные расчеты\"        \nВы можете указать в онлайн калькуляторе входные данные: стоимость недвижимости, срок займа, сумму первоначального взноса, депозитные данные (при наличии депозита) и осуществить расчеты. После вывода результатов, Вы можете осуществить выгрузку. \nОператоры платформы \"Мой дом\"        \nОператор \"Мой дом\" - эта компания, которая обеспечивает бесперебойную работу платформы и улучшает функциональные возможности системы. \nОператором \"Мой дом\" является ТОО \"Умные города\".\nТОО \"Умные города\", IT компания, основная цель которой разработка экосистемы цифровых продуктов для граждан РК, чтобы предоставить жителям доступ к качественным онлайн-сервисам и повлиять на повышение качества и уровня жизни населения Республики Казахстан."
        
//        lbl.numberOfLines = 1000
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1550)
    }
}

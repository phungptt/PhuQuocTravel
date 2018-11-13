//
//  ViewController.swift
//  PhuQuocTravel_Mobile
//
//  Created by Nguyễn Quốc Tuyến on 10/24/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//

import UIKit
import Floaty
import SnapKit

class ViewController: UIViewController {
    private lazy var listBackground: [UIViewController] = {
        var list = [UIViewController]()
        var index = 1
        while index <= 4 {
            guard let image = UIImage(named: "background\(index)") else { continue }
            list.append(self.createViewController(image: image))
            index += 1
        }
        return list
    }()
    
    private func createViewController(image: UIImage) -> UIViewController{
        let imageView = UIImageView()
        imageView.image = image
        let viewController = UIViewController()
        viewController.view.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })
        return viewController
    }
    
    private lazy var searchButton: Floaty = {
        let floaty = Floaty()
        floaty.buttonImage = UIImage(named: "ico_search")
        floaty.addItem("Trips", icon: UIImage(named: "ico_trips")!)
        floaty.addItem("Foods", icon: UIImage(named: "ico_foods")!)
        floaty.addItem("Hotels", icon: UIImage(named: "ico_hotels")!)
        floaty.addItem("Car rentals", icon: UIImage(named: "ico_car")!)
        floaty.addItem("Cruises", icon: UIImage(named: "ico_cruises")!)
        floaty.paddingX = 20
        floaty.paddingY = 50
        floaty.openAnimationType = .slideLeft
        return floaty
    }()
    
    private lazy var headerView: SlideViewController = {
        let header = SlideViewController()
        header.config(viewControllers: self.listBackground)
        return header
    }()
    
    private lazy var listPopularDestinationView: [UIView] = {
        var listViews = [UIView]()
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(date: "Sunday1",
                                                                               smallTitle: "",
                                                                               largeTitle: "Hòn mây  ",
                                                                               image: UIImage(named: ""))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(date: "Today",
                                                                               smallTitle: "",
                                                                               largeTitle: "Dinh Cậu",
                                                                               image: UIImage(named: ""))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(date: "ThuesDay",
                                                                               smallTitle: "Làng chài",
                                                                               largeTitle: "Hàm Ninh",
                                                                               image: UIImage(named: ""))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(date: "Friday",
                                                                               smallTitle: "",
                                                                               largeTitle: "Bãi sao",
                                                                               image: UIImage(named: ""))))
        return listViews
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var scrollContent = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupView()
    }

    private func setupView() {
        self.view.addSubview(self.searchButton)
        self.setupHeader()
    }
    
    private func setupHeader() {
        self.view.addSubview(self.headerView.view)
        self.headerView.view.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(200)
        }
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.scrollContent)
        
        self.scrollView.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.headerView.view.snp.bottom).offset(20)
            make.height.equalTo(300)
        }
        
        
        var gapCard = 10
        let scrollWidth = 200 * self.listPopularDestinationView.count + gapCard * (self.listPopularDestinationView.count - 1)
        
        self.scrollContent.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(scrollWidth)
            make.bottom.equalToSuperview().priority(.medium)
        }
        
        gapCard = 0
        var leftContrainst = self.scrollContent.snp.left
        self.listPopularDestinationView.forEach { (card) in
            self.scrollContent.addSubview(card)
            card.snp.makeConstraints({ (make) in
                make.left.equalTo(leftContrainst).offset(gapCard)
                make.top.bottom.equalToSuperview()
                make.width.equalTo(200)
            })
            
            leftContrainst = card.snp.right
            gapCard = 10
        }
    }
    
   
}


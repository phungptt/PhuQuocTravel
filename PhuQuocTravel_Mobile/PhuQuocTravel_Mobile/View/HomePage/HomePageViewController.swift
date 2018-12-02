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
import RxSwift
import RxCocoa

class HomePageViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private lazy var mainScrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    private lazy var mainScrollContent: UIView = {
        let view = UIView()
//        view.backgroundColor = .white
        return view
    }()
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
    
    //MARK: - Body
    //MARK: - Popular Destination
    private lazy var popularBound: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var simplyLabel: UILabel = {
        let label = UILabel()
        label.text = "SIMPLY AMAZING PLACE"
        label.textColor = .gray
        label.font = UIFont(name: "Oswald-Light", size: 10)
        return label
    }()
    
    private lazy var popularDestinationTitle: UILabel = {
        let label = UILabel()
        label.text = "Popular Destination"
        label.textColor = .black
        label.font = UIFont(name: "Oswald-Medium", size: 20)
        return label
    }()
    
    private lazy var listPopularDestinationView: [UIView] = {
        var listViews = [UIView]()
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "",
                                                                               largeTitle: "Hòn mây  ",
                                                                               image: UIImage(named: ""))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "",
                                                                               largeTitle: "Dinh Cậu",
                                                                               image: UIImage(named: ""))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "Làng chài",
                                                                               largeTitle: "Hàm Ninh",
                                                                               image: UIImage(named: ""))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "",
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
    
    //MARK: - Video intro
    private lazy var videoIntroBound = UIView()
    private let videoIntroBodyHeight: CGFloat = 250
    private lazy var videoIntroContent: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        return view
    }()
    private lazy var videoIntroBackground: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background_videointro")
        return imageView
    }()
    private lazy var videoIntro: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "videointro")
        imageView.layer.masksToBounds = false
        imageView.layer.shadowOffset = CGSize(width: 3, height: 3)
        imageView.layer.shadowRadius = 3
        imageView.layer.shadowOpacity = 1
        return imageView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupView()
    }

    private func setupView() {
        self.view.addSubview(self.videoIntroBackground)
        self.view.addSubview(self.mainScrollView)
        
        self.mainScrollView.addSubview(self.mainScrollContent)
        self.mainScrollContent.addSubview(self.headerView.view)
        self.mainScrollContent.addSubview(self.popularBound)
        self.mainScrollContent.addSubview(self.videoIntroBound)
        self.mainScrollContent.addSubview(self.bestOffserWithRoomBound)
        
        self.mainScrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.mainScrollContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.videoIntroBackground.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(80)
            make.height.equalTo(400)
        }
        
        self.setupHeader()
        self.setupPopularDestination()
        self.setupVideoIntroBody()
        self.setupBestOfferRoom()
        self.view.addSubview(self.searchButton)
    }
    
    private func setupHeader() {
        self.headerView.view.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func setupPopularDestination() {
        self.popularBound.addSubview(self.simplyLabel)
        self.popularBound.addSubview(self.popularDestinationTitle)
        self.popularBound.addSubview(scrollView)
        self.scrollView.addSubview(self.scrollContent)
        
        
        self.simplyLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        self.popularDestinationTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.simplyLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        self.scrollView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(self.popularDestinationTitle.snp.bottom).offset(20)
            make.height.equalTo(300)
            make.bottom.equalToSuperview().priority(.medium)
        }
        
        var gapCard = 10
        let scrollWidth = 200 * self.listPopularDestinationView.count + gapCard * (self.listPopularDestinationView.count - 1)
        
        self.scrollContent.snp.makeConstraints { (make) in
            make.edges.height.equalToSuperview()
            make.width.equalTo(scrollWidth)
        }
        
        gapCard = 0
        var leftContrainst = self.scrollContent.snp.left
        self.listPopularDestinationView.forEach { (card) in
            self.scrollContent.addSubview(card)
            card.snp.makeConstraints({ (make) in
                make.left.equalTo(leftContrainst).offset(gapCard)
                make.top.bottom.equalToSuperview()
                make.width.equalTo(200)
                
                if card == self.listPopularDestinationView.last! {
                    make.right.equalToSuperview().priority(.medium)
                }
            })
            
            leftContrainst = card.snp.right
            gapCard = 10
        }
        
        self.popularBound.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.headerView.view.snp.bottom).offset(20)
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    private lazy var videoIntroHeader: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var videoIntroFooter: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private func setupVideoIntroBody() {
        self.videoIntroBound.addSubview(self.videoIntroHeader)
        self.videoIntroBound.addSubview(self.videoIntroContent)
        self.videoIntroBound.addSubview(self.videoIntroFooter)
        self.videoIntroBound.addSubview(self.videoIntro)
        
        self.videoIntroHeader.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(20)
        }

        self.videoIntroFooter.snp.makeConstraints { (make) in
            make.height.equalTo(20)
            make.left.right.bottom.equalToSuperview()
        }
        self.videoIntroContent.snp.makeConstraints { (make) in
            make.top.equalTo(self.videoIntroHeader.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.videoIntroFooter.snp.top)
        }
        
        let videoIntroWidth = 200
        let videoIntroHeight = 120
        
        self.videoIntro.snp.makeConstraints { (make) in
            make.width.equalTo(videoIntroWidth)
            make.height.equalTo(videoIntroHeight)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        
        
        self.videoIntroBound.snp.makeConstraints { (make) in
            make.top.equalTo(self.popularBound.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(self.videoIntroBodyHeight)
        }
        let d: CGFloat = UIScreen.main.bounds.height - 300
        let screenHeight = UIScreen.main.bounds.height
        self.mainScrollView
            .rx
            .contentOffset
            .asObservable()
            .subscribe {[weak self] in
                guard let currentY = $0.element?.y, let `self` = self else { return }
                let transformVector = (currentY / screenHeight) * d
                self.videoIntroBackground.transform = CGAffineTransform(translationX: 0, y: -transformVector)
            }.disposed(by: self.disposeBag)
    }
    
    
    //MARK: - Best offer with room
    private lazy var bestOffserWithRoomBound: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private lazy var offserTitle: UILabel = {
        let label = UILabel()
        label.text = "The Best Offer With Room"
        label.textColor = .black
        label.font = UIFont(name: "Oswald-Medium", size: 20)
        return label
    }()
    
    private lazy var bestRoomScroll: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()
    
    private lazy var bestRoomContent: UIView = {
        let bestRoom1 = BestRoomCard(cardTitle: "MARRIOTT RESORT", image: UIImage(named: "best_room1"), price: 70, priceDescription: "per night")
        let bestRoom2 = BestRoomCard(cardTitle: "GREEN GARDEN", image: UIImage(named: "best_room2"), price: 70, priceDescription: "per night")
        let bestRoom3 = BestRoomCard(cardTitle: "SALINDA RESORT", image: UIImage(named: "best_room3"), price: 70, priceDescription: "per night")
        let bestRoom4 = BestRoomCard(cardTitle: "THE SHELL RESORT", image: UIImage(named: "best_room4"), price: 70, priceDescription: "per night")
        
        let view = UIView()
        
        view.addSubview(bestRoom1)
        view.addSubview(bestRoom2)
        view.addSubview(bestRoom3)
        view.addSubview(bestRoom4)
        
        var leftConstraint = view.snp.left
        
        view.subviews.forEach({ (subView) in
            subView.snp.makeConstraints { (make) in
                make.left.equalTo(leftConstraint).offset(20)
                make.top.bottom.equalToSuperview()
                make.width.equalTo(200)
                
                if let lastView = view.subviews.last, lastView == subView {
                    make.right.equalToSuperview()
                }
            }
            leftConstraint = subView.snp.right
        })
        
        return view
    }()
    
    
    private func setupBestOfferRoom() {
        self.bestOffserWithRoomBound.addSubview(self.bestRoomScroll)
        self.bestRoomScroll.addSubview(self.bestRoomContent)
        
        
        self.bestRoomContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(220 * self.bestRoomContent.subviews.count)
        }
        
        self.bestRoomScroll.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
            make.height.equalTo(300)
            make.bottom.equalToSuperview().priority(.medium)
        }
        
        self.bestOffserWithRoomBound.snp.makeConstraints { (make) in
            make.top.equalTo(self.videoIntroBound.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
            make.bottom.equalToSuperview().offset(-1000).priority(.medium)
        }
    }
    
   
}


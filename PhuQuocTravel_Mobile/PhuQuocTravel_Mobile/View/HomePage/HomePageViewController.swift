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
                                                                               image: UIImage(named: "hon-may-rut"))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "",
                                                                               largeTitle: "Dinh Cậu",
                                                                               image: UIImage(named: "dinh-cau"))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "Làng chài",
                                                                               largeTitle: "Hàm Ninh",
                                                                               image: UIImage(named: "lang-chai-ham-ninh-Phu-Quoc"))))
        
        listViews.append(PopularDestinationCard(model: PopularDestinationModel(smallTitle: "",
                                                                               largeTitle: "Bãi sao",
                                                                               image: UIImage(named: "bai-sao"))))
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
        self.mainScrollContent.addSubview(self.foodBoundView)
        self.mainScrollContent.addSubview(self.footerView)
        
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
        self.setupFoodAndRestaurant()
        self.setupFooterView()
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
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    private lazy var bestOfferTitle: UILabel = {
        let label = UILabel()
        label.text = "The Best Offer With Room"
        label.textColor = .black
        label.font = UIFont(name: "Oswald-Medium", size: 20)
        return label
    }()
    
    private lazy var bestRoomContent: UIView = {
        let bestRoom1 = BestRoomCard(cardTitle: "MARRIOTT RESORT", image: UIImage(named: "marriott-resort"), price: 70, priceDescription: "per night")
        let bestRoom2 = BestRoomCard(cardTitle: "GREEN GARDEN", image: UIImage(named: "green-garden-2-resort"), price: 70, priceDescription: "per night")
        let bestRoom3 = BestRoomCard(cardTitle: "SALINDA RESORT", image: UIImage(named: "salinda-resort"), price: 70, priceDescription: "per night")
        let bestRoom4 = BestRoomCard(cardTitle: "THE SHELL RESORT", image: UIImage(named: "the-sell-resort"), price: 70, priceDescription: "per night")
        
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
        self.bestOffserWithRoomBound.addSubview(self.bestOfferTitle)
        self.bestOffserWithRoomBound.addSubview(self.bestRoomScroll)
        
        self.bestRoomScroll.addSubview(self.bestRoomContent)
        
        
        self.bestOfferTitle.snp.remakeConstraints { (maker) in
            maker.top.equalToSuperview().offset(40)
            maker.centerX.equalToSuperview()
        }
        
        self.bestRoomContent.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
            make.width.equalTo(220 * self.bestRoomContent.subviews.count)
        }
        
        self.bestRoomScroll.snp.makeConstraints { (make) in
            make.top.equalTo(self.bestOfferTitle.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
            make.bottom.equalToSuperview().priority(.medium)
        }
        
        self.bestOffserWithRoomBound.snp.makeConstraints { (make) in
            make.top.equalTo(self.videoIntroBound.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.greaterThanOrEqualTo(0)
        }
    }
    
    //MARK: Food and Restaurant Guide.
    
    private lazy var foodBoundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private var foodContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = UIScreen.main.bounds.size
        let firstColor = UIColor(red: 86/255, green: 49/255, blue: 122/255, alpha: 1).cgColor
        let secondColor = UIColor(red: 61/255, green: 153/255, blue: 190/255, alpha: 1).cgColor
        let thirdColor = UIColor(red: 58/255, green: 181/255, blue: 176/255, alpha: 1).cgColor
        gradientLayer.colors = [firstColor, secondColor, thirdColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.addSublayer(gradientLayer)
        
        return view
    }()
    
    private var foodTitle: UILabel = {
        let label = UILabel()
        label.text = "Food & Restaurant Guide"
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Oswald-Medium", size: 20)
        return label
    }()
    
    private var foodSubTitle: UILabel = {
        let label = UILabel()
        label.text = "AMAZING THINGS IN PHU QUOC"
        label.textColor = .white
        label.font = UIFont(name: "Oswald-Light", size: 10)
        return label
    }()
    
    private var foodDescription: UILabel = {
        let label = UILabel()
        label.text = "Không chỉ gây ấn tượng bởi những thiên đường đảo đẹp ngất ngây, du khách đến đây còn được thưởng thức vô vàn những món ăn ngon, hấp dẫn. Đặc biệt, trong đó có rất nhiều món đặc sản mà bạn không có nhiều cơ hội ăn ở những vùng biển khác. Hãy những món ăn ở Phú Quốc có gì đặc sắc để khám phá và nhớ \"ăn sập Phú Quốc\" nhé!"
        label.textColor = UIColor.white
        label.textAlignment = NSTextAlignment.justified
//        label.font = UIFont(name: "Oswald-Light", size: 10)
        label.numberOfLines = 0
        return label
    }()
    
    
    private lazy var listOfFoodImage: [UIViewController] = {
        var list = [UIViewController]()
        var index = 1
        while index <= 3 {
            guard let image = UIImage(named: "food\(index)") else { continue }
            list.append(self.createViewController(image: image))
            index += 1
        }
        return list
    }()
    
    private lazy var foodAndRestaurantContent: SlideViewController = {
        let header = SlideViewController()
        header.config(viewControllers: self.listOfFoodImage)
        return header
    }()
    
    private func setupFoodAndRestaurant() {
        self.foodBoundView.addSubview(self.foodContentView)
        self.foodContentView.addSubview(self.foodSubTitle)
        self.foodContentView.addSubview(self.foodTitle)
        self.foodContentView.addSubview(self.foodDescription)
        self.foodContentView.addSubview(self.foodAndRestaurantContent.view)

        self.foodSubTitle.snp.remakeConstraints { (maker) in
            maker.top.equalToSuperview().offset(30)
            maker.centerX.equalToSuperview()
            maker.width.height.greaterThanOrEqualTo(0)
        }

        self.foodTitle.snp.remakeConstraints { (maker) in
            maker.top.equalTo(self.foodSubTitle.snp.bottom).offset(5)
            maker.left.equalTo(5)
            maker.right.equalTo(-5)
        }

        self.foodDescription.snp.remakeConstraints { (maker) in
            maker.top.equalTo(self.foodTitle.snp.bottom).offset(30)
            maker.left.equalTo(5)
            maker.right.equalTo(-5)
            
        }

        self.foodAndRestaurantContent.view.snp.remakeConstraints { (maker) in
            maker.top.equalTo(self.foodDescription.snp.bottom).offset(40)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(300)
            maker.bottom.equalToSuperview().offset(-30)
        }
        
        self.foodContentView.snp.remakeConstraints { (maker) in
            maker.top.equalToSuperview().offset(30)
            maker.left.right.equalToSuperview()
            maker.height.greaterThanOrEqualTo(0)
            maker.bottom.equalToSuperview().offset(-50)
        }
        
        self.foodBoundView.snp.remakeConstraints { (maker) in
            maker.top.equalTo(self.bestOffserWithRoomBound.snp.bottom)
            maker.left.right.equalToSuperview()
            maker.height.greaterThanOrEqualTo(0)
        }
    }
    
    //MARK: Let's travel together
    
    private var footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    private var letTravelTitle: UILabel = {
        let label = UILabel()
        label.text = "Let's travel together!"
        label.textColor = .white
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont(name: "Segoe ui semibold italic", size: 20)
        return label
    }()
    
    private var fbIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_fb")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.white
        return image
    }()
    
    private var instagramIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_instagram")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.white
        return image
    }()
    
    private var twitterIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_twitter")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.white
        return image
    }()
    
    private var googlePlusIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_googleplus")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.white
        return image
    }()
    
    private var dribbleIcon: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "ic_dribble")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor.white
        return image
    }()
    
    private var boundIcon = UIView()
    private var footerContentBound = UIView()
    
    private func setupFooterView() {
        self.footerView.addSubview(self.footerContentBound)
        
        self.footerContentBound.addSubview(self.letTravelTitle)
        self.footerContentBound.addSubview(self.boundIcon)
        
        self.boundIcon.addSubview(self.fbIcon)
        self.boundIcon.addSubview(self.instagramIcon)
        self.boundIcon.addSubview(self.googlePlusIcon)
        self.boundIcon.addSubview(self.twitterIcon)
        self.boundIcon.addSubview(self.dribbleIcon)
        
        self.letTravelTitle.snp.remakeConstraints { (maker) in
            maker.top.equalToSuperview()
            maker.centerX.equalToSuperview()
        }
        
        let iconSize = 20
        let iconGap = 10
        
        self.fbIcon.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalToSuperview()
            maker.width.equalTo(iconSize)
        }
        
        self.instagramIcon.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalTo(self.fbIcon.snp.right).offset(iconGap)
            maker.width.equalTo(iconSize)
        }
        
        self.twitterIcon.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalTo(self.instagramIcon.snp.right).offset(iconGap)
            maker.width.equalTo(iconSize)
        }
        
        self.googlePlusIcon.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalTo(self.twitterIcon.snp.right).offset(iconGap)
            maker.width.equalTo(iconSize)
        }
        
        self.dribbleIcon.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.left.equalTo(self.googlePlusIcon.snp.right).offset(iconGap)
            maker.width.equalTo(iconSize)
            maker.right.equalToSuperview()
        }
        
        self.boundIcon.snp.remakeConstraints { (maker) in
            maker.top.equalTo(self.letTravelTitle.snp.bottom).offset(20)
            maker.width.greaterThanOrEqualTo(0)
            maker.height.equalTo(iconSize)
            maker.bottom.equalToSuperview()
            maker.left.right.equalToSuperview().priority(.medium)
        }
        
        self.footerContentBound.snp.remakeConstraints { (maker) in
            maker.center.equalToSuperview()
        }
        
        self.footerView.snp.remakeConstraints { (maker) in
            maker.top.equalTo(self.foodBoundView.snp.bottom)
            maker.left.right.equalToSuperview()
            maker.height.equalTo(200)
            maker.bottom.equalToSuperview()
        }
    }
}


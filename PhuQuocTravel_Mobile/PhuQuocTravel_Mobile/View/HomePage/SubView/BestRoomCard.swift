//
//  BestOfferCard.swift
//  PhuQuocTravel_Mobile
//
//  Created by Nguyễn Quốc Tuyến on 11/17/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//

import Foundation
import UIKit

class BestRoomCard: UIView {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .lightGray
        return imageView
    }()
    
    private lazy var markBound: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bestoffer_mark")
        return imageView
    }()
    
    private lazy var markTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Oswald-Light", size: 20)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Oswald-Medium", size: 20)
        label.textColor = UIColor.appColor
        return label
    }()
    
    private lazy var priceDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Oswald-Light", size: 15)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var ratingBound: UIView = {
        let view = UIView()
        return view
    }()
    
    private let buttonHeight: CGFloat = 44
    private lazy var detailButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Xem thêm ...", for: .normal)
        btn.layer.cornerRadius = self.buttonHeight / 2
        btn.backgroundColor = UIColor.appColor
        btn.titleLabel?.font = UIFont.appFont(size: 13)
        
        return btn
    }()
    private lazy var bookNowButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Đặt ngay ...", for: .normal)
        btn.layer.cornerRadius = self.buttonHeight / 2
        btn.backgroundColor = UIColor.appColor
        btn.titleLabel?.font = UIFont.appFont(size: 13)
        
        return btn
    }()
    
    private lazy var centerBound: UIView = {
        let view = UIView()
//        view.backgroundColor = .green
        return view
    }()
    
    private lazy var rating1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 255/255, green: 235/255, blue: 141/255, alpha: 1)
        return image
    }()
    private lazy var rating2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 254/255, green: 212/255, blue: 107/255, alpha: 1)
        return image
    }()
    private lazy var rating3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 251/255, green: 181/255, blue: 61/255, alpha: 1)
        return image
    }()
    private lazy var rating4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 250/255, green: 158/255, blue: 27/255, alpha: 1)
        return image
    }()
    private lazy var rating5: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.init(named: "star")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = UIColor(red: 165/255, green: 165/255, blue: 165/255, alpha: 1)
        return image
    }()
    
    private func setupReview() {
        self.addSubview(self.imageView)
        
        self.imageView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.addSubview(self.markBound)
        self.addSubview(self.priceLabel)
        self.addSubview(self.centerBound)
        
        
        self.centerBound.addSubview(self.ratingBound)
        self.centerBound.addSubview(self.detailButton)
        self.centerBound.addSubview(self.bookNowButton)
        
        self.markBound.addSubview(self.markTitle)
        self.ratingBound.addSubview(self.rating1)
        self.ratingBound.addSubview(self.rating2)
        self.ratingBound.addSubview(self.rating3)
        self.ratingBound.addSubview(self.rating4)
        self.ratingBound.addSubview(self.rating5)
        
        self.priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.markBound.snp.makeConstraints { (make) in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.height.equalTo(54)
            make.right.equalToSuperview().offset(-20)
        }
        self.markTitle.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.height.greaterThanOrEqualTo(0)
        }
        
        let starSize = 25
        let ratingGap = 5
        
        self.ratingBound.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.height.equalTo(starSize)
            make.width.greaterThanOrEqualTo(0)
            make.centerX.equalToSuperview()
        }
        
        self.rating1.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.width.equalTo(starSize)
        }
        
        self.rating2.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalTo(self.rating1.snp.trailing).offset(ratingGap)
            maker.width.equalTo(starSize)
        }
        
        self.rating3.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalTo(self.rating2.snp.trailing).offset(ratingGap)
            maker.width.equalTo(starSize)
        }
        
        self.rating4.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalTo(self.rating3.snp.trailing).offset(ratingGap)
            maker.width.equalTo(starSize)
        }
        
        self.rating5.snp.remakeConstraints { (maker) in
            maker.top.bottom.equalToSuperview()
            maker.leading.equalTo(self.rating4.snp.trailing).offset(ratingGap)
            maker.width.equalTo(starSize)
            maker.trailing.equalToSuperview()
        }
        
//        self.detailButton.snp.makeConstraints { (make) in
//            make.top.equalTo(self.ratingBound.snp.bottom).offset(20)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(120)
//            make.height.equalTo(self.buttonHeight)
//        }
//
//        self.bookNowButton.snp.makeConstraints { (make) in
//            make.top.equalTo(self.detailButton.snp.bottom).offset(5)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(120)
//            make.height.equalTo(self.buttonHeight)
//            make.bottom.equalToSuperview().priority(.medium)
//        }
        
        self.centerBound.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.width.greaterThanOrEqualTo(0)
        }
    }
    
    
    convenience init(cardTitle: String, image: UIImage?, price: Int, priceDescription: String) {
        self.init(frame: .zero)
        
        self.imageView.image = image
        self.markTitle.text = cardTitle
        self.priceLabel.text = "\(price) $"
        self.priceDescription.text = priceDescription
        
        self.setupReview()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

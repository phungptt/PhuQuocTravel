//
//  PopularDestnationCard.swift
//  PhuQuocTravel_Mobile
//
//  Created by Nguyễn Quốc Tuyến on 11/13/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//

import Foundation
import UIKit

struct PopularDestinationModel {
    var smallTitle: String
    var largeTitle: String
    var image: UIImage?
}

class PopularDestinationCard: UIView {
    private let buttonHeight: CGFloat = 44
    
    private lazy var smallTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.text = "Làng chài"
        return label
    }()
    
    private lazy var largeTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.text = "Hàm Ninh"
        return label
    }()
    
    private lazy var ratingBound = UIView()
    
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
    
    private lazy var seeMoreButton: UIButton = {
        let btn = UIButton()
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = CGSize(width: 120, height: self.buttonHeight)
        gradientLayer.cornerRadius = self.buttonHeight / 2
        gradientLayer.colors = [UIColor.blue.cgColor,UIColor.lightGray.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        btn.layer.addSublayer(gradientLayer)
        
        btn.setTitle("Xem thêm ...", for: .normal)
        btn.layer.cornerRadius = self.buttonHeight / 2
        btn.backgroundColor = UIColor.appColor
        btn.titleLabel?.font = UIFont.appFont(size: 13)
        return btn
    }()
    
    private lazy var backgroundImage: UIImageView = UIImageView()
    
    convenience init(model: PopularDestinationModel) {
        self.init(frame: .zero)
        self.smallTitle.text = model.smallTitle
        self.largeTitle.text = model.largeTitle
        self.backgroundImage.image = model.image
        
        self.setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var mainBound = UIView()
    
    private func setupView() {
        self.backgroundColor = .gray
        
        self.addSubview(self.backgroundImage)
        self.addSubview(self.mainBound)
        self.mainBound.addSubview(self.smallTitle)
        self.mainBound.addSubview(self.largeTitle)
        self.mainBound.addSubview(self.seeMoreButton)
        self.mainBound.addSubview(self.ratingBound)
        
        self.ratingBound.addSubview(self.rating1)
        self.ratingBound.addSubview(self.rating2)
        self.ratingBound.addSubview(self.rating3)
        self.ratingBound.addSubview(self.rating4)
        self.ratingBound.addSubview(self.rating5)
        
        self.backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.largeTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.smallTitle.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        let starSize = 25
        let ratingGap = 5
        
        self.ratingBound.snp.makeConstraints { (make) in
            make.height.equalTo(starSize)
            make.width.greaterThanOrEqualTo(0)
            make.center.equalToSuperview()
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
        
        
        self.seeMoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.ratingBound.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(buttonHeight)
            make.bottom.equalToSuperview().priority(.medium)
        }
        
        self.mainBound.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.greaterThanOrEqualTo(0)
        }
    }
    
}

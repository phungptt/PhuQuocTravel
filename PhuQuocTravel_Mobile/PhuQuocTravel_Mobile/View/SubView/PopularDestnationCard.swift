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
    var date: String
    var smallTitle: String
    var largeTitle: String
    var image: UIImage?
}

class PopularDestinationCard: UIView {
    private let buttonHeight: CGFloat = 44
    private lazy var dateBound: UIView = {
        let bound = UIView()
        bound.layer.cornerRadius = 10
        bound.backgroundColor = UIColor.titleColor
        return bound
    }()
    private lazy var date: UILabel = {
        let label = UILabel()
        label.font = UIFont.appFont(size: 13)
        label.textAlignment = .center
        label.text = "Sunday"
        label.textColor = .white
        return label
    }()
    
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
    
    private lazy var seeMoreButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Xem thêm ...", for: .normal)
        btn.layer.cornerRadius = self.buttonHeight / 2
        btn.backgroundColor = UIColor.titleColor
        btn.titleLabel?.font = UIFont.appFont(size: 13)
        return btn
    }()
    
    private lazy var backgroundImage: UIImageView = UIImageView()
    
    convenience init(model: PopularDestinationModel) {
        self.init(frame: .zero)
        self.date.text = model.date
        self.smallTitle.text = model.smallTitle
        self.largeTitle.text = model.largeTitle
//        self.backgroundImage.image = model.image
        
        self.setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .gray
        self.addSubview(self.backgroundImage)
        self.addSubview(self.dateBound)
        self.addSubview(self.smallTitle)
        self.addSubview(self.largeTitle)
        self.addSubview(self.seeMoreButton)
        self.addSubview(self.ratingBound)
        
        self.dateBound.addSubview(self.date)
        
        self.backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.date.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
            make.left.equalToSuperview().offset(10).priority(.medium)
            make.right.equalToSuperview().offset(-10).priority(.medium)
            make.top.equalToSuperview().offset(2).priority(.medium)
            make.bottom.equalToSuperview().offset(-2).priority(.medium)
        }
        
        self.dateBound.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.largeTitle.snp.makeConstraints { (make) in
            make.top.equalTo(self.dateBound.snp.bottom).offset(74)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.smallTitle.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.largeTitle.snp.top).offset(-10)
            make.centerX.equalToSuperview()
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(0)
        }
        
        self.ratingBound.snp.makeConstraints { (make) in
            make.top.equalTo(self.largeTitle.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(30)
        }
        
        self.seeMoreButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.ratingBound.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(buttonHeight)
        }
    }
}

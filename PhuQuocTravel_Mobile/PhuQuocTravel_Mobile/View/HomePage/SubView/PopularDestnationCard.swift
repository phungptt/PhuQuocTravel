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
    
    private lazy var seeMoreButton: UIButton = {
        let btn = UIButton()
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
//        self.backgroundImage.image = model.image
        
        self.setupView()
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
            make.bottom.equalToSuperview().priority(.medium)
        }
        
        self.mainBound.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.height.greaterThanOrEqualTo(0)
        }
    }
}

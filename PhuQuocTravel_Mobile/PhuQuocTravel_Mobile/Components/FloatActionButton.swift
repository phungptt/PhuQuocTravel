////
////  FloatActionButton.swift
////  PhuQuocTravel_Mobile
////
////  Created by Nguyễn Quốc Tuyến on 10/24/18.
////  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//class FloatActionButton: UIView {
//    private lazy var tripSearchButton: UIButton 
//    
//    private lazy var button: UIButton = {
//        let btn = UIButton()
//        btn.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//        return btn
//    }()
//    
//    private var buttonWidth: CGFloat = 100 {
//        didSet {
//            self.layer.cornerRadius = self.buttonWidth / 2
//        }
//    }
//    
//    init() {
//        super.init(frame: .zero)
//        self.backgroundColor = .lightGray
//        self.layer.cornerRadius = self.buttonWidth / 2
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupView() {
//        self.addSubview(self.button)
//        self.button.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
//    }
//    
//    @objc private func buttonTapped(_ sender: UIButton) {
//        
//    }
//}

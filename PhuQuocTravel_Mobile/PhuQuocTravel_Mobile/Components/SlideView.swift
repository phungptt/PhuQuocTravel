//
//  SlideView.swift
//  PhuQuocTravel_mobile
//
//  Created by Nguyễn Quốc Tuyến on 10/22/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//

import UIKit
import SnapKit

public class SlideView: UIView {
    
    public var isPaging: Bool = true {
        didSet {
            if isPaging {
                self.elementWidth = self.bounds.width
            }  
        }
    }
    public lazy var elementWidth: CGFloat = UIScreen.main.bounds.size.width
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = self.isPaging
        return scroll
    }()
    private lazy var content: UIView = {
        let view = UIView(frame: .zero)
        return view
    }()
    
    public var listContentView: [UIView] = []
    
    private var timer: Timer = Timer()
    public var autoTransform: Bool = true
    private var durationTime: TimeInterval = 3
    
    func setupView() {
        self.addSubview(self.scrollView)
        self.scrollView.addSubview(self.content)
        
        self.scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        self.content.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        var leftConstraint = self.content.snp.left
        self.listContentView.forEach { (view) in
            self.content.addSubview(view)

            view.snp.makeConstraints({ (make) in
                make.left.equalTo(leftConstraint)
                make.width.equalTo(self.elementWidth)
                make.top.bottom.equalToSuperview()
                guard let lastView = self.listContentView.last else { return }
                if lastView == view {
                    make.right.equalToSuperview()
                }
                leftConstraint = view.snp.right
            })
        }
        
        self.runTimer()
    }
    
    private func runTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: durationTime, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        UIView.animate(withDuration: 0.3) {
            self.nextView()
        }
        
    }
    
    private func nextView() {
        let currentOffsetX = self.scrollView.contentOffset.x
        self.scrollView.contentOffset.x = (currentOffsetX + self.elementWidth).truncatingRemainder(dividingBy: self.content.bounds.width)
    }
}

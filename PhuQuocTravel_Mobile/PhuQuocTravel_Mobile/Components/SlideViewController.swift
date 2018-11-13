//
//  HeaderView.swift
//  PhuQuocTravel_mobile
//
//  Created by Nguyễn Quốc Tuyến on 10/22/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//
import UIKit

class SlideViewController:  UIViewController {
    private lazy var viewControllers: [UIViewController] = [UIViewController]()
    
    private var pageViewController: UIPageViewController!
    private var showPageControl: Bool = true
    private var timer: Timer?
    private var durationTime: TimeInterval = 3
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.backgroundColor = .clear
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        pageControl.numberOfPages = self.viewControllers.count
        
        return pageControl
    }()
    
    public func config(viewControllers: [UIViewController], showPageControl: Bool = true) {
        self.viewControllers = viewControllers
        self.showPageControl = showPageControl
        if self.showPageControl {
            self.view.addSubview(pageControl)
            pageControl.snp.makeConstraints { (make) in
                make.left.bottom.right.equalToSuperview()
                make.height.equalTo(30)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.setupView()
    }
    
    private func setupView() {
        self.pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController.view.frame = self.view.bounds
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
        
        self.pageViewController
            .setViewControllers([self.viewControllers.first!],
                                direction: .forward,
                                animated: true,
                                completion: nil)
        
        
        self.view.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        self.pageViewController.didMove(toParent: self)
        self.startTimer()
    }
    
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = self.pageViewController.viewControllers?.first,
            let currentIndex = viewControllers.index(of:firstViewController), currentIndex != newIndex {
            let direction: UIPageViewController.NavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = viewControllers[newIndex]
            scrollToViewController(viewController: nextViewController, direction: direction)
        }
    }
    
    private func scrollToViewController(viewController: UIViewController,
                                        direction: UIPageViewController.NavigationDirection = .forward) {
        self.pageViewController.setViewControllers([viewController],
                                                   direction: direction,
                                                   animated: true,
                                                   completion: nil)
    }
    
    private func startTimer() {
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: durationTime,
                                          target: self,
                                          selector: #selector(updateTimer),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc private func updateTimer() {
        let currentIndex = self.pageControl.currentPage
        let nextIndex = (currentIndex + 1) % self.viewControllers.count
        self.scrollToViewController(index: nextIndex)
        UIView.animate(withDuration: 0.3) {
            self.pageControl.currentPage = nextIndex
        }
    }
    
    
}

extension SlideViewController: UIPageViewControllerDelegate {
    
}

extension SlideViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = self.viewControllers.index(of: viewController) else { return nil }
        let previousIndex = index - 1 < 0 ? self.viewControllers.count - 1 : index - 1
        return viewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentView =  self.pageViewController.viewControllers?.first else { return }
        pageControl.currentPage = self.viewControllers.index(of: currentView) ?? pageControl.currentPage
        self.startTimer()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.viewControllers.index(of: viewController) else { return nil }
        let nextIndex = (index + 1) % (self.viewControllers.count)
        return viewControllers[nextIndex]
    }
}

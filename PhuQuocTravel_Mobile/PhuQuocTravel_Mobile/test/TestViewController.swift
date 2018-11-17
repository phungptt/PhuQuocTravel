//
//  TestViewController.swift
//  PhuQuocTravel_Mobile
//
//  Created by Nguyễn Quốc Tuyến on 11/1/18.
//  Copyright © 2018 Nguyễn Quốc Tuyến. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    var index: Int? = 0
    var pageViewController: UIPageViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageViewController = UIPageViewController.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        
        pageViewController.view.frame = self.view.bounds
        
        let initialVC = self.viewControllerAtIndex(index: 0)
        let viewControllers: [TestViewController] = [initialVC]
        
        pageViewController.setViewControllers(viewControllers, direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        self.view.addSubview(pageViewController.view)
        self.addChild(pageViewController)
        self.pageViewController.didMove(toParent: self)
    }
    
    func viewControllerAtIndex(index: Int) -> TestViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        
        if let childVC = storyboard.instantiateViewController(withIdentifier: "TestViewController") as? TestViewController {
            childVC.index = index
            return childVC
        }
        
        return TestViewController()
    }

}

extension TestViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? TestViewController {
            var index = viewController.index ?? 0
            
            index += 1
            
            if index == 5 {
                return nil
            }
            
            return self.viewControllerAtIndex(index: index)
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? TestViewController {
            var index = viewController.index ?? 0
            if index == 0 {
                return nil
            }
            
            index += -1
            
            return self.viewControllerAtIndex(index: index)
        }
        
        return nil
    }
    
    
}

extension TestViewController: UIPageViewControllerDelegate {
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
}

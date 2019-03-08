//
//  LaunchPageVC.swift
//  20190305-AbdullahMagat-NYCSchools
//
//  Created by Can-IOS on 3/7/19.
//  Copyright © 2019 Abdullah Magat. All rights reserved.
//

import UIKit
import AVFoundation
class LaunchPageVC: UIPageViewController{
    
    var pageControl = UIPageControl()
    private lazy var orderedViewControllers: [UIViewController] = {
        return [self.newShownViewController(name: "LaunchPage1"),
                self.newShownViewController(name: "LaunchPage2"),]
    }()
    
    private func newShownViewController(name: String) -> UIViewController {
        let viewcontroller = UIStoryboard(name: "LaunchPages", bundle: nil) .
            instantiateViewController(withIdentifier: "\(name)")
        return viewcontroller
    }
    
    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.configurePageControl()
        self.delegate = self
        
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
    
    
}
// MARK: UIPageViewControllerDataSource
extension LaunchPageVC : UIPageViewControllerDataSource , UIPageViewControllerDelegate{
    func configurePageControl() {
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.darkGray
        self.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        
        self.view.addSubview(pageControl)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers!.first
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController!)!
        if (pageContentViewController==orderedViewControllers.last){
            pageControl.isHidden = true
        }else{
            pageControl.isHidden = false
            
        }
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        return orderedViewControllers[nextIndex]
        
    }
    
}

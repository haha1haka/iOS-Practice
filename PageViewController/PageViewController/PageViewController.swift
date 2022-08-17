//
//  PageViewController.swift
//  PageViewController
//
//  Created by HWAKSEONG KIM on 2022/08/17.
//

import UIKit

class PageViewController: UIPageViewController {
    var dummyViewControllers: [UIViewController] = []
    
}
extension PageViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        createPageViewController()
        configurePageViewController()
    }
    
    func configurePageViewController() {
        delegate = self
        dataSource = self
        //첫화면 세팅 해줘야됨 : setViewController
        guard let first = dummyViewControllers.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
    
    func createPageViewController() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc2 = sb.instantiateViewController(withIdentifier: "ViewController2") as!
        ViewController2
        let vc3 = sb.instantiateViewController(withIdentifier: "ViewController3") as!
        ViewController3
        let vc4 = sb.instantiateViewController(withIdentifier: "ViewController4") as!
        ViewController4
        dummyViewControllers = [vc2, vc3, vc4]
    }
}









extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        if let currentIndex = dummyViewControllers.firstIndex(of: viewController) {
            
            if currentIndex > 0 {
                
                return dummyViewControllers[currentIndex-1]
            }
            
        }
        
        return nil
    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        if let currentIndex = dummyViewControllers.firstIndex(of: viewController) {
            
            if currentIndex < dummyViewControllers.count - 1 {
                
                return dummyViewControllers[currentIndex+1]
                
            }
            
        }
        
        return nil
    }

}

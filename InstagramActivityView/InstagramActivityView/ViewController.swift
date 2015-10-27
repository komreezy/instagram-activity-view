//
//  ViewController.swift
//  InstagramActivityView
//
//  Created by Komran Ghahremani on 10/23/15.
//  Copyright © 2015 Komran Ghahremani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, TabViewDelegate {

    var followingViewController: FollowingTableViewController?
    var youViewController: YouTableViewController?
    var tabDelegate: TabScrollDelegate?
    
    var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navigationView = UIView(frame: CGRectMake(0, 0, view.frame.width, view.frame.height * 0.10))
        navigationView.backgroundColor = UIColor.instagramBlue()
        
        let activityTitle = UILabel(frame: CGRectMake((view.frame.width / 2) - 60, navigationView.center.y - 30, 120, 80))
        activityTitle.font = UIFont(name: "HelveticaNeue", size: 15.0)
        activityTitle.textColor = UIColor.whiteColor()
        activityTitle.textAlignment = .Center
        activityTitle.text = "ACTIVITY"
        
        navigationView.addSubview(activityTitle)
        view.addSubview(navigationView)
        
        followingViewController = FollowingTableViewController()
        youViewController = YouTableViewController()
        
        scrollView = UIScrollView(frame: CGRectMake(0, navigationView.center.y + 10, view.frame.width, view.frame.height - navigationView.frame.height))
        scrollView!.pagingEnabled = true
        scrollView!.delegate = self
        scrollView!.showsHorizontalScrollIndicator = false
        
        let leftContainer = UIView(frame: CGRectMake(0, navigationView.center.y, view.frame.width, view.frame.height - navigationView.frame.height))
        let rightContainer = UIView(frame: CGRectMake(view.frame.width, navigationView.center.y, view.frame.width, view.frame.height - navigationView.frame.height))
        
        leftContainer.addSubview(followingViewController!.view)
        rightContainer.addSubview(youViewController!.view)
        
        scrollView!.addSubview(leftContainer)
        scrollView!.addSubview(rightContainer)
        view.addSubview(scrollView!)
        
        scrollView!.contentSize = CGSizeMake(view.frame.width * 2, view.frame.height - navigationView.frame.height)
        
        let tabBarView = TabButtonView(frame: CGRectMake(0, navigationView.frame.maxY, view.frame.width, 35))
        
        tabDelegate = tabBarView
        tabBarView.delegate = self
        
        view.addSubview(tabBarView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        tabDelegate?.viewDidScroll(scrollView.contentOffset.x)
    }
    
    func followingTapped() {
        UIView.animateWithDuration(0.4, animations: {
            self.scrollView?.contentOffset.x = 0.0
        })
    }
    
    func youTapped() {
        UIView.animateWithDuration(0.4, animations: {
            self.scrollView?.contentOffset.x = self.view.frame.width
        })
    }
}

protocol TabScrollDelegate {
    func viewDidScroll(offsetX: CGFloat)
}

extension UIColor {
    class func instagramBlue() -> UIColor {
        return UIColor(red: 34.0/255.0, green: 97.0/255.0, blue: 151.0/255.0, alpha: 1.0)
    }
    
    class func highlightBlue() -> UIColor {
        return UIColor(red: 89.0/255.0, green: 153.0/255.0, blue: 222.0/255.0, alpha: 1.0)
    }
    
    class func instagramBlack() -> UIColor {
        return UIColor(red: 38.0/255.0, green: 35.0/255.0, blue: 39.0/255.0, alpha: 1.0)
    }
    
    class func lightGrey() -> UIColor {
        return UIColor(red: 219.0/255.0, green: 219.0/255.0, blue: 219.0/255.0, alpha: 1.0)
    }
}


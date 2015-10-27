//
//  TabButtonView.swift
//  InstagramActivityView
//
//  Created by Komran Ghahremani on 10/23/15.
//  Copyright © 2015 Komran Ghahremani. All rights reserved.
//

import UIKit

class TabButtonView: UIView, TabScrollDelegate {

    var followingTabButton: UILabel
    var youTabButton: UILabel
    var highlightBar: UIView
    var followingTapRecognizer: UITapGestureRecognizer?
    var youTapRecognizer: UITapGestureRecognizer?
    
    var delegate: TabViewDelegate?
    
    override init(frame: CGRect) {
        
        followingTabButton = UILabel(frame: CGRectMake(0, 0, frame.width / 2, frame.height))
        followingTabButton.text = "FOLLOWING"
        followingTabButton.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
        followingTabButton.textColor = UIColor.highlightBlue()
        followingTabButton.textAlignment = .Center
        followingTabButton.userInteractionEnabled = true
        
        youTabButton = UILabel(frame: CGRectMake(frame.width / 2, 0, frame.width / 2, frame.height))
        youTabButton.text = "YOU"
        youTabButton.font = UIFont(name: "HelveticaNeue-Bold", size: 13.0)
        youTabButton.textColor = UIColor.instagramBlack()
        youTabButton.textAlignment = .Center
        youTabButton.userInteractionEnabled = true
        
        highlightBar = UIView(frame: CGRectMake(0, followingTabButton.frame.maxY - 3, frame.width / 2, 3.0))
        highlightBar.backgroundColor = UIColor.highlightBlue()
        
        super.init(frame: frame)
        
        followingTapRecognizer = UITapGestureRecognizer(target: self, action: "followingTapped")
        youTapRecognizer = UITapGestureRecognizer(target: self, action: "youTapped")
        
        followingTabButton.addGestureRecognizer(followingTapRecognizer!)
        youTabButton.addGestureRecognizer(youTapRecognizer!)
        
        backgroundColor = UIColor.whiteColor()
        layer.borderColor = UIColor.lightGrey().CGColor
        layer.borderWidth = 1.0
        
        addSubview(followingTabButton)
        addSubview(youTabButton)
        addSubview(highlightBar)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func followingTapped() {
        followingTabButton.textColor = UIColor.highlightBlue()
        youTabButton.textColor = UIColor.instagramBlack()
        viewDidScroll(0.0)
        delegate?.followingTapped()
    }
    
    func youTapped() {
        followingTabButton.textColor = UIColor.instagramBlack()
        youTabButton.textColor = UIColor.highlightBlue()
        viewDidScroll(frame.width)
        delegate?.youTapped()
    }
    
    func viewDidScroll(offsetX: CGFloat) {
        if (offsetX / 2) >= frame.width / 4 {
            followingTabButton.textColor = UIColor.instagramBlack()
            youTabButton.textColor = UIColor.highlightBlue()
        } else {
            followingTabButton.textColor = UIColor.highlightBlue()
            youTabButton.textColor = UIColor.instagramBlack()
        }
        
        UIView.animateWithDuration(0.4, animations: {
            self.highlightBar.frame.origin.x = offsetX / 2
        })
    }
}

protocol TabViewDelegate {
    func followingTapped()
    func youTapped()
}

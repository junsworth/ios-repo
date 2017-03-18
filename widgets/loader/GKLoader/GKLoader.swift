//
//  GKLoader.swift
//  GKLoader
//
//  Created by Jonathan Unsworth on 2017/03/16.
//  Copyright © 2017 Global Kinetic. All rights reserved.
//

import UIKit
import Foundation

class GKLoader: UIView {
    
    var labelTitle: UILabel = UILabel()
    var labelDescription: UILabel = UILabel()
    public var progressView: GKLogoAnimation = GKLogoAnimation.init()
    
    // MARK: Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: Initialize a loader
    convenience public init (title: String, description: String, image: UIImage) {
        self.init(frame: CGRect(x: 0, y: 0, width: 250, height: 100))
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.red
        //self.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // label title
        self.labelTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        self.labelTitle.backgroundColor = UIColor.clear
        self.labelTitle.textColor = UIColor.black
        
        let myMutableString:NSMutableAttributedString = NSMutableAttributedString(
            string: title,
            attributes: [NSFontAttributeName:UIFont(
                name: "Georgia",
                size: 18.0)!])
        
        self.labelTitle.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        self.labelTitle.attributedText = myMutableString
        self.labelTitle.text = title
        
        // label description
        self.labelDescription = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
        self.labelDescription.backgroundColor = UIColor.clear
        self.labelDescription.textColor = UIColor.black
        
        self.labelDescription.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        self.labelDescription.attributedText = myMutableString
        self.labelDescription.text = description
        
        // progress view
        self.progressView = GKLogoAnimation.init(image: image)
        
    }
    
    override public func draw(_ rect: CGRect) {
        self.addSubview(self.labelTitle)
        self.addSubview(self.labelDescription)
        self.addSubview(self.progressView)
        
        // constraints title
        let centerXTitle = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.labelTitle, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        //let centerYTitle = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.labelTitle, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        let titleAboveProgressView = NSLayoutConstraint(item: self.progressView, attribute: NSLayoutAttribute.topMargin, relatedBy: NSLayoutRelation.equal, toItem: self.labelTitle, attribute: NSLayoutAttribute.bottomMargin, multiplier: 1, constant: 20)
        
        self.labelTitle.translatesAutoresizingMaskIntoConstraints = false
        //self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([centerXTitle, titleAboveProgressView])
        
        // constraints description
        let centerXDescription = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.labelDescription, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
//        let centerYDescription = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.labelDescription, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: self.progressView.frame.size.height/2 + 10)
        
        let descBelowProgressView = NSLayoutConstraint(item: self.progressView, attribute: NSLayoutAttribute.bottomMargin, relatedBy: NSLayoutRelation.equal, toItem: self.labelDescription, attribute: NSLayoutAttribute.topMargin, multiplier: 1, constant: -60)
        
        self.labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        self.addConstraints([centerXDescription, descBelowProgressView])
        
        // constriaints - progress view
        let centerXProgressView = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self.progressView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant:self.progressView.frame.size.width/2)
        
        let centerYProgressive = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self.progressView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: self.progressView.frame.size.height/2)
        
        
        self.progressView.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints([centerXProgressView, centerYProgressive])
    }
    
    public func show() {
        
        if let window = UIApplication.shared.keyWindow {
            
            window.addSubview(self)
            
            // constraints title
            //let height = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: window, attribute: NSLayoutAttribute.height, multiplier: 1, constant: -450)
            
            //let width = NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: window, attribute: NSLayoutAttribute.width, multiplier: 1, constant: -150)
            
            //let centerX = NSLayoutConstraint(item: window, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
            
            //let centerY = NSLayoutConstraint(item: window, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
            
            //window.addConstraints([centerX, centerY])
            
            //window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[contentView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["contentView":self]))
            window.translatesAutoresizingMaskIntoConstraints = false
            //window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[loaderScreen]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["loaderScreen":self]))
            //window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[window]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: ["window":window, "loaderScreen":self]))
            //window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[window]", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: ["window":window, "loaderScreen":self]))
            //window.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[loaderScreen]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: [:], views: ["loaderScreen":self]))
            
            //window.addConstraints([centerX, centerY])
            
            self.center = window.center

            
        }
        
    }
    
    public func hide() {
        
        progressView.stopAnimating()
        
        self.removeFromSuperview()
    }
    
}

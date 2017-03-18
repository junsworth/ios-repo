//
//  GKLogoAnimation.swift
//  GKLoader
//
//  Created by Jonathan Unsworth on 2017/03/16.
//  Copyright © 2017 Global Kinetic. All rights reserved.
//

import UIKit

class GKLogoAnimation: UIView {
    
    let progressIndicator = GKCircularProgress()    
    var logoImageView: UIImageView = UIImageView()
    
    // MARK: Initialization
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience public init ( image: UIImage) {
        self.init(frame: CGRect.init(x: 0, y: 0, width: 40, height: 40))
        //self.frame = CGRect.init(x: 0, y: 0, width: self.progressIndicator.frame.width, height: self.progressIndicator.frame.height)
        
        self.backgroundColor = UIColor.green
        
        // MARK: logo UIImageView
        self.logoImageView = UIImageView(image:image)
        self.logoImageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height)
        self.logoImageView.center = self.center
        
    }
    
    override public func draw(_ rect: CGRect) {
        
        progressIndicator.thicknessRatio = 0.17
        progressIndicator.progressTintColor = UIColor.blue
        progressIndicator.roundedCorners = true
        progressIndicator.indeterminateDuration = 0.7
        progressIndicator.enableIndeterminate()
        
        progressIndicator.updateProgress(0.7, animated: true, initialDelay: 0.2, duration: 1, completion: {
            
            
        })
        
        self.addSubview(self.progressIndicator)
        self.addSubview(self.logoImageView)
        
    }
    
    public func stopAnimating() {
        
        progressIndicator.updateProgress(1)
        
    }
    
}

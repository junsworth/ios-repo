//
//  GKLoaderController.swift
//  GKLoader
//
//  Created by Jonathan Unsworth on 2017/03/18.
//  Copyright © 2017 Global Kinetic. All rights reserved.
//

import UIKit
import Foundation

// MARK: GKLoaderController controls a loader for display
class GKLoaderController {
    
    // MARK: GKLoader
    internal var loader: GKLoader? = GKLoader.init()
    
    static let sharedInstance = GKLoaderController()
    private init(){} // This prevents others from using the default '()' initializer for this class.
}

// MARK: set loader display
extension GKLoaderController {
    public func setDisplay( title: String, description: String, image: UIImage) {
        loader = GKLoader.init(title: title, description: description, image: image)
    }
}

// MARK: show loader
extension GKLoaderController {
    public func show() {
        if loader != nil {
            loader?.show()
        }
    }
}

// MARK: hide loader
extension GKLoaderController {
    public func hide() {
        if loader != nil {
            loader?.hide()
        }
    }
}

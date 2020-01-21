//
//  AppDelegate.swift
//  Test Window View
//
//  Created by Robert Pugh on 2020-01-21.
//  Copyright © 2020 Robert Pugh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
    var overlayWindow: UIWindow?
}

extension AppDelegate {
    func showOverlayWindow(onTopOf controller: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.tintColor = UIApplication.shared.windows.first?.tintColor
        window.windowLevel = UIWindow.Level.statusBar
        
        window.isHidden = false
        
        let overlayViewController = controller.storyboard!.instantiateViewController(identifier: "Overlay") as! OverlayViewController
        overlayViewController.onDismiss = { [weak self] in
            self?.overlayWindow = nil
        }
        
        overlayViewController.modalPresentationStyle = .overFullScreen
        overlayViewController.controllerToInheritFrom = controller
        
        window.rootViewController = overlayViewController
        
        overlayWindow = window
    }
}

extension UIApplication {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

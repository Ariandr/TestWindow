//
//  MainViewController.swift
//  Test Window View
//
//  Created by Robert Pugh on 2020-01-21.
//  Copyright © 2020 Robert Pugh. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
	
	static let styles: [UIStatusBarStyle] = [.darkContent, .lightContent]
	
	var styleIndex = 0
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
        if presentingViewController != nil {
            return .lightContent
        }
		return Self.styles[styleIndex % Self.styles.count]
	}
	
	private func updateStyle() {
		styleIndex += 1
		
		setNeedsStatusBarAppearanceUpdate()
	}
	
	private var timer: Timer?
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		if timer == nil {
            timer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: true) { _ in
				self.updateStyle()
			}
		}
		
		modalPresentationCapturesStatusBarAppearance = true
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		if let timer = timer {
			timer.invalidate()
			self.timer = nil
		}
	}
	
	@IBAction func showOverlayWindow() {
        UIApplication.shared.appDelegate.showOverlayWindow(onTopOf: self)
	}
}


//
//  OverlayViewController.swift
//  Test Window View
//
//  Created by Robert Pugh on 2020-01-21.
//  Copyright © 2020 Robert Pugh. All rights reserved.
//

import UIKit

final class OverlayViewController: UIViewController {
	
	var controllerToInheritFrom: UIViewController?
	
	override var childForStatusBarStyle: UIViewController? {
		return controllerToInheritFrom
	}
	
	override var childForStatusBarHidden: UIViewController? {
		return controllerToInheritFrom
	}
	
	var onDismiss: (() -> ())?
	
	@IBAction func dismiss() {
		onDismiss?()
	}
	
}

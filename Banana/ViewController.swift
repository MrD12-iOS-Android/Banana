//
//  ViewController.swift
//  Banana
//
//  Created by Oybek Iskandarov on 4/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var views: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        views.layer.cornerRadius = 30
        views.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }


}


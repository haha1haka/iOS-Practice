//
//  RealMainViewController.swift
//  VCTransition
//
//  Created by HWAKSEONG KIM on 2022/07/29.
//

import UIKit

class RealMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func resetUserdefaults(_ sender: UIButton) {
        
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key.description)
        }

    }

}

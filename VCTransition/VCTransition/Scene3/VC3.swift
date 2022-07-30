//
//  VC3.swift
//  VCTransition
//
//  Created by HWAKSEONG KIM on 2022/07/30.
//

import UIKit

class VC3: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "데이터전달", style: .plain, target: self, action: #selector(datapass))
    }
    
    
    @objc func datapass() {
        
        guard let vc2 = self.navigationController?.viewControllers[1] as? VC2 else { return }
        vc2.fromVc3 = textField.text ?? ""
        self.navigationController?.popViewController(animated: true)
        
    }

}

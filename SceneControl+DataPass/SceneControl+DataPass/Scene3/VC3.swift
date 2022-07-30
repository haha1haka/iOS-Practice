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
        
        
        //직접 동기식으로 데이터 전달
//        guard let vc2 = self.navigationController?.viewControllers[1] as? VC2 else { return }
//        vc2.fromVc3 = textField.text ?? ""
//        self.navigationController?.popViewController(animated: true)
        
        // 비동기식 Userdefault 이용한 데이터 전달
        UserDefaults.standard.set(textField.text ?? "", forKey: "textfieldname")
        self.navigationController?.popViewController(animated: true)
        
    }

}

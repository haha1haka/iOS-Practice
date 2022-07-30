//
//  VC1.swift
//  VCTransition
//
//  Created by HWAKSEONG KIM on 2022/07/30.
//

import UIKit

class VC1: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func tappedNextButton(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main3", bundle: nil)
        let vc2 = sb.instantiateViewController(withIdentifier: "VC2") as! VC2
        
        vc2.fromVc1 = "VC1 에서 보냄 : \(textField.text ?? "")" // 전달은 쉬움.
        
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    

}

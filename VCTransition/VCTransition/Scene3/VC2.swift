//
//  VC2.swift
//  VCTransition
//
//  Created by HWAKSEONG KIM on 2022/07/30.
//

import UIKit

class VC2: UIViewController {
    
    @IBOutlet weak var fromvc1label: UILabel!
    @IBOutlet weak var fromvc3label: UILabel!
    
    var fromVc1: String?
    var fromVc3: String?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromvc1label.text = fromVc1
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        fromvc3label.text = "VC3에서 보냄 : \(fromVc3 ?? "@@") 입니다."
    }


    @IBAction func tappedNextButton(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main3", bundle: nil)
        let vc3 = sb.instantiateViewController(withIdentifier: "VC3") as! VC3
        self.navigationController?.pushViewController(vc3, animated: true)
    }


}

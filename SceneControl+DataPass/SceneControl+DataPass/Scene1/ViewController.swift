//
//  ViewController.swift
//  VCTransition
//
//  Created by HWAKSEONG KIM on 2022/07/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func present(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PresentViewController")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func push(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "NaviViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    

}


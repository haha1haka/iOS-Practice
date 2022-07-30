//
//  ViewController.swift
//  Keyboard
//
//  Created by HWAKSEONG KIM on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var writeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        writeButton.setTitle("글쓰기", for: .normal)
    }
    
    
    @IBAction func tappedWriteButton(_ sender: UIButton) {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
            writeButton.setTitle("글쓰기", for: .normal)
        } else {
            textField.becomeFirstResponder()
            writeButton.setTitle("완료", for: .normal)
        }
    }
}


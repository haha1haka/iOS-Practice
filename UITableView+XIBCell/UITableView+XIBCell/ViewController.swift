//
//  ViewController.swift
//  UITableView+XIBCell
//
//  Created by HWAKSEONG KIM on 2022/07/28.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var leftTableView: UITableView!
    
    @IBOutlet weak var rightTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftTableView.delegate = self
        leftTableView.dataSource = self
        
        rightTableView.delegate = self
        rightTableView.dataSource = self
        
        leftTableView.register(UINib(nibName: FirstTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: FirstTableViewCell.identifier)
        rightTableView.register(UINib(nibName: SecondTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SecondTableViewCell.identifier)
        
        
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == leftTableView {
            return 20
        } else {
            return 20
        }
            
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == leftTableView {
            guard let leftCell = leftTableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as? FirstTableViewCell else { return UITableViewCell() }
            
            leftCell.label.text = "왼쪽 테이블뷰 셀"
            leftCell.backgroundColor = .systemPink
            return leftCell
        } else {
            guard let rightCell = rightTableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as? SecondTableViewCell else { return UITableViewCell() }
            
            rightCell.label.text = "오른쪽 테이블뷰 셀"
            rightCell.backgroundColor = .systemYellow
            return rightCell
        }
        
        
    }
    
    
}

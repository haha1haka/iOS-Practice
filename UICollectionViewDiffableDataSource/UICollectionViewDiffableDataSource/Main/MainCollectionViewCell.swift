//
//  MainCollectionViewCell.swift
//  UICollectionViewDiffableDataSource
//
//  Created by HWAKSEONG KIM on 2022/09/08.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    let label: UILabel = {
        let view = UILabel()
        view.text = "안녕하세요"
        view.backgroundColor = .red
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.addSubview(label)
        
    }
    
    func setConstraints() {
        label.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(self).inset(5)
        }
    }
    
    
}

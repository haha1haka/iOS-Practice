//
//  TopicCell.swift
//  UICollectionViewDiffableDataSource
//
//  Created by HWAKSEONG KIM on 2022/09/08.
//

import UIKit

class TopicCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
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
        self.addSubview(titleLabel)
        
    }
    
    func setConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(self).inset(5)
        }
    }
    func configureCell(itemIdentifier: String) {
        titleLabel.text = itemIdentifier
    }
    
}

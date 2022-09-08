//
//  MainView.swift
//  UICollectionViewDiffableDataSource
//
//  Created by HWAKSEONG KIM on 2022/09/08.
//

import UIKit
import SnapKit

class MainView: BaseView {
    
    lazy var collectionView: UICollectionView = {
        let layout = configureComposistionalLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .blue
        return view
    }()

    
    func configureComposistionalLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
      
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(66))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
      
        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    
//    func configureCollectionViewLayout() -> UICollectionViewLayout {
//        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .estimated(128), heightDimension: .fractionalHeight(1.0))
//        let itemLayout = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
//
//
//        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .estimated(128), heightDimension: .absolute(44))
//        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [itemLayout])
//
//        let sectionLayout = NSCollectionLayoutSection(group: groupLayout)
//        sectionLayout.orthogonalScrollingBehavior = .continuous
//        sectionLayout.contentInsets.leading = 16
//        sectionLayout.contentInsets.trailing = 16
//        sectionLayout.interGroupSpacing = 16
//        return UICollectionViewCompositionalLayout(section: sectionLayout)
//    }
    
    
    
    
    override func configure() {
        self.addSubview(collectionView)
    }
    
    
    override func setConstraints() {
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(self)
        }

    }
}






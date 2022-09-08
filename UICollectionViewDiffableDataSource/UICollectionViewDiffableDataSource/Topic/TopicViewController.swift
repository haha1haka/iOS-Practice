//
//  TopicViewController.swift
//  UICollectionViewDiffableDataSource
//
//  Created by HWAKSEONG KIM on 2022/09/08.
//

import UIKit
import SnapKit

class TopicViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
        view.alwaysBounceVertical = false
        view.backgroundColor = .red
        return view
    }()
    
    var collectionViewDataSource: UICollectionViewDiffableDataSource<String, String>!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view)
            $0.height.equalTo(100)
        }
        
        
        configureCollectionViewDataSource()
        
        
        var snapshot = collectionViewDataSource.snapshot()
        snapshot.appendSections(["topic"])
        snapshot.appendItems([
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월"], toSection: "topic")
        
        collectionViewDataSource.apply(snapshot) { [weak self] in // apply : UI Update 관련한걸 reflect 한다.
            guard let this = self else { return }
            this.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        }
        
    }
    
    func configureCollectionViewDataSource() {
        
        let topicCellRegistration = UICollectionView.CellRegistration<TopicCell, String> { cell,indexPath,itemIdentifier in
            cell.configureCell(itemIdentifier: itemIdentifier)
        }
        
    
        
        
        collectionViewDataSource = .init(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: topicCellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        }
    }
    
    
    func configureCollectionViewLayout() -> UICollectionViewLayout {
        let itemLayoutSize = NSCollectionLayoutSize(widthDimension: .estimated(128), heightDimension: .fractionalHeight(1.0))
        let itemLayout = NSCollectionLayoutItem(layoutSize: itemLayoutSize)
        
        
        let groupLayoutSize = NSCollectionLayoutSize(widthDimension: .estimated(128), heightDimension: .absolute(44))
        let groupLayout = NSCollectionLayoutGroup.horizontal(layoutSize: groupLayoutSize, subitems: [itemLayout])
        
        let sectionLayout = NSCollectionLayoutSection(group: groupLayout)
        sectionLayout.orthogonalScrollingBehavior = .continuous
        sectionLayout.contentInsets.leading = 16
        sectionLayout.contentInsets.trailing = 16
        sectionLayout.interGroupSpacing = 16
        return UICollectionViewCompositionalLayout(section: sectionLayout)
    }
}




//// 상단 왼쪽 셀
//let leadingSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(100))
//let leadingItem = NSCollectionLayoutItem(layoutSize: leadingSize)
//
//// 상단 오른쪽 셀
//let trailingSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
//// absolute가 먹히질않는 이슈가있음.. 고정되지않고 group의 크기에 맞게 늘어남
//let trailingItem = NSCollectionLayoutItem(layoutSize: trailingSize)
//
//
//let trailingGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7), heightDimension: .fractionalHeight(0.5))
//let trailingGroup = NSCollectionLayoutGroup.vertical(layoutSize: trailingGroupSize, subitem: trailingItem, count: 3)
//
//// 상단 그룹
//let topGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
//let topGroup = NSCollectionLayoutGroup.horizontal(layoutSize: topGroupSize, subitems: [leadingItem, trailingGroup])
//
//
//
//
//
//
//
//let bottomSmallItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.3))
//let bottomSmallItem = NSCollectionLayoutItem(layoutSize: bottomSmallItemSize)
//
//let bottomBigItemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.7))
//let bottomBigItem = NSCollectionLayoutItem(layoutSize: bottomBigItemSize)
//
//let bottomGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5))
//let bottomGroup = NSCollectionLayoutGroup.vertical(layoutSize: bottomGroupSize,
//                                                   subitems: [bottomSmallItem, bottomBigItem])
//
//
//
//
//
//
//
//let containerGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
//                                                heightDimension: .fractionalHeight(1))
//let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: containerGroupSize,
//                                                      subitems: [topGroup, bottomGroup])
//let section = NSCollectionLayoutSection(group: containerGroup)
//section.orthogonalScrollingBehavior = .continuous

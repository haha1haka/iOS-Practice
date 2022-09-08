//
//  ViewController.swift
//  UICollectionViewDiffableDataSource
//
//  Created by HWAKSEONG KIM on 2022/09/08.
//

import UIKit
import SnapKit


enum Section: CaseIterable {
    case main
}

class MainViewController: BaseViewController {
    
    let mainView = MainView()
    
    override func loadView() {
        self.view = mainView
    }
    
    var collectionViewDataSource: UICollectionViewDiffableDataSource<String, String>!
    
    override func configure() {
        apply()
    }
}



extension MainViewController {
    func apply() {
        mainView.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        configureCollectionViewDataSource()
        
        var snapshot = self.collectionViewDataSource.snapshot()
        snapshot.appendSections(["topic"])
        snapshot.appendItems(["1월","2월","3월","4월","5월","6월","7월"], toSection: "topic")
        
        self.collectionViewDataSource.apply(snapshot) { [weak self] in // apply : UI Update 관련한걸 reflect 한다.
            guard let this = self else { return }
            this.mainView.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: false, scrollPosition: [])
        }
    }
}






extension MainViewController {
    func configureCollectionViewDataSource() {
        
        let topicCellRegistration = UICollectionView.CellRegistration<TopicCell, String> { cell,indexPath,itemIdentifier in
            cell.configureCell(itemIdentifier: itemIdentifier)
            cell.backgroundColor = .yellow
        }
        
        self.collectionViewDataSource = .init(collectionView: mainView.collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: topicCellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        }
    }

       
    
}






extension MainViewController {
    func configureCollectionViewLayout() {
        
    }
    
    
}

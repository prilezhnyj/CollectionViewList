//
//  ViewController.swift
//  CollectionViewList
//
//  Created by Максим Боталов on 05.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, User>?
    
    private let users = User.getData()
    
    private let collectionViewList: UICollectionView = {
        let configurator = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configurator)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        getData(with: users)
    }
    
    func getData(with users: [User]) {
        var snp = NSDiffableDataSourceSnapshot<Section, User>()
        snp.appendSections([Section.main])
        snp.appendItems(users, toSection: .main)
        dataSource?.apply(snp)
    }
    
    private func setupCollectionView() {
        let registration = UICollectionView.CellRegistration<UICollectionViewListCell, User> { cell, indexPath, user in
            var content = cell.defaultContentConfiguration()
            content.text = user.title
            cell.contentConfiguration = content
        }
        
        dataSource = UICollectionViewDiffableDataSource<Section, User>(collectionView: collectionViewList) {
            collectionView, indexPath, user in {
                
                collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: user)
                
            }()
        }
        
        view.addSubview(collectionViewList)
        NSLayoutConstraint.activate([
            collectionViewList.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionViewList.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionViewList.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionViewList.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}


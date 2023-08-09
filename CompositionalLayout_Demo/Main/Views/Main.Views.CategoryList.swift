//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main.Views {
    final class CategoryList: UICollectionView {
        weak var weakModel: Main.Models.DisplayModel?
        
        var categories: [Main.Models.DisplayData] {
            weakModel?.categories ?? []
        }
        
        init() {
            super.init(frame: .zero, collectionViewLayout: .init())
            setupSelf()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

extension Main.Views.CategoryList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Main.Views.CategoryCell
        let category = categories[indexPath.row]
        cell.reloadUI(category: category)
        return cell
    }
}

// MARK: - Public Functions

extension Main.Views.CategoryList {
    func reloadUI(model: Main.Models.DisplayModel) {
        self.weakModel = model
        reloadData()
    }
}

// MARK: - Private Functions

private extension Main.Views.CategoryList {
    func setupSelf() {
        let layout = makeLayout()
        collectionViewLayout.invalidateLayout()
        setCollectionViewLayout(layout, animated: false)
        register(Main.Views.CategoryCell.self, forCellWithReuseIdentifier: "Cell")
        dataSource = self
    }
    
    func makeLayout() -> UICollectionViewCompositionalLayout {
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        configure.scrollDirection = .horizontal
        
        return .init(sectionProvider: { _, _ in
            let size = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, repeatingSubitem: item, count: 1)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
            section.interGroupSpacing = 10
            return section
        }, configuration: configure)
    }
}

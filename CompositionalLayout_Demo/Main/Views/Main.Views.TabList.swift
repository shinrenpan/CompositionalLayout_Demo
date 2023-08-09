//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main.Views {
    final class TabList: UICollectionView {
        weak var weakModel: Main.Models.DisplayModel?
        
        var tabs: [Main.Models.DisplayData] {
            weakModel?.tabs ?? []
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

extension Main.Views.TabList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tabs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Main.Views.TabCell
        let tab = tabs[indexPath.row]
        cell.reloadUI(tab: tab)
        return cell
    }
}

// MARK: - Public Functions

extension Main.Views.TabList {
    func reloadUI(model: Main.Models.DisplayModel) {
        self.weakModel = model
        let layout = makeLayout(count: tabs.count)
        collectionViewLayout.invalidateLayout()
        setCollectionViewLayout(layout, animated: false)
        reloadData()
    }
}

// MARK: - Private Functions

private extension Main.Views.TabList {
    func setupSelf() {
        isScrollEnabled = false
        register(Main.Views.TabCell.self, forCellWithReuseIdentifier: "Cell")
        dataSource = self
    }
    
    func makeLayout(count: Int) -> UICollectionViewCompositionalLayout {
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        configure.scrollDirection = .horizontal
        
        return .init(sectionProvider: { _, env in
            let width = env.container.contentSize.width / CGFloat(count)
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            return .init(group: group)
        }, configuration: configure)
    }
}

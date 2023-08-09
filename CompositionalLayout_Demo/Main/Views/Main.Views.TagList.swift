//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main.Views {
    final class TagList: UICollectionView {
        weak var weakModel: Main.Models.DisplayModel?
        
        var tags: [Main.Models.DisplayData] {
            weakModel?.tags ?? []
        }
        
        // override contentSize, layoutSubviews, intrinsicContentSize
        // 達到 UICollectionView Dynamic height
        
        override var contentSize: CGSize {
            didSet {
                if oldValue.height != self.contentSize.height {
                    invalidateIntrinsicContentSize()
                }
            }
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            invalidateIntrinsicContentSize()
        }
        
        override var intrinsicContentSize: CGSize {
            let height = contentSize.height > 0 ? contentSize.height : 1
            return CGSize(width: 1, height: height)
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

extension Main.Views.TagList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Main.Views.TagCell
        let tag = tags[indexPath.row]
        cell.reloadUI(tag: tag)
        return cell
    }
}

// MARK: - Public Functions

extension Main.Views.TagList {
    func reloadUI(model: Main.Models.DisplayModel) {
        self.weakModel = model
        reloadData()
    }
}

// MARK: - Private Functions

private extension Main.Views.TagList {
    func setupSelf() {
        isScrollEnabled = false
        
        let layout = makeLayout()
        collectionViewLayout.invalidateLayout()
        setCollectionViewLayout(layout, animated: false)
        
        register(Main.Views.TagCell.self, forCellWithReuseIdentifier: "Cell")
        dataSource = self
    }
    
    func makeLayout() -> UICollectionViewCompositionalLayout {
        let configure = UICollectionViewCompositionalLayoutConfiguration()
        configure.scrollDirection = .vertical
        
        return .init(sectionProvider: { _, _ in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(44))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(10)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 8, leading: 8, bottom: 8, trailing: 8)
            section.interGroupSpacing = 10
            return section
        }, configuration: configure)
    }
}

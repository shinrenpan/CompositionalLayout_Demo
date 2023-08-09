//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main.Views {
    final class TabCell: UICollectionViewCell {
        lazy var label = makeLabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = .clear
            addLabel()
        }
        
        override var isSelected: Bool {
            didSet {
                label.textColor = isSelected ? .white : .darkText
                label.backgroundColor = isSelected ? .darkGray: .white
            }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

// MARK: - Public Functions

extension Main.Views.TabCell {
    func reloadUI(tab: Main.Models.DisplayData) {
        label.text = tab.title
    }
}

// MARK: - Private Functions

private extension Main.Views.TabCell {
    func addLabel() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func makeLabel() -> UILabel {
        let result = UILabel(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .white
        result.textAlignment = .center
        result.textColor = .darkText
        result.clipsToBounds = true
        result.layer.cornerRadius = 20
        result.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return result
    }
}

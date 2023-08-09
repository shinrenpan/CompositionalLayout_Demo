//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main.Views {
    final class TagCell: UICollectionViewCell {
        lazy var label = makeLabel()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.clipsToBounds = true
            contentView.layer.cornerRadius = 10
            contentView.layer.borderWidth = 1
            contentView.layer.borderColor = UIColor.lightGray.cgColor
            addLabel()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
}

// MARK: - Public Functions

extension Main.Views.TagCell {
    func reloadUI(tag: Main.Models.DisplayData) {
        label.text = tag.title
    }
}

// MARK: - Private Functions

private extension Main.Views.TagCell {
    func addLabel() {
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func makeLabel() -> UILabel {
        let result = UILabel(frame: .zero)
        result.translatesAutoresizingMaskIntoConstraints = false
        result.textAlignment = .center
        result.textColor = .systemBlue
        return result
    }
}

//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main {
    final class VO {
        lazy var mainView = makeMainView()
        lazy var categoryList = makeCategoryList()
        lazy var tabList = makeTabList()
        lazy var tagList = makeTagList()
        
        init() {
            addCategoryList()
            addTabList()
            addTagList()
        }
    }
}

// MARK: - Reload Somethig

extension Main.VO {
    func reloadUI(model: Main.Models.DisplayModel) {
        categoryList.reloadUI(model: model)
        tabList.reloadUI(model: model)
        tagList.reloadUI(model: model)
    }
}

// MARK: - Add Something

private extension Main.VO {
    func addCategoryList() {
        mainView.addSubview(categoryList)
        
        NSLayoutConstraint.activate([
            categoryList.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor),
            categoryList.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            categoryList.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            categoryList.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    func addTabList() {
        mainView.addSubview(tabList)
        
        NSLayoutConstraint.activate([
            tabList.topAnchor.constraint(equalTo: categoryList.bottomAnchor, constant: 20),
            tabList.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            tabList.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            tabList.heightAnchor.constraint(equalToConstant: 66),
        ])
    }
    
    func addTagList() {
        mainView.addSubview(tagList)
        
        NSLayoutConstraint.activate([
            tagList.topAnchor.constraint(equalTo: tabList.bottomAnchor, constant: 20),
            tagList.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            tagList.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
        ])
    }
}

// MARK: - Make Something

private extension Main.VO {
    func makeMainView() -> UIView {
        let result = UIView(frame: .zero)
        result.backgroundColor = .white
        return result
    }
    
    func makeCategoryList() -> Main.Views.CategoryList {
        let result = Main.Views.CategoryList()
        result.translatesAutoresizingMaskIntoConstraints = false
        return result
    }
    
    func makeTabList() -> Main.Views.TabList {
        let result = Main.Views.TabList()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .lightGray
        return result
    }
    
    func makeTagList() -> Main.Views.TagList {
        let result = Main.Views.TagList()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.backgroundColor = .init(white: 0, alpha: 0.1)
        return result
    }
}

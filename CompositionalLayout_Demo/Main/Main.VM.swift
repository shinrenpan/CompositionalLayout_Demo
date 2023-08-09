//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension Main {
    final class VM {
        @Published var state = Main.Models.State.none
        let displayModel = Main.Models.DisplayModel()
    }
}

// MARK: - Do Action

extension Main.VM {
    func doAction(_ action: Main.Models.Action) {
        switch action {
        case .loadData:
            actionLoadData()
        }
    }
}

// MARK: - Handle Action

private extension Main.VM {
    func actionLoadData() {
        displayModel.categories = makeCategories()
        displayModel.tabs = makeTabs()
        displayModel.tags = makeTags()
        
        state = .loadedData
    }
}

// MARK: - Response Action

private extension Main.VM {}

// MARK: - Convert Something

private extension Main.VM {}

// MARK: - Make Something

private extension Main.VM {
    func makeCategories() -> [Main.Models.DisplayData] {
        return [
            .init(title: "校園"),
            .init(title: "科幻/奇幻/玄幻"),
            .init(title: "武俠/格鬥"),
            .init(title: "大女主"),
            .init(title: "後宮"),
            .init(title: "推理/懸疑"),
        ]
    }
    
    func makeTabs() -> [Main.Models.DisplayData] {
        return [
            .init(title: "中文"),
            .init(title: "日本"),
            .init(title: "韓國"),
            .init(title: "其他國家")
        ]
    }
    
    func makeTags() -> [Main.Models.DisplayData] {
        return [
            .init(title: "#史萊姆"),
            .init(title: "#穿越"),
            .init(title: "#異世界"),
            .init(title: "#💩萊姆"),
            .init(title: "#穿越個屁"),
            .init(title: "#沒有異世界"),
            .init(title: "#關於我轉生變成史萊姆這檔事"),
            .init(title: "#日本漫畫"),
        ]
    }
}

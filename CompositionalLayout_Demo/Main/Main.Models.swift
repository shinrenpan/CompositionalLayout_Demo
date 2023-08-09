//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import UIKit

extension Main {
    enum Models {}
}

// MARK: - Action

extension Main.Models {
    enum Action {
        case loadData
    }
}

// MARK: - State

extension Main.Models {
    enum State {
        case none
        case loadedData
    }
}

// MARK: - Display Model

extension Main.Models {
    final class DisplayModel {
        var categories: [DisplayData] = []
        var tabs: [DisplayData] = []
        var tags: [DisplayData] = []
    }
    
    struct DisplayData {
        let title: String
    }
}

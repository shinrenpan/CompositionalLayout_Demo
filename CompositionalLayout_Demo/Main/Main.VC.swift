//
//  Copyright (c) 2023 shinren.pan@gmail.com All rights reserved.
//

import Combine
import UIKit

extension Main {
    final class VC: UIViewController {
        var vo = Main.VO()
        var vm = Main.VM()
        var router = Main.Router()
        var binding = Set<AnyCancellable>()
        
        override func loadView() {
            self.view = vo.mainView
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupSelf()
            setupBinding()
            setupVO()
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            vm.doAction(.loadData)
        }
    }
}

// MARK: - Setup Something

private extension Main.VC {
    func setupSelf() {
        router.vc = self
    }
    
    func setupBinding() {
        vm.$state.receive(on: DispatchQueue.main).sink { [weak self] state in
            switch state {
            case .none:
                self?.stateNone()
            case .loadedData:
                self?.stateLoadedData()
            }
        }.store(in: &binding)
    }
    
    func setupVO() {}
}

// MARK: - Handle State

private extension Main.VC {
    func stateNone() {}
    
    func stateLoadedData() {
        vo.reloadUI(model: vm.displayModel)
    }
}

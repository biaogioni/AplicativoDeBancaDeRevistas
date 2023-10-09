//
//  EncalheFactory.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 08/10/23.
//

import UIKit

struct EncalheFactory {
    static func make() -> EncalheViewController {
        let coordinator = EncalheCoordinator()
        let viewModel = EncalheViewModel(coordinator: coordinator)
        let viewController = EncalheViewController(viewModel: viewModel)
        
        return viewController
    }
}

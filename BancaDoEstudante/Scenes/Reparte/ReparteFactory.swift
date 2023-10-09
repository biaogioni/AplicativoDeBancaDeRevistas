//
//  ReparteFactory.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 27/08/23.
//

import UIKit

struct ReparteFactory {
    static func make() -> ReparteViewController {
        let coordinator = ReparteCoordinator()
        let viewModel = ReparteViewModel(coordinator: coordinator)
        let viewController = ReparteViewController(viewModel: viewModel)
        
        return viewController
    }
}

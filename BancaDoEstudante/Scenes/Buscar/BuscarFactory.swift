//
//  BuscarReparteFactory.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

struct BuscarFactory {
    static func make(navigationController: UINavigationController) -> BuscarViewController {
        let coordinator = BuscarCoordinator(navigationController: navigationController)
        let viewModel = BuscarViewModel(coordinator: coordinator)
        let viewController = BuscarViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}

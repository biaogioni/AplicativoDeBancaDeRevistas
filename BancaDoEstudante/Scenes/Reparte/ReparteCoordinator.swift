//
//  ReparteCoordinator.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/05/23.
//

import UIKit

protocol ReparteCoordinatorDelegate: AnyObject {
    func navigateToBuscar(navigationController: UINavigationController)
}

final class ReparteCoordinator: Coordinator {
    init() {
    }
}

extension ReparteCoordinator: ReparteCoordinatorDelegate {
    func navigateToBuscar(navigationController: UINavigationController) {
        let viewController = BuscarFactory.make(navigationController: navigationController)
        navigationController.pushViewController(viewController, animated: true)
    }
}

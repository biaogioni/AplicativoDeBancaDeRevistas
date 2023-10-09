//
//  EncalheCoordinator.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 08/10/23.
//

import UIKit

protocol EncalheCoordinatorDelegate: AnyObject {
    func navigateToBuscar(navigationController: UINavigationController)
}

final class EncalheCoordinator: Coordinator {
    init() {
    }
}

extension EncalheCoordinator: EncalheCoordinatorDelegate {
    func navigateToBuscar(navigationController: UINavigationController) {
        let viewController = BuscarFactory.make(navigationController: navigationController)
        navigationController.pushViewController(viewController, animated: true)
    }
}

//
//  BuscarReparteCoordinator.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

protocol BuscarCoordinatorDelegate: AnyObject {
    func navigateToLista(notas: [NotasEntradas])
}

final class BuscarCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension BuscarCoordinator: BuscarCoordinatorDelegate {
    func navigateToLista(notas: [NotasEntradas]) {
        let viewController = ListaDeTitulosFactory.make(
            navigationController: navigationController,
            notas: notas)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

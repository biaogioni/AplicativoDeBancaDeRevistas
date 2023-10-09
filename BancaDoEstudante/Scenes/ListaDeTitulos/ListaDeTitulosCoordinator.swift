//
//  ListaDeTitulosCoordinator.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

protocol ListaDeTitulosCoordinatorDelegate: AnyObject {
    func navigateToTitleDetails(nota: NotasEntradas)
}

final class ListaDeTitulosCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension ListaDeTitulosCoordinator: ListaDeTitulosCoordinatorDelegate {
    func navigateToTitleDetails(nota: NotasEntradas) {
        let viewController = TitleDetailFactory.make(
            navigationController: navigationController,
            nota: nota)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

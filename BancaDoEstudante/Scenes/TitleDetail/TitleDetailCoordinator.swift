//
//  TitleDetailCoordinator.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 23/09/23.
//

import UIKit

protocol TitleDetailCoordinatorDelegate: AnyObject {
    func navigateToEditTitle(nota: NotasEntradas)
    func navigateToListaDeTitulos(notas: [NotasEntradas])
}

final class TitleDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension TitleDetailCoordinator: TitleDetailCoordinatorDelegate {
    func navigateToEditTitle(nota: NotasEntradas) {
        let viewController = EditTitleFactory.make(
            navigationController: navigationController,
            nota: nota)
        self.navigationController.pushViewController(viewController, animated: true)
    }
    
    func navigateToListaDeTitulos(notas: [NotasEntradas]) {
        let viewController = ListaDeTitulosFactory.make(
            navigationController: navigationController,
            notas: notas)
        self.navigationController.pushViewController(viewController, animated: true)
    }
}

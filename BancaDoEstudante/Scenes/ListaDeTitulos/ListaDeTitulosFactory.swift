//
//  ListaDeTitulosFactory.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

struct ListaDeTitulosFactory {
    static func make(navigationController: UINavigationController, notas: [NotasEntradas]) -> ListaDeTitulosViewController {
        let coordinator = ListaDeTitulosCoordinator(navigationController: navigationController)
        let viewModel = ListaDeTitulosViewModel(coordinator: coordinator,
                                                notas: notas)
        let viewController = ListaDeTitulosViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}

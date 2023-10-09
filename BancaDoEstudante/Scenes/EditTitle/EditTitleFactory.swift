//
//  EditTitleFactory.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 24/09/23.
//

import UIKit

struct EditTitleFactory {
    static func make(navigationController: UINavigationController, nota: NotasEntradas) -> EditTitleViewController {
        let coordinator = EditTitleCoordinator(navigationController: navigationController)
        let viewModel = EditTitleViewModel(coordinator: coordinator, nota: nota)
        let viewController = EditTitleViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}

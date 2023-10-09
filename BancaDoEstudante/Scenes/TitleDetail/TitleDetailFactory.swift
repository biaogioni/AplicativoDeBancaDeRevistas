//
//  TitleDetailFactory.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 23/09/23.
//

import UIKit

struct TitleDetailFactory {
    static func make(navigationController: UINavigationController, nota: NotasEntradas) -> TitleDetailViewController {
        let coordinator = TitleDetailCoordinator(navigationController: navigationController)
        let viewModel = TitleDetailViewModel(coordinator: coordinator, nota: nota)
        let viewController = TitleDetailViewController(viewModel: viewModel)
        viewModel.viewController = viewController
        return viewController
    }
}

//
//  ReparteViewModel.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/05/23.
//

import UIKit

protocol ReparteViewModelDelegate: AnyObject {
    func navigateToBuscar(navigationController: UINavigationController?)
}

final class ReparteViewModel {
    private let coordinator: ReparteCoordinatorDelegate
    
    init(coordinator: ReparteCoordinatorDelegate) {
        self.coordinator = coordinator
    }
}

extension ReparteViewModel: ReparteViewModelDelegate {
    func navigateToBuscar(navigationController: UINavigationController?) {
        guard let navigationController else { return }
        coordinator.navigateToBuscar(navigationController: navigationController)
    }
}

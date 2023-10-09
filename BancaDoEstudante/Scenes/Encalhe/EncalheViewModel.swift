//
//  EncalheViewModel.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 08/10/23.
//

import UIKit

protocol EncalheViewModelDelegate: AnyObject {
    func navigateToBuscar(navigationController: UINavigationController?)
}

final class EncalheViewModel {
    private let coordinator: EncalheCoordinatorDelegate
    
    init(coordinator: EncalheCoordinatorDelegate) {
        self.coordinator = coordinator
    }
}

extension EncalheViewModel: EncalheViewModelDelegate {
    func navigateToBuscar(navigationController: UINavigationController?) {
        guard let navigationController else { return }
        coordinator.navigateToBuscar(navigationController: navigationController)
    }
}

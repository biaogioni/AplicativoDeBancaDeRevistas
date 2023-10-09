//
//  BuscarReparteViewModel.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import Foundation

protocol BuscarViewModelDelegate: AnyObject {
    func clickOnBuscar(_ data: FindEntrada)
}

final class BuscarViewModel {
    private let coordinator: BuscarCoordinatorDelegate
    weak var viewController: BuscarViewControllerDelegate?
    
    init(coordinator: BuscarCoordinatorDelegate) {
        self.coordinator = coordinator
    }
    
    func clickOnBuscar(_ data: FindEntrada) {
        Network().getNotasEntradas(data: data) { (result) in
            switch result {
            case .success(let result):
                guard let result else {
                    DispatchQueue.main.async {
                        self.viewController?.requestFailed()
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.coordinator.navigateToLista(notas: result)
                }
            case .failure:
                DispatchQueue.main.async {
                    self.viewController?.requestFailed()
                }
            }
        }
    }
}

extension BuscarViewModel: BuscarViewModelDelegate {
}

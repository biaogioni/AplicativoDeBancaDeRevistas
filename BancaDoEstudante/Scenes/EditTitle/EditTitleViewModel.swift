//
//  EditTitleViewModel.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 24/09/23.
//

import Foundation

protocol EditTitleViewModelDelegate: AnyObject {
    var tituloInfos: NotasEntradas { get }
    func clickOnEditar(_ data: NotasEntradas)
}

final class EditTitleViewModel {
    private let coordinator: EditTitleCoordinatorDelegate
    private var nota: NotasEntradas
    weak var viewController: EditTitleViewControllerDelegate?

    var tituloInfos: NotasEntradas {
        nota
    }
    
    init(coordinator: EditTitleCoordinatorDelegate,
         nota: NotasEntradas
    ) {
        self.coordinator = coordinator
        self.nota = nota
    }
}

extension EditTitleViewModel: EditTitleViewModelDelegate {
    func clickOnEditar(_ data: NotasEntradas) {
        Network().editNotaEntrada(nota: data) { (result) in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.coordinator.navigateBackToTitleDetail()
                }
            case .failure:
                self.viewController?.requestFailed()
            }
        }
    }
}

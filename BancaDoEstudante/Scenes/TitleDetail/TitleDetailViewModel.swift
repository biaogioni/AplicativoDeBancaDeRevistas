//
//  TitleDetailViewModel.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 23/09/23.
//

import Foundation

protocol TitleDetailViewModelDelegate: AnyObject {
    var tituloInfos: NotasEntradas { get }
    func navigateToEditTitle()
    func clickOnEntrada()
    func updateEntrada()
}

final class TitleDetailViewModel {
    private let coordinator: TitleDetailCoordinatorDelegate
    private var nota: NotasEntradas
    
    weak var viewController: TitleDetailViewControllerDelegate?
    
    var tituloInfos: NotasEntradas {
        nota
    }
    
    init(coordinator: TitleDetailCoordinatorDelegate,
         nota: NotasEntradas
    ) {
        self.coordinator = coordinator
        self.nota = nota
    }
    
    func clickOnEntrada() {
        Network().getNotasEntradas(entrada: nota.codigoEntrada) { (result) in
            switch result {
            case .success(let result):
                guard let result else {
                    DispatchQueue.main.async {
                        self.viewController?.requestFailed()
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.coordinator.navigateToListaDeTitulos(notas: result)
                }
            case .failure:
                DispatchQueue.main.async {
                    self.viewController?.requestFailed()
                }
            }
        }
    }
    
    func updateEntrada() {
        Network().getNotasEntradas(id: nota.id) { (result) in
            switch result {
            case .success(let result):
                guard let result else {
                    DispatchQueue.main.async {
                        self.viewController?.requestFailed()
                    }
                    return
                }
                DispatchQueue.main.async {
                    self.nota = result
                    self.viewController?.loadedView()
                }
            case .failure:
                DispatchQueue.main.async {
                    self.viewController?.requestFailed()
                }
            }
        }
    }
}

extension TitleDetailViewModel: TitleDetailViewModelDelegate {
    func navigateToEditTitle() {
        coordinator.navigateToEditTitle(nota: nota)
    }
}

//
//  EditTitleViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 24/09/23.
//

import UIKit

protocol EditTitleViewControllerDelegate: AnyObject {
    func requestFailed()
}

final class EditTitleViewController: UIViewController {
    private var editTitleView = EditTitleView(frame: .zero)
    private var viewModel: EditTitleViewModelDelegate
   
    override func loadView() {
        super.loadView()
        view = editTitleView
    }
    
    init(viewModel: EditTitleViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTitleView.setTextOnLabels(nota: viewModel.tituloInfos)
        editTitleView.buttonsDelegate = self
        self.title = "Editar titulo"
    }
}

extension EditTitleViewController: EditTitleViewControllerDelegate {
    func requestFailed() {
        let alert = UIAlertController(title: "Ops!", message: "A requisição falhou! Tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension EditTitleViewController: EditTitleViewDelegate {
    func editClicked(nota: NotasEntradas) {
        viewModel.clickOnEditar(nota)
    }
}


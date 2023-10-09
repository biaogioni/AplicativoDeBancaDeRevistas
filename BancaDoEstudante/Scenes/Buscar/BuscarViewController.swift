//
//  BuscarReparteViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

protocol BuscarViewControllerDelegate: AnyObject {
    func requestFailed()
}

final class BuscarViewController: UIViewController {
    private var buscarView = BuscarView(frame: .zero)
    private var viewModel: BuscarViewModelDelegate
   
    override func loadView() {
        super.loadView()
        view = buscarView
    }
    
    init(viewModel: BuscarViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buscarView.buttonsDelegate = self
        self.title = "Buscar"
    }
}

extension BuscarViewController: BuscarViewControllerDelegate {
    func requestFailed() {
        let alert = UIAlertController(title: "Ops!", message: "A requisição falhou! Tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension BuscarViewController: BuscarViewDelegate {
    func buscarClicked(data: FindEntrada) {
        viewModel.clickOnBuscar(data)
    }
}

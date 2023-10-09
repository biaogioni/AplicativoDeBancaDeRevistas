//
//  ReparteViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/05/23.
//

import UIKit

final class ReparteViewController: UIViewController {
    private var reparteView = ReparteView(frame: .zero)
    private var viewModel: ReparteViewModelDelegate
   
    override func loadView() {
        super.loadView()
        view = reparteView
    }
    
    init(viewModel: ReparteViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reparteView.buttonsDelegate = self        
        self.title = "Repartes"
    }
}

extension ReparteViewController: ReparteViewDelegate {
    func novaChamadaClicked() {
        let alert = UIAlertController(title: "Ops!", message: "Funcionalidade ainda não disponível", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func buscarClicked() {
        viewModel.navigateToBuscar(navigationController: self.navigationController)
    }
}

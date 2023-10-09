//
//  EncalheViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 08/10/23.
//

import UIKit

final class EncalheViewController: UIViewController {
    private var encalheView = EncalheView(frame: .zero)
    private var viewModel: EncalheViewModelDelegate
   
    override func loadView() {
        super.loadView()
        view = encalheView
    }
    
    init(viewModel: EncalheViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        encalheView.buttonsDelegate = self
        self.title = "Encalhes"
    }
}

extension EncalheViewController: EncalheViewDelegate {
    func novaChamadaClicked() {
        let alert = UIAlertController(title: "Ops!", message: "Funcionalidade ainda não disponível", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func buscarClicked() {
        let alert = UIAlertController(title: "Ops!", message: "Funcionalidade ainda não disponível", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

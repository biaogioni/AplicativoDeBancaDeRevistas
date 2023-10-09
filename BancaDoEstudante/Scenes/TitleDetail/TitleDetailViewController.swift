//
//  TitleDetailViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 23/09/23.
//

import UIKit

protocol TitleDetailViewControllerDelegate: AnyObject {
    func loadedView()
    func requestFailed()
}

final class TitleDetailViewController: UIViewController {
    private var titleDetailView = TitleDetailView(frame: .zero)
    private var viewModel: TitleDetailViewModelDelegate
   
    override func loadView() {
        super.loadView()
        view = titleDetailView
    }
    
    init(viewModel: TitleDetailViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleDetailView.buttonsDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.updateEntrada()
        let buttonItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.arrow.up.circle"),
            style: .plain,
            target: self,
            action:  #selector(shareClick))
        navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc private func shareClick() {
        let specificItem = [ "titulo: \(viewModel.tituloInfos.titulo), edicao: \(viewModel.tituloInfos.edicao), qtd: \(viewModel.tituloInfos.qtd), precodecapa: \(viewModel.tituloInfos.precodecapa), observacao: \(String(describing: viewModel.tituloInfos.observacao)), codigoEntrada: \(viewModel.tituloInfos.codigoEntrada), codigoSaida: \(String(describing: viewModel.tituloInfos.codigoSaida))" ]
        
        let activityViewController = UIActivityViewController(activityItems: specificItem, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
}

extension TitleDetailViewController: TitleDetailViewControllerDelegate {
    func loadedView() {
        titleDetailView.setTextOnLabels(nota: viewModel.tituloInfos)
    }
    
    func requestFailed() {
        let alert = UIAlertController(title: "Ops!", message: "A requisição falhou! Tente novamente mais tarde.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension TitleDetailViewController: TitleDetailViewDelegate {
    func editClicked() {
        viewModel.navigateToEditTitle()
    }
    
    func entradaLabelClicked() {
        viewModel.clickOnEntrada()
    }
}

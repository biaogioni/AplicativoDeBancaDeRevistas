//
//  ListaDeTitulosViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

protocol ListaDeTitulosViewControllerDelegate: AnyObject {
    func openShareView(filePath: String)
}

final class ListaDeTitulosViewController: UIViewController {
    private var listaDeTitulosView = ListaDeTitulosView(frame: .zero)
    private var viewModel: ListaDeTitulosViewModelDelegate
   
    override func loadView() {
        super.loadView()
        view = listaDeTitulosView
    }
    
    init(viewModel: ListaDeTitulosViewModelDelegate) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaDeTitulosView.setTableViewDelegates(self, self)
        self.title = "Titulos relacionados"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let buttonItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.arrow.up.circle"),
            style: .plain,
            target: self,
            action:  #selector(shareClick))
       navigationItem.rightBarButtonItem = buttonItem
    }
    
    @objc private func shareClick() {
        viewModel.convertToPdf()
    }
}

extension ListaDeTitulosViewController: ListaDeTitulosViewControllerDelegate {
    func openShareView(filePath: String) {
        let url = NSURL.fileURL(withPath: filePath)
        let activityViewController = UIActivityViewController(activityItems: [url] , applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        DispatchQueue.main.async {
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}

extension ListaDeTitulosViewController: ListaDeTitulosViewDelegate {
    func buscarClicked() {
    }
}

extension ListaDeTitulosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.navigateToTitleDetails(indexPath)
    }
}

extension ListaDeTitulosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfNotes()
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ListaDeTituloViewCell()
        cell.setTextOnLabels(nota: viewModel.getNoteData(indexPath))
        return cell
    }
}

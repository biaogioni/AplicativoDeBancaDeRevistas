//
//  ListaDeTitulosView.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

protocol ListaDeTitulosViewDelegate: AnyObject {
    func buscarClicked()
}

final class ListaDeTitulosView: UIView {
    private let listTableView = UITableView()
    weak var buttonsDelegate: BuscarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupAnchors()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTableViewDelegates(_ delegate: UITableViewDelegate, _ dataSource: UITableViewDataSource) {
        listTableView.dataSource = dataSource
        listTableView.delegate = delegate
    }
    
//    private func setUpButton() {
//        buscarButton.translatesAutoresizingMaskIntoConstraints = false
//        buscarButton.setAction { self.buscarClicked() }
//    }

//    @objc private func buscarClicked() {
//        buttonsDelegate?.buscarClicked()
//    }
}

extension ListaDeTitulosView {
    func setupViews() {
        addSubview(listTableView)
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            listTableView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            listTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            listTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            listTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupLayouts() {
        listTableView.backgroundColor = .clear
        listTableView.translatesAutoresizingMaskIntoConstraints = false
        listTableView.isScrollEnabled = true
        listTableView.separatorStyle = .singleLine
        backgroundColor = .white
    }
}

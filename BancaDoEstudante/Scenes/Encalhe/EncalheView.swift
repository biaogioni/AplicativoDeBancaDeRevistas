//
//  EncalheView.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 08/10/23.
//

import UIKit

protocol EncalheViewDelegate: AnyObject {
    func novaChamadaClicked()
    func buscarClicked()
}

final class EncalheView: UIView {
    private var novaChamadaButton = BeButton(.buttonContainedSimpleDefault,
                                             title: "Adicionar encalhe")
    private var buscarButton = BeButton(.buttonContainedSimpleDefault,
                                        title: "Buscar")
    
    weak var buttonsDelegate: EncalheViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        novaChamadaButton.translatesAutoresizingMaskIntoConstraints = false
        buscarButton.translatesAutoresizingMaskIntoConstraints = false
        setupViews()
        setupAnchors()
        setUpButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButton() {
        novaChamadaButton.setAction { self.novaChamadaClicked() }
        buscarButton.setAction { self.buscarClicked() }
    }
    
    @objc private func novaChamadaClicked() {
        buttonsDelegate?.novaChamadaClicked()
    }
    
    @objc private func buscarClicked() {
        buttonsDelegate?.buscarClicked()
    }
}

extension EncalheView {
    func setupViews() {
        backgroundColor = .white
        addSubview(novaChamadaButton)
        addSubview(buscarButton)
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            novaChamadaButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            novaChamadaButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -20),
            novaChamadaButton.widthAnchor.constraint(equalToConstant: 250),
            
            buscarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            buscarButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
            buscarButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

//
//  BuscarReparteView.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

protocol BuscarViewDelegate: AnyObject {
    func buscarClicked(data: FindEntrada)
}

final class BuscarView: UIView {
    private var titleField = UITextField()
    private var editionField = UITextField()
    private var encalheDateField = UITextField()
    private var reparteDateField = UITextField()
    
    private var buscarButton = BeButton(.buttonContainedSimpleDefault,
                                        title: "Buscar")
    weak var buttonsDelegate: BuscarViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupAnchors()
        setUpButton()
        setUpFields()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpFields() {
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.placeholder = "Título"
        titleField.font = UIFont.systemFont(ofSize: 20)
        titleField.borderStyle = UITextField.BorderStyle.roundedRect
        editionField.translatesAutoresizingMaskIntoConstraints = false
        editionField.placeholder = "Edição"
        editionField.font = UIFont.systemFont(ofSize: 20)
        editionField.borderStyle = UITextField.BorderStyle.roundedRect
        encalheDateField.translatesAutoresizingMaskIntoConstraints = false
        encalheDateField.placeholder = "Data do encalhe"
        encalheDateField.font = UIFont.systemFont(ofSize: 20)
        encalheDateField.borderStyle = UITextField.BorderStyle.roundedRect
        encalheDateField.keyboardType = .numberPad
        reparteDateField.translatesAutoresizingMaskIntoConstraints = false
        reparteDateField.placeholder = "Data do reparte"
        reparteDateField.font = UIFont.systemFont(ofSize: 20)
        reparteDateField.borderStyle = UITextField.BorderStyle.roundedRect
        reparteDateField.keyboardType = .numberPad
    }
    
    private func setUpButton() {
        buscarButton.translatesAutoresizingMaskIntoConstraints = false
        buscarButton.setAction { self.buscarClicked() }
    }
    
    @objc private func buscarClicked() {
        let titulo = titleField.text == "" ? "nil" : titleField.text
        let edicao = editionField.text == "" ? "nil" : editionField.text
        let data = FindEntrada(titulo: titulo ?? "nil",
                               edicao: edicao ?? "nil",
                               codigoEntrada: Int(encalheDateField.text ?? "0") ?? 0,
                               codigoSaida: Int(reparteDateField.text ?? "0") ?? 0)
        buttonsDelegate?.buscarClicked(data: data)
    }
}

extension BuscarView {
    func setupViews() {
        backgroundColor = .white
        addSubview(titleField)
        addSubview(editionField)
        addSubview(encalheDateField)
        addSubview(reparteDateField)
        addSubview(buscarButton)
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            titleField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            editionField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 16),
            editionField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            editionField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            encalheDateField.topAnchor.constraint(equalTo: editionField.bottomAnchor, constant: 16),
            encalheDateField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            encalheDateField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
           
            reparteDateField.topAnchor.constraint(equalTo: encalheDateField.bottomAnchor, constant: 16),
            reparteDateField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            reparteDateField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            buscarButton.topAnchor.constraint(equalTo: reparteDateField.bottomAnchor, constant: 24),
            buscarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            buscarButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

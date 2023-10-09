//
//  EditTitleView.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 24/09/23.
//

import UIKit

protocol EditTitleViewDelegate: AnyObject {
    func editClicked(nota: NotasEntradas)
}

final class EditTitleView: UIView {
    private let stackView = UIStackView()
    private lazy var titleLabel = UILabel()
    private lazy var edicaoLabel = UILabel()
    private lazy var qtdLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var obsLabel = UILabel()
    private lazy var entradaLabel = UILabel()
    private lazy var saidaLabel = UILabel()
    
    private lazy var titleField = UITextView()
    private var edicaoField = UITextField()
    private var qtdField = UITextField()
    private lazy var priceField = UITextField()
    private lazy var obsField = UITextField()
    private lazy var entradaDateField = UITextField()
    private lazy var saidaDateField = UITextField()
    
    private var saveButton = BeButton(.buttonContainedSimpleDefault,
                                        title: "Salvar")
    
    private var notaEntrada: NotasEntradas?
    weak var buttonsDelegate: EditTitleViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupAnchors()
        setupLayouts()
        setUpButton()
        setDesignInfos()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButton() {
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setAction { self.editClicked() }
    }

    @objc private func editClicked() {
        let newNota = NotasEntradas(
            id: notaEntrada?.id,
            titulo: titleField.text,
            edicao: edicaoField.text ?? "",
            codigodebarras: notaEntrada?.codigodebarras,
            qtd: Int(qtdField.text ?? "0") ?? 0,
            precodecapa: priceField.text ?? "",
            observacao: obsField.text,
            codigoEntrada: Int(entradaDateField.text ?? "0") ?? 0,
            codigoSaida: Int(saidaLabel.text ?? "0"))
        buttonsDelegate?.editClicked(nota: newNota)
    }
    
    func setTextOnLabels(nota: NotasEntradas) {
        notaEntrada = nota
        titleField.text = nota.titulo
        titleField.sizeToFit()
        titleField.font = UIFont.systemFont(ofSize: 18)
        edicaoField.text = nota.edicao
        qtdField.text = String(nota.qtd)
        priceField.text = nota.precodecapa
        obsField.text = nota.observacao
        entradaDateField.text = String(nota.codigoEntrada)
        guard let saida = nota.codigoSaida else { return }
        saidaDateField.text = String(saida)
    }
    
    private func setDesignInfos() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .right
        titleLabel.text = "Titulo"
        edicaoLabel.translatesAutoresizingMaskIntoConstraints = false
        edicaoLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        edicaoLabel.text = "Edição"
        qtdLabel.translatesAutoresizingMaskIntoConstraints = false
        qtdLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        qtdLabel.text = "Quantidade"
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        priceLabel.textAlignment = .right
        priceLabel.text = "Preço"
        obsLabel.translatesAutoresizingMaskIntoConstraints = false
        obsLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        obsLabel.textAlignment = .right
        obsLabel.text = "Observação"
        entradaLabel.translatesAutoresizingMaskIntoConstraints = false
        entradaLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        entradaLabel.text = "Data de entrada"
        saidaLabel.translatesAutoresizingMaskIntoConstraints = false
        saidaLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        saidaLabel.text = "Data de saida"
    }
    
    private func setUpFields() {
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.font = UIFont.systemFont(ofSize: 18)
        titleField.isEditable = true
        titleField.isScrollEnabled = false
        edicaoField.translatesAutoresizingMaskIntoConstraints = false
        edicaoField.font = UIFont.systemFont(ofSize: 18)
        edicaoField.borderStyle = UITextField.BorderStyle.roundedRect
        qtdField.translatesAutoresizingMaskIntoConstraints = false
        qtdField.font = UIFont.systemFont(ofSize: 18)
        qtdField.borderStyle = UITextField.BorderStyle.roundedRect
        qtdField.keyboardType = .numberPad
        priceField.translatesAutoresizingMaskIntoConstraints = false
        priceField.font = UIFont.systemFont(ofSize: 18)
        priceField.borderStyle = UITextField.BorderStyle.roundedRect
        obsField.translatesAutoresizingMaskIntoConstraints = false
        obsField.font = UIFont.systemFont(ofSize: 18)
        obsField.borderStyle = UITextField.BorderStyle.roundedRect
        entradaDateField.translatesAutoresizingMaskIntoConstraints = false
        entradaDateField.font = UIFont.systemFont(ofSize: 18)
        entradaDateField.borderStyle = UITextField.BorderStyle.roundedRect
        saidaDateField.translatesAutoresizingMaskIntoConstraints = false
        saidaDateField.font = UIFont.systemFont(ofSize: 18)
        saidaDateField.borderStyle = UITextField.BorderStyle.roundedRect
    }
}

extension EditTitleView {
    func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(titleField)
        stackView.addArrangedSubview(edicaoLabel)
        stackView.addArrangedSubview(edicaoField)
        stackView.addArrangedSubview(qtdLabel)
        stackView.addArrangedSubview(qtdField)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(priceField)
        stackView.addArrangedSubview(obsLabel)
        stackView.addArrangedSubview(obsField)
        stackView.addArrangedSubview(entradaLabel)
        stackView.addArrangedSubview(entradaDateField)
        stackView.addArrangedSubview(saidaLabel)
        stackView.addArrangedSubview(saidaDateField)
        addSubview(saveButton)
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            titleField.heightAnchor.constraint(equalToConstant: 50),
            titleField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            titleField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            edicaoField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            edicaoField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            qtdField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            qtdField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            priceField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            priceField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            obsField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            obsField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            entradaDateField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            entradaDateField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            saidaDateField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            saidaDateField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            saveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupLayouts() {
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        backgroundColor = .white
    }
}

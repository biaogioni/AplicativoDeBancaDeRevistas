//
//  TitleDetailView.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 23/09/23.
//

import UIKit

protocol TitleDetailViewDelegate: AnyObject {
    func editClicked()
    func entradaLabelClicked()
}

final class TitleDetailView: UIView {
    private let stackView = UIStackView()
    private lazy var titleLabel = UILabel()
    private let primVerticalStackView = UIStackView()
    private lazy var edicaoNameLabel = UILabel()
    private lazy var qtdNameLabel = UILabel()
    private lazy var priceNameLabel = UILabel()
    private lazy var entradaNameLabel = UILabel()
    private lazy var saidaNameLabel = UILabel()
    private let secVerticalStackView = UIStackView()
    private lazy var edicaoLabel = UILabel()
    private lazy var qtdLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var entradaLabel = UILabel()
    private lazy var saidaLabel = UILabel()
    
    
    private var buscarButton = BeButton(.buttonContainedSimpleDefault,
                                        title: "Editar titulo")
    
    weak var buttonsDelegate: TitleDetailViewDelegate?
    
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
        buscarButton.translatesAutoresizingMaskIntoConstraints = false
        buscarButton.setAction { self.editClicked() }
    }

    @objc private func editClicked() {
        buttonsDelegate?.editClicked()
    }
    
    func setTextOnLabels(nota: NotasEntradas) {
        titleLabel.text = nota.titulo
        edicaoLabel.text = nota.edicao
        qtdLabel.text = String(nota.qtd)
        priceLabel.text = nota.precodecapa
        entradaLabel.text = String(nota.codigoEntrada)
        guard let saida = nota.codigoSaida else {
            saidaNameLabel.isHidden = true
            return
        }
        saidaLabel.text = String(saida)
    }
    
    private func setDesignInfos() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        edicaoLabel.translatesAutoresizingMaskIntoConstraints = false
        edicaoLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        qtdLabel.translatesAutoresizingMaskIntoConstraints = false
        qtdLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        priceLabel.textAlignment = .right
        entradaLabel.translatesAutoresizingMaskIntoConstraints = false
        entradaLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        entradaLabel.textColor = .blue
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(entradaClicked))
        entradaLabel.isUserInteractionEnabled = true
        entradaLabel.addGestureRecognizer(tapGesture)
        
        saidaLabel.translatesAutoresizingMaskIntoConstraints = false
        saidaLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        edicaoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        edicaoNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        edicaoNameLabel.text = "Edição:"
        qtdNameLabel.translatesAutoresizingMaskIntoConstraints = false
        qtdNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        qtdNameLabel.text = "Quantidade:"
        priceNameLabel.translatesAutoresizingMaskIntoConstraints = false
        priceNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        priceNameLabel.textAlignment = .right
        priceNameLabel.text = "Preço:"
        entradaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        entradaNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        entradaNameLabel.text = "Data de entrada:"
        saidaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        saidaNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        saidaNameLabel.text = "Data de saida:"
    }
    
    @objc private func entradaClicked() {
        buttonsDelegate?.entradaLabelClicked()
    }
}

extension TitleDetailView {
    func setupViews() {
        addSubview(titleLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(primVerticalStackView)
        primVerticalStackView.addArrangedSubview(edicaoNameLabel)
        primVerticalStackView.addArrangedSubview(qtdNameLabel)
        primVerticalStackView.addArrangedSubview(priceNameLabel)
        primVerticalStackView.addArrangedSubview(entradaNameLabel)
        primVerticalStackView.addArrangedSubview(saidaNameLabel)
        
        stackView.addArrangedSubview(secVerticalStackView)
        secVerticalStackView.addArrangedSubview(edicaoLabel)
        secVerticalStackView.addArrangedSubview(qtdLabel)
        secVerticalStackView.addArrangedSubview(priceLabel)
        secVerticalStackView.addArrangedSubview(entradaLabel)
        secVerticalStackView.addArrangedSubview(saidaLabel)
        addSubview(buscarButton)
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            buscarButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 24),
            buscarButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            buscarButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    func setupLayouts() {
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.spacing = 10
        backgroundColor = .white
        
        primVerticalStackView.backgroundColor = .clear
        primVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        primVerticalStackView.axis = .vertical
        primVerticalStackView.alignment = .leading
        primVerticalStackView.spacing = 10

        secVerticalStackView.backgroundColor = .clear
        secVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        secVerticalStackView.axis = .vertical
        secVerticalStackView.alignment = .leading
        secVerticalStackView.spacing = 10
    }
}

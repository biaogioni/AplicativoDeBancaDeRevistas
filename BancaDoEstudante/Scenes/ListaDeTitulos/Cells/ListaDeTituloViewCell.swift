//
//  ListaDeTituloViewCell.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import UIKit

final class ListaDeTituloViewCell: UITableViewCell {
    private lazy var titleLabel = UILabel()
    private lazy var edicaoLabel = UILabel()
    private lazy var qtdLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var entradaLabel = UILabel()
    private lazy var saidaLabel = UILabel()
    
    public override init(style: UITableViewCell.CellStyle,
                         reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setDesignInfos()
        setupViews()
        setupAnchors()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextOnLabels(nota: NotasEntradas) {
        titleLabel.text = nota.titulo
        edicaoLabel.text = nota.edicao
        qtdLabel.text = String(nota.qtd)
        priceLabel.text = nota.precodecapa
        entradaLabel.text = String(nota.codigoEntrada)
        guard let saida = nota.codigoSaida else { return }
        saidaLabel.text = String(saida)
    }
    
    private func setDesignInfos() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        edicaoLabel.translatesAutoresizingMaskIntoConstraints = false
        edicaoLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        qtdLabel.translatesAutoresizingMaskIntoConstraints = false
        qtdLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        priceLabel.textAlignment = .right
        entradaLabel.translatesAutoresizingMaskIntoConstraints = false
        entradaLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        saidaLabel.translatesAutoresizingMaskIntoConstraints = false
        saidaLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
}

extension ListaDeTituloViewCell {
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(edicaoLabel)
        contentView.addSubview(qtdLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(entradaLabel)
        contentView.addSubview(saidaLabel)
    }
    
    func setupAnchors() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            edicaoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            edicaoLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
            edicaoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            edicaoLabel.heightAnchor.constraint(equalToConstant: 24),
            
            qtdLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            qtdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            qtdLabel.heightAnchor.constraint(equalToConstant: 24),
            
            priceLabel.topAnchor.constraint(equalTo:  edicaoLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: qtdLabel.trailingAnchor, constant: 14),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            priceLabel.heightAnchor.constraint(equalToConstant: 24),
            
            entradaLabel.topAnchor.constraint(equalTo: qtdLabel.bottomAnchor, constant: 5),
            entradaLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 14),
            entradaLabel.heightAnchor.constraint(equalToConstant: 24),
            entradaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            saidaLabel.topAnchor.constraint(equalTo:  priceLabel.bottomAnchor, constant: 5),
            saidaLabel.leadingAnchor.constraint(equalTo: entradaLabel.trailingAnchor, constant: 4),
            saidaLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14),
            saidaLabel.heightAnchor.constraint(equalToConstant: 24),
            saidaLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }

    func setupLayouts() {
        backgroundColor = .white
    }
}

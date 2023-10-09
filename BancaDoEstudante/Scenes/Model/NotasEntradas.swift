//
//  NotasEntradas.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import Foundation

struct NotasEntradas: Encodable {
    let id: Int?
    let titulo: String
    let edicao: String
    let codigodebarras: String?
    let qtd: Int
    let precodecapa: String
    let observacao: String?
    let codigoEntrada: Int
    let codigoSaida: Int?
}

extension NotasEntradas: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case titulo
        case edicao
        case codigodebarras
        case qtd
        case precodecapa
        case observacao
        case codigoEntrada
        case codigoSaida
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try? container.decode(Int.self, forKey: .id)
        titulo = try container.decode(String.self, forKey: .titulo)
        edicao = try container.decode(String.self, forKey: .edicao)
        codigodebarras = try? container.decode(String.self, forKey: .codigodebarras)
        qtd = try container.decode(Int.self, forKey: .qtd)
        precodecapa = try container.decode(String.self, forKey: .precodecapa)
        observacao = try? container.decode(String.self, forKey: .observacao)
        codigoEntrada = try container.decode(Int.self, forKey: .codigoEntrada)
        codigoSaida = try? container.decode(Int.self, forKey: .codigoSaida)
    }
}

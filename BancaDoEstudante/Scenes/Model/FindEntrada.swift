//
//  FindEntrada.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 01/10/23.
//

import Foundation

struct FindEntrada: Encodable {
    let titulo: String
    let edicao: String
    let codigoEntrada: Int
    let codigoSaida: Int
    
    enum CodingKeys: String, CodingKey {
        case titulo
        case edicao
        case codigoEntrada
        case codigoSaida
    }
}

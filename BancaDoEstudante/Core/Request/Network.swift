//
//  Network.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import Foundation

class Network {
    func getNotasEntradas(data: FindEntrada, completion: @escaping (Result<[NotasEntradas]?, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/notasEntradas/\( data.titulo)/\(data.edicao)/\(data.codigoEntrada)/\(data.codigoSaida)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if error != nil {
                completion(.failure(NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                return
            }
            guard let data else { return }
            do {
                let entradas = try? JSONDecoder().decode([NotasEntradas].self, from: data)
                completion(.success(entradas))
            }
        }.resume()
    }
    
    func getNotasEntradas(id: Int?, completion: @escaping (Result<NotasEntradas?, Error>) -> Void) {
        guard let id else { return }
        guard let url = URL(string: "http://localhost:3000/notasEntradas/id/\(id)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if error != nil {
                completion(.failure(NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                return
            }
            guard let data else { return }
            do {
                let entradas = try? JSONDecoder().decode([NotasEntradas].self, from: data)
                completion(.success(entradas?[0]))
            }
        }.resume()
    }
    
    func getNotasEntradas(entrada: Int, completion: @escaping (Result<[NotasEntradas]?, Error>) -> Void) {
        guard let url = URL(string: "http://localhost:3000/notasEntradas/\(entrada)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if error != nil {
                completion(.failure(NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                return
            }
            guard let data else { return }
            do {
                let entradas = try? JSONDecoder().decode([NotasEntradas].self, from: data)
                completion(.success(entradas))
            }
        }.resume()
    }
    
    func editNotaEntrada(nota: NotasEntradas, completion: @escaping (Result<NotasEntradas?, Error>) -> Void) {
        guard let id = nota.id else { return }
        guard let url = URL(string: "http://localhost:3000/notasEntradas/edit/\(id)") else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"

        do {
            let data = try JSONEncoder().encode(nota)
            request.httpBody = data
        } catch {
            print("nao mandou o corpo")
        }
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in
            if error != nil {
                completion(.failure(NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                return
            }
            guard let data else { return }
            do {
                let entradas = try? JSONDecoder().decode(NotasEntradas.self, from: data)
                completion(.success(entradas))
            }
        }.resume()
    }
}

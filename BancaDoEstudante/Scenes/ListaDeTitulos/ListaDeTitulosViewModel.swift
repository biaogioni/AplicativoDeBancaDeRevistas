//
//  ListaDeTitulosViewModel.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 17/09/23.
//

import Foundation
import UIKit

protocol ListaDeTitulosViewModelDelegate: AnyObject {
    func navigateToTitleDetails(_ index: IndexPath)
    func getNumberOfNotes() -> Int
    func getNoteData(_ index: IndexPath) -> NotasEntradas
    func convertToPdf()
}

final class ListaDeTitulosViewModel {
    weak var viewController: ListaDeTitulosViewControllerDelegate?
    private let coordinator: ListaDeTitulosCoordinatorDelegate
    private var notasEntradas: [NotasEntradas]
    
    init(coordinator: ListaDeTitulosCoordinatorDelegate,
         notas: [NotasEntradas]) {
        self.coordinator = coordinator
        self.notasEntradas = notas
    }
    
    func convertToPdf() {
        do {
            let jsonData = try JSONEncoder().encode(notasEntradas)
            let jsonString = String(data: jsonData, encoding: .utf8) ?? ""
            convertToPdfFileAndShare(string: jsonString)
        } catch {
            return
        }
    }
    
    func convertToPdfFileAndShare(string: String) {
        let fmt = UIMarkupTextPrintFormatter(markupText: string)
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(fmt, startingAtPageAt: 0)
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8) // A4, 72 dpi
        render.setValue(page, forKey: "paperRect")
        render.setValue(page, forKey: "printableRect")
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, .zero, nil)
        
        for i in 0..<render.numberOfPages {
            UIGraphicsBeginPDFPage()
            render.drawPage(at: i, in: UIGraphicsGetPDFContextBounds())
        }
        
        UIGraphicsEndPDFContext()
        
        guard let outputURL = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("entrada \(notasEntradas[0].codigoEntrada)").appendingPathExtension("pdf")
        else { fatalError("Destination URL not created") }
        
        pdfData.write(to: outputURL, atomically: true)
        viewController?.openShareView(filePath: outputURL.path)
    }
}

extension ListaDeTitulosViewModel: ListaDeTitulosViewModelDelegate {
    func navigateToTitleDetails(_ index: IndexPath) {
        coordinator.navigateToTitleDetails(nota: notasEntradas[index.row])
    }
    
    func getNumberOfNotes() -> Int {
        notasEntradas.count
    }
    
    func getNoteData(_ index: IndexPath) -> NotasEntradas {
        notasEntradas[index.row]
    }
}

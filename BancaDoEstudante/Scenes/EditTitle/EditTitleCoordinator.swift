//
//  EditTitleCoordinator.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 24/09/23.
//

import UIKit

protocol EditTitleCoordinatorDelegate: AnyObject {
    func navigateBackToTitleDetail()
}

final class EditTitleCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension EditTitleCoordinator: EditTitleCoordinatorDelegate {
    func navigateBackToTitleDetail() {
        for controller in self.navigationController.viewControllers as Array {
            if controller.isKind(of: TitleDetailViewController.self) {
                self.navigationController.popToViewController(controller, animated: true)
                break
            }
        }
    }
    
}

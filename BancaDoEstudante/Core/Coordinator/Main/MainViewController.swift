//
//  MainViewController.swift
//  BancaDoEstudante
//
//  Created by Beatriz Ogioni on 08/10/23.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.viewControllers = setUpTabBar()
        self.selectedIndex = 0
    }
    
    func setUpTabBar() -> [UIViewController]? {
        let reparteTab = UINavigationController(rootViewController: ReparteFactory.make())
        let reparteTabBarItem = UITabBarItem(title: "Repartes", image: UIImage(systemName: "plus.square"), selectedImage: UIImage(systemName: "plus.square.fill"))
        reparteTab.tabBarItem = reparteTabBarItem
        
        let encalheTab = UINavigationController(rootViewController: EncalheFactory.make())
        let encalheTabBarItem = UITabBarItem(title: "Encalhes", image: UIImage(systemName: "rectangle.portrait.and.arrow.forward"), selectedImage: UIImage(systemName: "rectangle.portrait.and.arrow.forward.fill"))
        encalheTab.tabBarItem = encalheTabBarItem
        
        return [reparteTab, encalheTab]
    }
}

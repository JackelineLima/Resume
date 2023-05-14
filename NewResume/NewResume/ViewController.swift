//
//  ViewController.swift
//  NewResume
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    let viewResumoNovo = ResumeView()
    
    private lazy var accountView: AgencyAccountView = {
        let view = AgencyAccountView()
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViewNewResume()
    }
    
    private func setupViewNewResume() {
        setupConstraintsNewResume()
        setupNavigationNewResume()
    }
    
    private func setupConstraintsNewResume() {
        viewResumoNovo.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(viewResumoNovo)
        NSLayoutConstraint.activate([
            viewResumoNovo.topAnchor.constraint(equalTo: view.topAnchor),
            viewResumoNovo.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            viewResumoNovo.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            viewResumoNovo.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    
    
    @objc
    func leftButtonTapped(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        // Implemente a ação do botão esquerdo aqui
    }

    @objc
    func rightButtonTapped(sender: UIButton) {
        // Implemente a ação do botão direito aqui
    }
}

//MARK: Configuration Navigation New Resume
extension ViewController {
    private func setupNavigationNewResume() {
        setupLeftItemsNavigationNewResume()
        setupRightItemsNavigationNewResume()
    }
    
    private func setupLeftItemsNavigationNewResume() {
        let leftButton = UIButton(type: .system)
        let leftButtonImage = UIImage(named: "icon-menu-hamburguer")?.withRenderingMode(.alwaysTemplate)
        leftButton.setImage(leftButtonImage, for: .normal)
        leftButton.tintColor = .white
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        space.width = 24
        
        let accountButton = UIBarButtonItem(customView: accountView)

        let leftButtomCustom = UIBarButtonItem(customView: leftButton)
        navigationItem.setLeftBarButtonItems([leftButtomCustom, space, accountButton], animated: false)
    }
    
    private func setupRightItemsNavigationNewResume() {
        let rightButton = UIButton(type: .system)
        let rightButtonImage = UIImage(named: "icon-notification-off")?.withRenderingMode(.alwaysTemplate)
        rightButton.setImage(rightButtonImage, for: .normal)
        rightButton.tintColor = .white
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
}


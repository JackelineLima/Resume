//
//  AlertFGCView.swift
//  NewResume
//
//  Created by Jacqueline Lima on 14/05/23.
//

import UIKit

final class AlertFGCView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Aviso"
        return label
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1.0).cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = UIColor(red: 85/255, green: 85/255, blue: 85/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "Os produtos Conta corrente, Poupança, CDB/RDB, Letras de Câmbio, Letras Hipotecárias, LCI e LCA são garantidos pelo Fundo Garantidor de Créditos (FGC). Disponibilizamos em nosso site o Comunicado FGC que explica melhor como funcionam as garantias. Acesse www.banese.com.br."
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupLayout() {
        addSubview(titleLabel)
        addSubview(containerView)
        containerView.addSubview(descriptionLabel)
        
        titleLabel.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor, constant: 9),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]}
        
        containerView.constraint {[
            $0.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
        ]}
        
        descriptionLabel.constraint {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ]}
    }
}

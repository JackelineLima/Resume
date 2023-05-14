//
//  MyBalanceView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//
import UIKit

final class MyBalanceView: UIView {
    
    private lazy var uiStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        return stack
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Meu saldo"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 4.000,00"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var withdrawLabel: UILabel = {
        let label = UILabel()
        label.text = "Saldo para saque"
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    
    private lazy var withdrawIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "info-circle")
        return view
    }()
    
    private lazy var eyeButton: UIImageView = {
        let button = UIImageView()
//        button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.image = UIImage(named: "icon-security-eye-open")
        return button
    }()
    
    private lazy var withdrawValueLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 5.000,00"
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1.0).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    }

    private func setupSubviews() {
        // Adicionando labels e botão de olho aqui
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(eyeButton)
        
        addSubview(uiStackView)
        uiStackView.addArrangedSubview(withdrawLabel)
        uiStackView.addArrangedSubview(withdrawIcon)
        addSubview(withdrawValueLabel)
        
        // Define as propriedades dos labels e do botão aqui
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            balanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            eyeButton.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
            
//            withdrawIcon.widthAnchor.constraint(equalToConstant: 18),
//            withdrawIcon.heightAnchor.constraint(equalToConstant: 14),
            
            uiStackView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 12),
            uiStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            uiStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            withdrawValueLabel.centerYAnchor.constraint(equalTo: uiStackView.centerYAnchor),
            withdrawValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
    }

    @objc private func eyeButtonTapped() {
    
    }
}

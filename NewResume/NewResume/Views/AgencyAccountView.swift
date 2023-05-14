//
//  AgencyAccountView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//

import UIKit

final class AgencyAccountView: UIView {

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        label.sizeToFit()
        label.text = "Olá, Jackeline Lima"
        return label
    }()
    
    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.sizeToFit()
        label.text = "Agência 039 | Conta 01085907-0"
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .leading
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
}

extension AgencyAccountView {
    
    func setupModel(name: String, account: String) {
        nameLabel.text = name
        accountLabel.text = account
    }
    
    private func setupView() {
        backgroundColor = .clear
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(accountLabel)
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

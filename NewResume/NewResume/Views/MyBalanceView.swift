//
//  MyBalanceView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//
import UIKit

final class MyBalanceView: UIView {
    
    private var isHiddenBalance = true
    
    
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
        label.sizeToFit()
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
    
    private lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(eyeButtonTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "icon_security_eye_open"), for: .normal)
        return button
    }()
    
    private lazy var withdrawValueLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 5.000,00"
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    lazy var grayView = GrayView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupLayout()
        
        setupBackgroundHiddenBalance(views: [balanceLabel, withdrawValueLabel])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundHiddenBalance(views: [UIView]) {
        views.forEach { view in
            grayView = GrayView(frame: view.bounds)
            grayView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
            grayView.alpha = 0
            view.addSubview(grayView)
        }
    }
    
    private func setupLayout() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1.0).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
    }

    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(eyeButton)
        
        addSubview(uiStackView)
        uiStackView.addArrangedSubview(withdrawLabel)
        uiStackView.addArrangedSubview(withdrawIcon)
        addSubview(withdrawValueLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            balanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            eyeButton.centerYAnchor.constraint(equalTo: balanceLabel.centerYAnchor),
            eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
            
            uiStackView.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 12),
            uiStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            uiStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            withdrawValueLabel.centerYAnchor.constraint(equalTo: uiStackView.centerYAnchor),
            withdrawValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
        
    }

    @objc private func eyeButtonTapped() {
        var imageBalanceButton = UIImage(named: "icon_security_eye_open")
        
        isHiddenBalance = !isHiddenBalance
        if isHiddenBalance == false {
            imageBalanceButton = UIImage(named: "icon_security_eye_close")
        }
        eyeButton.setImage(imageBalanceButton, for: .normal)
        print(isHiddenBalance)
        showBalance(isHidden: isHiddenBalance, views: [balanceLabel, withdrawValueLabel])
    }
    
    public func showBalance(isHidden: Bool, views: [UIView]) {
        views.forEach { view in
            if isHidden {
                UIView.animate(withDuration: 0.2) {
                    view.subviews.forEach { grayView in
                        if grayView is GrayView {
                            grayView.alpha = 0
                        }
                    }
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    view.subviews.forEach { grayView in
                        if grayView is GrayView {
                            grayView.alpha = 1
                        }
                    }
                }
            }
        }
    }
    
    private func setupBackgroundHidden(views: [UIView]) {
        views.forEach { view in
            grayView = GrayView(frame: view.bounds)
            grayView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1.0)
            grayView.alpha = 0
        }
    }
}

final class GrayView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func setupLayout() {
        backgroundColor = .red
    }
}

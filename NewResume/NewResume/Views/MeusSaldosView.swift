//
//  MeusSaldosView.swift
//  NewResume
//
//  Created by Jacqueline Lima on 14/05/23.
//

import UIKit

struct MyBalanceModel {
    let icon: String
    let title: String
    let value: String
}

protocol MeusSaldosViewDelegate: AnyObject {
    func showBalance() -> Bool
}

final class MeusSaldosView: UIControl {
    
    weak var delegate: MeusSaldosViewDelegate?
    
    private var iconRotationAngle: CGFloat = 0
    private var showListBalance = true
    
    let model: [MyBalanceModel] = [MyBalanceModel(icon: "icon_finance_balance", title: "Conta corrente", value: "R$ 100,00"),
                                   MyBalanceModel(icon: "chart_down", title: "Aplicações disponíveis para saque", value: "R$ 3.900,00"),
                                   MyBalanceModel(icon: "icon_finance_scheduled_debit", title: "Débito programado", value: "-R$ 50,00"),
                                   MyBalanceModel(icon: "icon_finance_savings", title: "Conta poupança", value: "R$ 500,00"),
                                   MyBalanceModel(icon: "icon_cart_resume", title: "Limite disponível do Banese Card", value: "R$ 5.052,20"),
                                   MyBalanceModel(icon: "chart_down", title: "Aplicações", value: "R$ 4.900,00")]
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false
        return view
    }()
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "wallet")
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saldos e limites"
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    private lazy var expandButton: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "icon-arrows-top")
        view.isUserInteractionEnabled = true
        return view
    }()
    
    
    private lazy var containerListBalanceView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()
    
    var myBalanceview: MyBalanceList?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupViews()
        
        print(model.count)
        model.enumerated().forEach { index, item in
            myBalanceview = MyBalanceList()
            guard let myBalanceview else { return }
            myBalanceview.delegate = self
            myBalanceview.setupModel(
                title: item.title,
                balance: item.value,
                iconBalance: item.icon)
            
            containerListBalanceView.addArrangedSubview(myBalanceview)
            
            if model.count == index + 1 {
                myBalanceview.lineView.isHidden = true
            }
        }
        stackView.addArrangedSubview(containerListBalanceView)
        containerListBalanceView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(containerView)
        containerView.addSubview(iconView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(expandButton)
        
        stackView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]}
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            iconView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            iconView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            
            expandButton.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            expandButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupLayout() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1.0).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        
        addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
    }

    
    @objc
    func expandButtonTapped() {
        showListBalance.toggle()
        iconRotationAngle += CGFloat.pi
        UIView.animate(withDuration: 0.2) {
            self.expandButton.transform = CGAffineTransform(rotationAngle: self.iconRotationAngle)
        }
        containerListBalanceView.isHidden = showListBalance
    }
    
    func showBalance(isHidden: Bool) {
        containerListBalanceView.subviews.forEach { view in
            if let myBalanceList = view as? MyBalanceList {
                myBalanceList.showBalance(isHidden: isHidden)
            }
        }
    }
}

extension MeusSaldosView: MyBalanceListDelegate {
    func showBalance() {
        
    }
}

//
//  CreditResumeBannerView.swift
//  NewResume
//
//  Created by Jacqueline Lima on 14/05/23.
//

import UIKit

final class CreditResumeBannerView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Crédito"
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
        label.text = "Utilize o limite emergencial para cobrir imprevistos. Toque aqui para contratar."
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.image = UIImage(named: "limit_emergencial")
        return icon
    }()
    
    private lazy var titleContainerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(red: 10/255, green: 74/255, blue: 51/255, alpha: 1.0)
        label.text = "Limite emergencial"
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
        containerView.addSubview(iconImageView)
        containerView.addSubview(titleContainerLabel)
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
        
        iconImageView.constraint {[
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            $0.centerYAnchor.constraint(equalTo: titleContainerLabel.centerYAnchor)
        ]}
        
        titleContainerLabel.constraint {[
            $0.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            $0.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 8),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ]}
        
        descriptionLabel.constraint {[
            $0.topAnchor.constraint(equalTo: titleContainerLabel.bottomAnchor, constant: 16),
            $0.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            $0.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
        ]}
    }
}

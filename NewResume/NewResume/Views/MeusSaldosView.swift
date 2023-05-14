//
//  MeusSaldosView.swift
//  NewResume
//
//  Created by Jacqueline Lima on 14/05/23.
//

import UIKit

final class MeusSaldosView: UIControl {
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(expandButton)
        
        NSLayoutConstraint.activate([
        
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            
            expandButton.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            expandButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    private func setupLayout() {
        backgroundColor = .white
        layer.borderColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1.0).cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 10
        
        addTarget(self, action: #selector(expandButtonTapped), for: .touchUpInside)
    }
    
    var iconRotationAngle: CGFloat = 0
    
    @objc
    func expandButtonTapped() {
        iconRotationAngle += CGFloat.pi
        UIView.animate(withDuration: 0.2) {
            self.expandButton.transform = CGAffineTransform(rotationAngle: self.iconRotationAngle)
        }
    }
}

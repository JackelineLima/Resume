//
//  MyBalanceList.swift
//  NewResume
//
//  Created by Jacqueline Lima on 14/05/23.
//

import UIKit

protocol MyBalanceListDelegate: AnyObject {
    func showBalance()
}

final class MyBalanceList: UIView {
    
    weak var delegate: MyBalanceListDelegate?
    
    lazy var grayView = GrayView()
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    private lazy var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.918, green: 0.918, blue: 0.918, alpha: 1.0)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(lineView)
        
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            iconView.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width/2.5),
            
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -8),
            
            balanceLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            balanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }
    
    override func layoutSubviews() {
        grayView = GrayView(frame: balanceLabel.bounds)
        grayView.alpha = 0
        balanceLabel.addSubview(grayView)
    }
    
    public func setupModel(title: String, balance: String, iconBalance: String) {
        titleLabel.text = title
        balanceLabel.text = balance
        iconView.image = UIImage(named: iconBalance)
    }
    
    func showBalance(isHidden: Bool) {
        if isHidden {
            grayView.alpha = 0
            balanceLabel.layoutSubviews()
            balanceLabel.layoutIfNeeded()
            balanceLabel.sizeToFit()
        } else {
            grayView.alpha = 1
            balanceLabel.layoutSubviews()
            balanceLabel.layoutIfNeeded()
            balanceLabel.sizeToFit()
        }
    }
}

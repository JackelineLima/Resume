//
//  ResumeView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//

import UIKit

protocol ResumeViewDelegate: AnyObject {
    
}

final class ResumeView: UIView {
    
    weak var delegate: ResumeViewDelegate?
    
    private lazy var headerView: HeaderResumoView = {
        let myView = HeaderResumoView()
        return myView
    }()
    
    private lazy var scrollView: SimpleScrollView = {
        let view = SimpleScrollView(spacing: 0,
                                    margins: .init(top: 0, leading: 0, bottom: 8, trailing: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var containerImageView: UIImageView = {
        let myView = UIImageView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.image = UIImage(named: "resumeBackground")
        myView.isUserInteractionEnabled = true
        return myView
    }()
    
    private lazy var cardView: MyBalanceView = {
        let view = MyBalanceView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private lazy var myBalanceView: MeusSaldosView = {
        let view = MeusSaldosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        setupView()
        setupConstraints()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(headerView)
        addSubview(scrollView)
        
        addSubview(containerImageView)
//        containerImageView.addSubview(containerImageStackView)
        
        containerImageView.addSubview(cardView)
        containerImageView.addSubview(myBalanceView)
    }
    
    private func setupConstraints() {
        
        headerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]}
        
        containerImageView.constraint {[
            $0.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]}
    
        cardView.constraint {[
            $0.topAnchor.constraint(equalTo: containerImageView.topAnchor, constant: 24),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -16),
        ]}

        myBalanceView.constraint {[
            $0.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 24),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -16),
        ]}
    }
}

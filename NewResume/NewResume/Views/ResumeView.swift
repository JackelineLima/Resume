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
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var containerImageView: UIImageView = {
        let myView = UIImageView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.image = UIImage(named: "resumeBackground")
        return myView
    }()
    
    private lazy var cardView: MyBalanceView = {
        let view = MyBalanceView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
 
        setupView()
        setupHeader()
        setupCard()
        configurarScrollView()
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(headerView)
        addSubview(scrollView)
        
        scrollView.addSubview(containerImageView)
        containerImageView.addSubview(cardView)
    }
    
    private func setupHeader() {
        headerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]}
    }
    
    
    private func setupCard() {
        cardView.constraint {[
            $0.topAnchor.constraint(equalTo: containerImageView.topAnchor, constant: 24),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -16),
        ]}
    }
    
    private func configurarScrollView() {
        scrollView.constraint {[
            $0.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]}
    }
}

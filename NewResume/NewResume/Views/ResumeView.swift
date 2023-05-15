//
//  ResumeView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//

import UIKit

struct MenuModel {
    let icon: String
    let title: String
}

protocol ResumeViewDelegate: AnyObject {
    
}

final class ResumeView: UIView {
    
    weak var delegate: ResumeViewDelegate?
    var dataSourceArray: [MenuModel] = [MenuModel(icon: "icon_finance_pix", title: "Pix"),
                                        MenuModel(icon: "icon_finance_transfer", title: "Transferir"),
                                        MenuModel(icon: "icon_finance_pay", title: "Pagar"),
                                        MenuModel(icon: "refresh", title: "Fazer Regarca")]
    
    private lazy var headerView: HeaderResumoView = {
        let myView = HeaderResumoView()
        return myView
    }()
    
    private lazy var scrollView: SimpleScrollView = {
        let view = SimpleScrollView(spacing: 0,
                                    margins: .init(top: 0, leading: 0, bottom: 8, trailing: 0))
        view.translatesAutoresizingMaskIntoConstraints = false
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
        view.delegate = self
        return view
    }()
    
    private lazy var myBalanceView: MeusSaldosView = {
        let view = MeusSaldosView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
//        view.delegate = self
        return view
    }()
    
    private lazy var menuCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)

        let cellWidth: CGFloat = UIScreen.main.bounds.width / 4.3
        let cellHeight: CGFloat = 98
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuResumeCell.self, forCellWithReuseIdentifier: MenuResumeCell.identifier)
        
        return collectionView
    }()
    
    private lazy var alertFGCView: AlertFGCView = {
        let view = AlertFGCView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var creditView: CreditResumeBannerView = {
        let view = CreditResumeBannerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var lifeMoreBannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
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
        
        scrollView.addSubview(containerImageView)
//        containerImageView.addSubview(containerImageStackView)
        
        containerImageView.addSubview(cardView)
        containerImageView.addSubview(myBalanceView)
        containerImageView.addSubview(menuCollection)
        containerImageView.addSubview(alertFGCView)
        containerImageView.addSubview(creditView)
        containerImageView.addSubview(lifeMoreBannerView)
    }
    
    private func setupConstraints() {
        
        headerView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
        ]}
        
        scrollView.constraint {[
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
        
        menuCollection.constraint {[
            $0.topAnchor.constraint(equalTo: myBalanceView.bottomAnchor, constant: 8),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor),
            $0.heightAnchor.constraint(equalToConstant: 98),
        ]}
        
        alertFGCView.constraint {[
            $0.topAnchor.constraint(equalTo: menuCollection.bottomAnchor, constant: 8),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -16),
        ]}
        
        creditView.constraint {[
            $0.topAnchor.constraint(equalTo: alertFGCView.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -16),
        ]}
        
        lifeMoreBannerView.constraint {[
            $0.topAnchor.constraint(equalTo: creditView.bottomAnchor),
            $0.leadingAnchor.constraint(equalTo: containerImageView.leadingAnchor, constant: 16),
            $0.trailingAnchor.constraint(equalTo: containerImageView.trailingAnchor, constant: -16),
            $0.bottomAnchor.constraint(equalTo: containerImageView.bottomAnchor, constant: -16),
            $0.heightAnchor.constraint(equalToConstant: 200)
        ]}
        
    }
}

extension ResumeView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuResumeCell.identifier, for: indexPath) as? MenuResumeCell else { return UICollectionViewCell() }
        
        cell.setupCell(
            iconName: dataSourceArray[indexPath.item].icon,
            title: dataSourceArray[indexPath.item].title)
        
        return cell
    }
}

extension ResumeView: MyBalanceViewDelegate {
    func showBalance(isHidden: Bool) {
        myBalanceView.showBalance(isHidden: isHidden)
    }
}

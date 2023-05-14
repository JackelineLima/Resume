//
//  HeaderResumoView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//

import UIKit

final class HeaderResumoView: UIView {
    
    private lazy var containerImageView: UIImageView = {
        let myView = UIImageView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.image = UIImage(named: "resumeBackground")
        return myView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        inicializarViews()
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func inicializarViews() {
        addSubview(backgroundImageView)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 155),
        ])
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 180)
        imageView.tintColor = UIColor(red: 0.125, green: 0.655, blue: 0.439, alpha: 1.0)
        return imageView
    }()
}

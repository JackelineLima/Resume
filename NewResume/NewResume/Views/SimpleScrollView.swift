//
//  SimpleScrollView.swift
//  Resumo
//
//  Created by Jackeline Pires de Lima on 14/05/23.
//

import UIKit

final class SimpleScrollView: UIScrollView {
    
    lazy var containerStackView: UIStackView = {
        let element = UIStackView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.axis = .vertical
        element.isLayoutMarginsRelativeArrangement = true
        return element
    }()
    
    init(spacing: CGFloat = 0,
         margins: NSDirectionalEdgeInsets = .zero) {
        super.init(frame: .zero)
        containerStackView.spacing = spacing
        containerStackView.directionalLayoutMargins = margins
        setupView()
        registerNotifications()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubview(_ view: UIView) {
        containerStackView.addArrangedSubview(view)
    }
    
    private func setupView() {
        buildViewHierarchy()
        setupConstraints()
    }
    
    func addCustomSpace(spacing: CGFloat, afterView: UIView) {
        containerStackView.setCustomSpacing(spacing, after: afterView)
    }
    
    private func buildViewHierarchy() {
        super.addSubview(containerStackView)
    }
    
    private func setupConstraints() {
        containerStackView.constraint {[
            $0.topAnchor.constraint(equalTo: topAnchor),
            $0.leadingAnchor.constraint(equalTo: leadingAnchor),
            $0.trailingAnchor.constraint(equalTo: trailingAnchor),
            $0.bottomAnchor.constraint(equalTo: bottomAnchor),
            $0.widthAnchor.constraint(equalTo: widthAnchor)
        ]}
    }
    
    private func registerNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification){
        guard let keyboardFrame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        contentInset.bottom = self.convert(keyboardFrame.cgRectValue, from: nil).size.height
    }
    
    @objc private func keyboardWillHide(notification: NSNotification){
        contentInset.bottom = 0
    }
}


extension UIView {
    
    func constraint(_ closure: (UIView) -> [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(closure(self))
    }
    
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}


extension CACornerMask {
    
    static var allCorners: CACornerMask {
        return [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    static var topCorners: CACornerMask {
        return [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    static var bottomCorners: CACornerMask {
        return [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
}

extension UIRectCorner {
    
    static var topCorners: UIRectCorner {
        return [.topLeft, .topRight]
    }
    
    static var bottomCorners: UIRectCorner {
        return [.bottomLeft, .bottomRight]
    }
}

public struct ScreenSize {
    
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLenght = max(ScreenSize.width, ScreenSize.height)
    static let minLenght = min(ScreenSize.width, ScreenSize.height)
    static let isLarge: Bool = ScreenSize.width > 320
}

public struct DeviceType {
    
    static let isiPhone4OrLess =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght < 568.0
    static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 568.0
    static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 667.0
    static let isiPhone6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 736.0
    static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght >= 812.0
    static let isiPhoneMini = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght >= 812.0
    static let isiPad = UIDevice.current.userInterfaceIdiom == .pad
    static let isiPhoneProMax = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght >= 926.0
}



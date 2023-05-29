//
//  SearchTextField.swift
//  PM - sport club
//
//  Created by Арсентий Халимовский on 05.04.2023.
//

import UIKit

final class SearchTextField: UITextField {
    
    // MARK: - Private Properties
    
    private let textFieldPadding = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 60)
    
    //MARK: - Initializers
    
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Methods
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textFieldPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textFieldPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textFieldPadding)
    }
    
    // MARK: - Private Methods
    
    private func setupTextField(placeholder: String) {
        textColor = .black
        
        layer.cornerRadius = 20
        layer.backgroundColor = UIColor.white.cgColor
        
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.13).cgColor
        layer.shadowRadius = 6
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 3)
        
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        font = .boldSystemFont(ofSize: 17)
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}

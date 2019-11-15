//
//  ValidationResultCell.swift
//  CardValidationTest
//
//  Created by Станислав Шияновский on 11/15/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

public typealias ValidationCellViewModel = (cardNumber: String, brand: String?, validity: Bool, even: Bool)

public class ValidationResultCell: UITableViewCell {
    
    public static let reuseId = "ValidationResultCell"
    
    // MARK: UI elements -
    private var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    private var leftDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    private var brandLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    private var rightDivider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return view
    }()
    
    private var validityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        prepareCardNumberLabel()
        prepareLeftDivider()
        prepareBrandLabel()
        prepareRightDivider()
        prepareValidityLabel()
    }
    
    public func set(_ model: ValidationCellViewModel) {
        cardNumberLabel.text = model.cardNumber
        brandLabel.text = model.brand ?? "------------"
        validityLabel.text = model.validity ? "Valid" : "Invalid"
        backgroundColor = model.even == true ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    private func prepareCardNumberLabel() {
        addSubview(cardNumberLabel)
        let width = (UIScreen.main.bounds.width - 2)/3
        cardNumberLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cardNumberLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cardNumberLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        cardNumberLabel.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    private func prepareLeftDivider() {
        addSubview(leftDivider)
        leftDivider.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        leftDivider.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        leftDivider.leadingAnchor.constraint(equalTo: cardNumberLabel.trailingAnchor).isActive = true
        leftDivider.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func prepareBrandLabel() {
        addSubview(brandLabel)
        brandLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        brandLabel.leadingAnchor.constraint(equalTo: leftDivider.trailingAnchor).isActive = true
        brandLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        brandLabel.widthAnchor.constraint(equalTo: cardNumberLabel.widthAnchor).isActive = true
    }
    
    private func prepareRightDivider() {
        addSubview(rightDivider)
        rightDivider.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        rightDivider.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        rightDivider.leadingAnchor.constraint(equalTo: brandLabel.trailingAnchor).isActive = true
        rightDivider.widthAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    private func prepareValidityLabel() {
        addSubview(validityLabel)
        validityLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        validityLabel.leadingAnchor.constraint(equalTo: rightDivider.trailingAnchor).isActive = true
        validityLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        validityLabel.widthAnchor.constraint(equalTo: cardNumberLabel.widthAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

//
//  ResultsHeader.swift
//  CardValidationTest
//
//  Created by Станислав Шияновский on 11/15/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import UIKit

public class ResultsHeader: UIView {
    
    // MARK: UI elements
    private var cardNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Card Number"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
        label.text = "Brand"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
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
        label.text = "Validity"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        return label
    }()
    
    private var bottomLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return view
    }()
    
    public override func layoutSubviews() {
        
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        prepareCardNumberLabel()
        prepareLeftDivider()
        prepareBrandLabel()
        prepareRightDivider()
        prepareValidityLabel()
        prepareBottomLine()
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
    
    private func prepareBottomLine() {
        addSubview(bottomLine)
        bottomLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
}

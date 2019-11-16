//
//  MainViewController.swift
//  CardValidationTest
//
//  Created by Станислав Шияновский on 11/15/19.
//  Copyright © 2019 Станислав Шияновский. All rights reserved.
//

import CardValidator
import UIKit

public typealias CardModel = (number: String, scheme: String?, isValid: Bool)

public class MainViewController: UIViewController {
    
    // MARK: - UI elements
    private var resultsTableView = UITableView()
    
    // MARK: - Data
    private var paymentCards: [String] = []
    private var validatedData: [CardModel] = []
    private var currentIndex = 0
    
    public override func loadView() {
        super.loadView()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        getPaymentCards()
        prepareNavigation()
        prepareResultsTable()
    }
    
    private func prepareNavigation() {
        title = "Cards validation"
        let addCard = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(validateCardValue))
        navigationItem.rightBarButtonItem = addCard
    }
    
    private func prepareResultsTable() {
        resultsTableView.delegate = self
        resultsTableView.dataSource = self
        resultsTableView.tableFooterView = UIView()
        
        resultsTableView.register(ValidationResultCell.self, forCellReuseIdentifier: ValidationResultCell.reuseId)
        
        view.addSubview(resultsTableView)
        resultsTableView.translatesAutoresizingMaskIntoConstraints = false
        resultsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        resultsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        resultsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    private func getPaymentCards() {
        guard let cards = Bundle.main.path(forResource: "cards", ofType: "txt") else { return }
        if let allNumbers = try? String(contentsOfFile: cards) {
            paymentCards = allNumbers.components(separatedBy: "\n")
        }
    }
    
    @objc
    private func validateCardValue() {
        guard currentIndex < paymentCards.count else { return }
        let number = paymentCards[currentIndex]
        let validator = Validator(number)
        validator.validate { [weak self] (success, result, card) in
            let model = CardModel(number: number, scheme: card?.scheme.capitalized, isValid: success)
            self?.validatedData.append(model)
            self?.reloadData()
        }
        
        currentIndex += 1
    }
    
    private func reloadData() {
        DispatchQueue.main.async { [weak self] in
            self?.resultsTableView.reloadData()
            self?.resultsTableView.layoutIfNeeded()
        }
    }
}

extension MainViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return validatedData.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ValidationResultCell.reuseId, for: indexPath) as! ValidationResultCell
        let data = validatedData[indexPath.row]
        let even = (indexPath.row % 2 == 0)
        let model = ValidationCellViewModel(cardNumber: data.number, brand: data.scheme, validity: data.isValid, even: even)
        cell.set(model)
        return cell
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ResultsHeader()
    }
}

extension MainViewController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 47
    }
}

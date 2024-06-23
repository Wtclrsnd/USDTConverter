//
//  ViewController.swift
//  USDTConverter
//
//  Created by Emil Shpeklord on 23.06.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    private let presenter = MainPresenter(NetworkService())
    
    private let inset: CGFloat = 20
    
    private var usdtSellUsdValue: Double = 0
    private var usdtSellRubValue: Double = 0
    private var usdtBuyUsdValue: Double = 0
    private var usdtBuyRubValue: Double = 0
    
    private let defaultWorkedHours: Int = 40
    
    // MARK: - COURSE UI
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "USDT Converter"
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        return label
    }()
    
    private lazy var courseStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var usdtCourseLabel: UILabel = {
        let label = UILabel()
        label.text = "Course"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .systemPink
        label.textAlignment = .center
        return label
    }()
    
    private lazy var usdtUsdValueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(usdtSellUsdValue) USD"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var usdtRubValueLabel: UILabel = {
        let label = UILabel()
        label.text = "\(usdtSellRubValue) RUB"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var convertSalaryButton: UIButton = {
        let button = UIButton()
        button.setTitle("Convert Salary", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(convertSalaryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - SALARY UI
    private lazy var salaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Salary Calculator"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .systemPink
        return label
    }()
    
    private lazy var salaryStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = inset
        return stack
    }()
    
    private lazy var salaryTextField: InsetedTextField = {
        let textField = InsetedTextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemPink.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .numberPad
        textField.placeholder = "Salary in USD per hour"
        return textField
    }()
    
    private lazy var hoursTextField: InsetedTextField = {
        let textField = InsetedTextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemPink.cgColor
        textField.layer.borderWidth = 1
        textField.keyboardType = .numberPad
        textField.placeholder = "Worked out hours"
        textField.text = "\(defaultWorkedHours)"
        return textField
    }()
    
    private lazy var resultSalaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Please enter salary and hours"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .systemPink
        label.textAlignment = .center
        return label
    }()
    
    
    @objc private func convertSalaryButtonTapped() {
        guard let salary = salaryTextField.text,
              let hours = hoursTextField.text else { return }
        if salary.isEmpty || hours.isEmpty {
            resultSalaryLabel.text = "Enter salary and hours"
            return
        }
        if let salary = Double(salary), let hours = Int(hours) {
            let calculatedSalary = presenter.calculateSalaryInRub(salary: salary, hours: hours)
            let calculatedSalaryString = String(format: "%.1f", calculatedSalary)
            resultSalaryLabel.text = "Result salary \(calculatedSalaryString) RUB"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        Task {
            let model = try await presenter.getCurrencyModel()
            usdtUsdValueLabel.text = String(model?.usdtCourseInUsd ?? 0)
            usdtRubValueLabel.text = String(model?.usdtCourseInRub ?? 0)
        }
    }
    
    private func setupLayout() {
        view.backgroundColor = .white
        
        setupRemoveKeyboardGesture()
        setupNameLabel()
        setupCourseStack()
        setupSalaryStack()
        setupConvertSalaryButton()
    }
}

extension MainViewController {
    
    private func setupRemoveKeyboardGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    private func setupNameLabel() {
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: inset).isActive = true
    }
    
    private func setupCourseStack() {
        view.addSubview(courseStack)
        courseStack.translatesAutoresizingMaskIntoConstraints = false
        
        courseStack.addArrangedSubview(usdtCourseLabel)
        courseStack.addArrangedSubview(usdtUsdValueLabel)
        courseStack.addArrangedSubview(usdtRubValueLabel)
    
        
        courseStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset).isActive = true
        courseStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: inset).isActive = true
        courseStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupSalaryStack() {
        view.addSubview(salaryStack)
        salaryStack.translatesAutoresizingMaskIntoConstraints = false
        
        salaryStack.addArrangedSubview(salaryLabel)
        salaryStack.addArrangedSubview(salaryTextField)
        salaryStack.addArrangedSubview(hoursTextField)
        salaryStack.addArrangedSubview(resultSalaryLabel)
        
        salaryStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset).isActive = true
        salaryStack.topAnchor.constraint(equalTo: courseStack.bottomAnchor, constant: inset).isActive = true
        salaryStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setupConvertSalaryButton() {
        view.addSubview(convertSalaryButton)
        convertSalaryButton.translatesAutoresizingMaskIntoConstraints = false
        
        convertSalaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset).isActive = true
        convertSalaryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        convertSalaryButton.topAnchor.constraint(equalTo: salaryStack.bottomAnchor, constant: inset).isActive = true
        convertSalaryButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

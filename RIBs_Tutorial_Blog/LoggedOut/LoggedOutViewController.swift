//
//  LoggedOutViewController.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/03/02.
//

import RIBs
import RxSwift
import UIKit

protocol LoggedOutPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoggedOutViewController: UIViewController, LoggedOutPresentable, LoggedOutViewControllable {

    weak var listener: LoggedOutPresentableListener?
    
    private let firstTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Player 1"
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 20, weight: .semibold)
        return field
    }()
    
    private let secondTextField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Player 2"
        field.borderStyle = .roundedRect
        field.font = .systemFont(ofSize: 20, weight: .semibold)
        return field
    }()
    
    private lazy var enterButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemCyan
        btn.setTitle("Enter", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        btn.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 12
        btn.layer.cornerCurve = .continuous
        return btn
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUI()
    }
    
    private func setUI() {
        view.backgroundColor = .systemPink
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(firstTextField)
        stackView.addArrangedSubview(secondTextField)
        stackView.addArrangedSubview(enterButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            firstTextField.heightAnchor.constraint(equalToConstant: 40),
            secondTextField.heightAnchor.constraint(equalToConstant: 40),
            enterButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
    }
    
    @objc
    func enterAction() {
        print("탭탭탭 엔터 탭")
    }
}

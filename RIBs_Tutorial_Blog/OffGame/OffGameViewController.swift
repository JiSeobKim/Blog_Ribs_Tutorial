//
//  OffGameViewController.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/03/02.
//

import RIBs
import RxSwift
import UIKit

protocol OffGamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class OffGameViewController: UIViewController, OffGamePresentable, OffGameViewControllable {

    weak var listener: OffGamePresentableListener?
    
    private let player1Name: String
    private let player2Name: String
    
    private let player1Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let player2Label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var playButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("PLAY", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 50, weight: .bold)
        btn.backgroundColor = .systemCyan
        btn.layer.cornerRadius = 12
        btn.layer.cornerCurve = .continuous
        btn.addTarget(self, action: #selector(playAction), for: .touchUpInside)
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
    
    init(
        player1Name: String,
        player2Name: String
    ) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        super.init(nibName: nil, bundle: nil)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setUI() {
        view.backgroundColor = .systemOrange
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(player1Label)
        stackView.addArrangedSubview(player2Label)
        stackView.addArrangedSubview(playButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            player1Label.heightAnchor.constraint(equalToConstant: 50),
            player2Label.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func updateScore(playerScore1: String, playerScore2: String) {
        let player1Text = "\(player1Name) : \(playerScore1)"
        let player2Text = "\(player2Name) : \(playerScore2)"
        
        player1Label.text = player1Text
        player2Label.text = player2Text
    }
    
    @objc
    private func playAction() {
        print("플레이는 다음에!!")
    }
}

//
//  OffGameBuilder.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/03/02.
//

import RIBs
import RxRelay
import RxSwift

struct GameScore {
    var player1Score: Int
    var player2Score: Int
}


protocol OffGameDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class OffGameComponent: Component<OffGameDependency> {
    fileprivate var player1Name: String
    fileprivate var player2Name: String
    fileprivate var score: BehaviorRelay<GameScore>
    
    init(
        dependency: OffGameDependency,
        player1Name: String,
        player2Name: String
    ) {
        self.player1Name = player1Name
        self.player2Name = player2Name
        self.score = .init(value: GameScore(player1Score: 0, player2Score: 0))
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol OffGameBuildable: Buildable {
    func build(withListener listener: OffGameListener, player1: String, player2: String) -> OffGameRouting
}

final class OffGameBuilder: Builder<OffGameDependency>, OffGameBuildable {

    override init(dependency: OffGameDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: OffGameListener, player1: String, player2: String) -> OffGameRouting {
        
        let component = OffGameComponent(dependency: dependency, player1Name: player1, player2Name: player2)
        let viewController = OffGameViewController(
            player1Name: component.player1Name,
            player2Name: component.player2Name
        )
        let interactor = OffGameInteractor(
            presenter: viewController,
            score: component.score
        )
        
        interactor.listener = listener
        return OffGameRouter(interactor: interactor, viewController: viewController)
    }
}

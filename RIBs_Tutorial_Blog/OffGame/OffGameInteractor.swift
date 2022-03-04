//
//  OffGameInteractor.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/03/02.
//

import RIBs
import RxSwift
import RxRelay

protocol OffGameRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol OffGamePresentable: Presentable {
    var listener: OffGamePresentableListener? { get set }
    
    // 추가
    func updateScore(playerScore1: String, playerScore2: String)
    
}

protocol OffGameListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class OffGameInteractor: PresentableInteractor<OffGamePresentable>, OffGameInteractable, OffGamePresentableListener {

    weak var router: OffGameRouting?
    weak var listener: OffGameListener?

    private let score: BehaviorRelay<GameScore>
    
    init(
        presenter: OffGamePresentable,
        score: BehaviorRelay<GameScore>
    ) {
        self.score = score
        super.init(presenter: presenter)
        presenter.listener = self
    }
    

    override func didBecomeActive() {
        super.didBecomeActive()
        
        score
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { score in
                let score1 = String(score.player1Score)
                let score2 = String(score.player2Score)
                
                self.presenter.updateScore(playerScore1: score1, playerScore2: score2)
                
            }).disposeOnDeactivate(interactor: self)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}

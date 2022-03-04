//
//  RootInteractor.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/02/28.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func attachLoggedOut()
    func detachLoggedOut()
    func attachOffGame(player1: String, player2: String)
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {

    weak var router: RootRouting?
    weak var listener: RootListener?

    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        router?.attachLoggedOut()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func loggedOutDidTapEnter(player1: String, player2: String) {
        router?.detachLoggedOut()
        router?.attachOffGame(player1: player1, player2: player2)
    }
}

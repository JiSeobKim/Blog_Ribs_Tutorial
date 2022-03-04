//
//  LoggedOutInteractor.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/03/02.
//

import RIBs
import RxSwift

protocol LoggedOutRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoggedOutListener: AnyObject {
    func loggedOutDidTapEnter(player1: String, player2: String)
    
}

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable, LoggedOutPresentableListener {

    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didTapEnter(player1: String?, player2: String?) {
        let name1 = (player1 == nil || player1?.isEmpty == true) ? "Player 1" :  player1!
        let name2 = (player2 == nil || player2?.isEmpty == true) ? "Player 2" :  player2!
        
        listener?.loggedOutDidTapEnter(player1: name1, player2: name2)
    }
}

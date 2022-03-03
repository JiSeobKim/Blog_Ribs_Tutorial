//
//  RootRouter.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/02/28.
//

import RIBs

protocol RootInteractable: Interactable, LoggedOutListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {

    private let loggedOutBuildable: LoggedOutBuildable
    private var loggedOutRouting: Routing?
    
    init(
        interactor: RootInteractable,
        viewController: RootViewControllable,
        loggedOutBuildable: LoggedOutBuildable
    ) {
        self.loggedOutBuildable = loggedOutBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachLoggedOut() {
        guard loggedOutRouting == nil else { return }
        
        let router = loggedOutBuildable.build(withListener: interactor)
        
        attachChild(router)
        loggedOutRouting = router
        
        viewControllable.present(
            router.viewControllable,
            animated: true,
            completion: nil
        )
    }
}

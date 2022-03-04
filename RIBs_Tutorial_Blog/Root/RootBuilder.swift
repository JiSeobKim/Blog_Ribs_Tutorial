//
//  RootBuilder.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/02/28.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency>, LoggedOutDependency, OffGameDependency {

}

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        
        let loggedOutBuilder = LoggedOutBuilder(dependency: component)
        let offGameBuilder = OffGameBuilder(dependency: component)
        
        return RootRouter(
            interactor: interactor,
            viewController: viewController,
            loggedOutBuildable: loggedOutBuilder,
            offGameBuildable: offGameBuilder
        )
    }
}

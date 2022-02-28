//
//  AppComponent.swift
//  RIBs_Tutorial_Blog
//
//  Created by 김지섭 on 2022/02/28.
//

import RIBs

class AppComponent: Component<EmptyComponent>, RootDependency {
    
    init() {
        let emptyComponent = EmptyComponent()
        super.init(dependency: emptyComponent)
    }
}

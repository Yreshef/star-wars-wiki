//
//  DependencyContainer.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 7/31/21.
//

import Foundation

protocol DependencyContaining {
    func initializeServices()
    
    var logger: Logging { get }
    var networkService: NetworkServicing { get }
    var swapiInteractor: SWAPIInteracting { get }
}

class DependencyContainer: DependencyContaining {
    let logger: Logging = Logger()
    let networkService: NetworkServicing = NetworkService()
    lazy var swapiInteractor: SWAPIInteracting = SWAPIInteractor(networkService: networkService)
    
    func initializeServices() {
        //Services that require manual launch
    }
    
    static let shared: DependencyContaining = DependencyContainer()
    
    private init() {
        
    }
}

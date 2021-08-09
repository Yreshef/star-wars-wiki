//
//  SWAPIInteractor.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 01/08/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import Foundation
import Combine

protocol SWAPIInteracting {
//    func requestPerson(id: String, completion: @escaping (NetworkResult<Person>) -> Void)
//
//    func requestFilm(id: String, completion: @escaping (NetworkResult<Film>) -> Void)
//
//    func requestPeople(completion: @escaping (NetworkResult<SWAPIResponse<Person>>)-> Void)
    func requestPerson(id: String) -> AnyPublisher<Person, NetworkError>
}


enum SWAPIRoute: Route {
    private var path: String {
        "https://swapi.dev/api/"
    }
    
    case person(id: String)
    case film(id: String)
    case people
    
    var urlPath: String {
        switch self {
        case .person(let id):
            return "\(path)/people/\(id)"
        case .film(let id):
            return "\(path)/films/\(id)"
        case .people:
            return "\(path)/people/"
        }
        
    }
}

class SWAPIInteractor: SWAPIInteracting{
    
    // MARK: - Properties | Dependencies
    
    private let networkService: NetworkServicing
    
    // MARK: - Properties | Constants&Variables
    
    
    // MARK: - LifeCycle
    
    init(networkService: NetworkServicing) {
        self.networkService = networkService
    }
    
    // MARK: - Methods
    
//    func requestPerson(id: String, completion: @escaping (NetworkResult<Person>) -> Void) {
//        networkService.request(type: Person.self, route: .SWAPI(route: .person(id: id)), completion: completion)
//    }
//
//    func requestFilm(id: String, completion: @escaping (NetworkResult<Film>) -> Void){
//        networkService.request(type: Film.self, route: .SWAPI(route: .film(id: id)), completion: completion)
//    }
//
//    func requestPeople(completion: @escaping (NetworkResult<SWAPIResponse<Person>>)-> Void) {
//        networkService.request(type: SWAPIResponse<Person>.self, route: .SWAPI(route: .people), completion: completion)
//    }
    
    func requestPerson(id: String) -> AnyPublisher<Person, NetworkError> {
        networkService.request(type: Person.self, route: .SWAPI(route: .person(id: id)))
    }
}

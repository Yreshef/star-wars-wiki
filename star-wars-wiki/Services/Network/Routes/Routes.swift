//
//  Routes.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 31/07/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import Foundation

protocol Route {
    var urlPath: String { get }
}

enum NetworkRoutes: Route {
    case SWAPI(route: SWAPIRoute)
    
    var urlPath: String {
        switch self {
        case .SWAPI(let route):
            return route.urlPath
        }
    }
}



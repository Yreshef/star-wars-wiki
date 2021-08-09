//
//  SWAPIResponse.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 02/08/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import Foundation

struct SWAPIResponse<T: Decodable>: Decodable{
    var count: Int
    var next: String?
    var previous: String?
    var results: [T]
}

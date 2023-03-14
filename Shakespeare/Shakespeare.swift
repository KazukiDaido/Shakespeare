//
//  Shakespeare.swift
//  Shakespeare
//
//  Created by 大道一輝 on 2023/02/28.
//

import Foundation

struct Shakespeare: Hashable, Codable {
    var name: String
    var note: String
    var age: Int
    var registerDate: String
}

struct Success : Hashable, Codable {
    var success: Bool
    var data: [Shakespeare]
}

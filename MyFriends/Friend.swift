//
//  Friend.swift
//  MyFriends
//
//  Created by Kristina Korotkova on 11.01.2024.
//

import Foundation

struct Friend: Equatable, Identifiable {
    var id: UUID
    var name: String
    var birthday: String
    var gender: String
}

//
//  Models.swift
//  vK-App
//
//  Created by ZveroKos.TV on 01.02.2020.
//  Copyright © 2020 Aleksandr Kosarev. All rights reserved.
//

import Foundation

struct User {
    var username: String
    var surname: String
    var isOnline: Bool
    var avatarPath: String
}

struct Group: Equatable {
    var groupname: String
    var avatarPath: String
}

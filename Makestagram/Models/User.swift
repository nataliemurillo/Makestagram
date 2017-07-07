//
//  User.swift
//  Makestagram
//
//  Created by Natalie Murillo on 7/5/17.
//  Copyright © 2017 Natalie Murillo. All rights reserved.
//

import Foundation
import FirebaseDatabase

class User {
    
    // MARK: - Properties
    
    let uid: String
    let username: String
    
    // MARK: - Init
    
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
    }
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        
        self.uid = snapshot.key
        self.username = username
    }
    private static var _current: User?
    static var current: User {
}

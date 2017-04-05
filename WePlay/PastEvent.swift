//
//  PastEvent.swift
//  WePlay
//
//  Created by Vincent Liu on 3/14/17.
//  Copyright © 2017 WePlay. All rights reserved.
//

internal class PastEvent {
    internal let id: String
    internal let name: String
    internal let photoUrl: String
    
    init(id: String, name: String, photoUrl: String) {
        self.id = id
        self.name = name
        self.photoUrl = photoUrl
    }
}


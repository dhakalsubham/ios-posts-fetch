//
//  Post.swift
//  APITest
//
//  Created by Subham Dhakal on 6/3/24.
//

import Foundation

struct Post:Decodable,Identifiable, Equatable{
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

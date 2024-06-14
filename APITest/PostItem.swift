//
//  PostItem.swift
//  APITest
//
//  Created by Subham Dhakal on 6/8/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
class PostItem:Identifiable{
    var id:String
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.id = UUID().uuidString
        self.title = title
        self.body = body
    }
}

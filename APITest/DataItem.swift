//
//  DataItem.swift
//  APITest
//
//  Created by Subham Dhakal on 6/8/24.
//

import Foundation
import SwiftData

@available(iOS 17, *)
@Model
class DataItem: Identifiable{

    var id:String
    var name:String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
    
}

//
//  Item.swift
//  AvaFinanceApp
//
//  Created by Joe Reger on 12/27/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}

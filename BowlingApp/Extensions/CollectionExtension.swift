//
//  CollectionExtension.swift
//  BowlingApp
//
//  Created by Lionel Delvaux on 08/10/2020.
//

import Foundation

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

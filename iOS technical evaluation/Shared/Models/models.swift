//
//  models.swift
//  iOS technical evaluation
//
//  Created by Jiren on 05/01/21.
//

import Foundation

// MARK: - RowModelElement
struct RowModelElement: Codable {
    let title, subtitle: String
    let day: Int
}

typealias RowModel = [RowModelElement]

public extension Int {
    var asWord: String {
    let numberValue = NSNumber(value: self)
    let formatter = NumberFormatter()
    formatter.numberStyle = .spellOut
    return formatter.string(from: numberValue)!
  }
}

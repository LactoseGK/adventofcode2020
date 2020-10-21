//
//  Direction.swift
//  AdventOfCode2020
//
//  Created by Geir-Kåre S. Wærp on 21/10/2020.
//

import Foundation

enum Direction: Int, CaseIterable {
    case north = 1
    case south = 2
    case west = 3
    case east = 4
    
    var movementVector: IntPoint {
        switch self {
        case .north: return IntPoint(x: 0, y: -1)
        case .south: return IntPoint(x: 0, y: 1)
        case .west: return IntPoint(x: -1, y: 0)
        case .east: return IntPoint(x: 1, y: 0)
        }
    }
    
    var reversed: Direction {
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
    
    mutating func turn(left: Bool) {
        switch self {
        case .north: self = left ? .west : .east
        case .south: self = left ? .east : .west
        case .east: self = left ? .north : .south
        case .west: self = left ? .south : .north
        }
    }
    
    static func from(string: String) -> Direction {
        switch string {
        case "U", "N": return .north
        case "D", "S": return .south
        case "L", "W": return .west
        case "R", "E": return .east
        default: fatalError()
        }
    }
}

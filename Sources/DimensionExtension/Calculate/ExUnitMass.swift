//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/9.
//

import Foundation

extension UnitMass {
    public func uString(_ unit: String) -> UnitMass {
        switch unit {
            case "kg":
                return .kilograms
            case "g":
                return .grams
            case "dg":
                return .decigrams
            case "cg":
                return .centigrams
            case "mg":
                return .milligrams
            case "ug":
                return .micrograms
            case "ng":
                return .nanograms
            case "pg":
                return .picograms
            default:
                return .kilograms
        }
    }
}

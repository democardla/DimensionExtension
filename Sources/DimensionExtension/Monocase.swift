//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

struct Monocase {
    var moleMass: Double = 0
    static var unit = UnitConcentrationMass.gramsPerLiter
    var concentration: Concentration
    
    init(moleMass: Double, value: Double, unit: String) {
        self.moleMass = moleMass
        self.concentration = Concentration(value: value, unit: Monocase.unit.uString(unit, moleMass))
    }
    
}

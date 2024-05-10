//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/11.
//

import Foundation

@propertyWrapper
public struct TimesConcentrationWrapper: DataWrapperPublicHandle {
    public typealias T = TimesConcentration
    public init(wrappedValue: T, moleMass: Double) {
        self.value = wrappedValue
        self.moleMass = moleMass
    }
    
    public init() {
        moleMass = 0
        self.value = T(value: 0, unit: .time)
    }
    
    public init(value: Double) {
        self.init()
        self.value = T(value: value, unit: .time)
    }
    
    public var wrappedValue: T {
        get { value }
        set { value = newValue }
    }
    
    
    public var moleMass: Double
    public var value: T
}

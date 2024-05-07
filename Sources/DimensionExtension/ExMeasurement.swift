//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

///`Measurement`的重命名
typealias Concentration = Measurement<UnitConcentrationMass>
typealias Mass = Measurement<UnitMass>
typealias Volume = Measurement<UnitVolume>

// MARK: 对`Measurement`的扩展
extension Measurement {
    /// 使用质量和体积计算浓度
    /// - Parameters:
    ///   - lh: 质量
    ///   - rh: 体积
    /// - Returns: 浓度
    static func / (lh: Mass, rh: Volume) -> Concentration {
        let result = lh.converted(to: .grams).value / rh.converted(to: .liters).value
        return Concentration(value: result, unit: .gramsPerLiter)
    }
}

// MARK: 对`Concentration`的扩展
extension Concentration {
    
    /// 通过单位文本改变`Concentration`原有的单位为目标单位
    /// - Parameter to: 想要转换到的单位文本
    mutating func convert(to: String) {
        let handle = self.unit.uString(to)
        self.convert(to: handle)
    }
    mutating func convert(to: String, _ gramsPerMole: Double) {
        let handle = self.unit.uString(to, gramsPerMole)
        self.convert(to: handle)
    }
    
    /// 通过单位文本返回一个新的带有目标单位的`Concentration`
    /// - Parameter to: 想要转换到的单位文本
    /// - Returns: 一个新的带有目标单位的`Concentration`
    func converted(to: String) -> Concentration {
        let handle = self.unit.uString(to)
        return self.converted(to: handle)
    }
    
    func converted(to: String, _ gramsPerMole: Double) -> Concentration {
        let handle = self.unit.uString(to, gramsPerMole)
        return self.converted(to: handle)
    }
}

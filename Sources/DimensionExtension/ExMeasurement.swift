//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

///`Measurement`的重命名
public typealias Concentration = Measurement<UnitConcentrationMass>
public typealias Mass = Measurement<UnitMass>
public typealias Volume = Measurement<UnitVolume>
public typealias Mole = Measurement<UnitMole>

// MARK: 对`Measurement`的扩展
extension Measurement {
    /// 使用质量和体积计算质量浓度
    /// - Parameters:
    ///   - lh: 质量
    ///   - rh: 体积
    /// - Returns: 浓度
    public static func / (lh: Mass, rh: Volume) -> Concentration {
        let result = lh.converted(to: .grams).value / rh.converted(to: .liters).value
        return Concentration(value: result, unit: .gramsPerLiter)
    }
    
    /// 使用单体与体积计算质量浓度
    /// - Parameters:
    ///   - lh: 单体``Monocase``
    ///   - rh: 体积
    /// - Returns: 质量浓度，计量单位是“g/L”
    public static func / (lh: Monocase, rh: Volume) -> Concentration {
        return lh.mass / rh
    }
    
    /// 使用摩尔单体和体积计算摩尔浓度
    /// - Parameters:
    ///   - lh: 摩尔单体``MoleMonocase``
    ///   - rh: 体积
    /// - Returns: 摩尔浓度
    public static func / (lh: MoleMonocase, rh: Volume) -> Concentration {
        let result = lh.mole.converted(to: .baseUnit()).value / rh.converted(to: .baseUnit()).value
        return Concentration(value: result, unit: .molesPerLiter(withGramsPerMole: lh.moleMass))
    }
}

// MARK: 对`Concentration`的扩展
extension Concentration {
    
    /// 通过单位文本改变`Concentration`原有的单位为目标单位
    /// - Parameter to: 想要转换到的单位文本
    public mutating func convert(to: String) {
        let handle = self.unit.uString(to)
        self.convert(to: handle)
    }
    public mutating func convert(to: String, _ gramsPerMole: Double) {
        let handle = self.unit.uString(to, gramsPerMole)
        self.convert(to: handle)
    }
    
    /// 通过单位文本返回一个新的带有目标单位的`Concentration`
    /// - Parameter to: 想要转换到的单位文本
    /// - Returns: 一个新的带有目标单位的`Concentration`
    public func converted(to: String) -> Concentration {
        let handle = self.unit.uString(to)
        return self.converted(to: handle)
    }
    
    public func converted(to: String, _ gramsPerMole: Double) -> Concentration {
        let handle = self.unit.uString(to, gramsPerMole)
        return self.converted(to: handle)
    }
}

//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation


// MARK: 对`Measurement`的扩展
extension Measurement {
    /// 使用质量和体积计算质量浓度
    /// - Parameters:
    ///   - lh: 质量
    ///   - rh: 体积
    /// - Returns: 质量浓度
    public static func / (lh: Mass, rh: Volume) -> Concentration {
        let result = lh.converted(to: .grams).value / rh.converted(to: .liters).value
        return Concentration(value: result, unit: .gramsPerLiter)
    }
    
    /// 使用质量和体积计算质量浓度
    /// - Parameters:
    ///   - lh: 摩尔
    ///   - rh: 体积
    /// - Returns: 摩尔浓度
    public static func / (lh: MoleWrapper, rh: Volume) -> Concentration {
        let result = lh.value.converted(to: .baseUnit()).value / rh.converted(to: .liters).value
        return Concentration(value: result, unit: .molesPerLiter(withGramsPerMole: lh.moleMass))
    }
    
}


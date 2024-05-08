//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/8.
//

import Foundation

// MARK: 对`UnitConcentrationMass`的扩展。
/// 质量浓度
extension UnitConcentrationMass {

    public static let massC = ["kg/L", "g/mL", "g/L", "mg/mL", "mg/L", "ng/L"]
    
    /// kg/L
    public class var kilogramsPerLiter: UnitConcentrationMass {
        return getCustomUnit(coefficient: .thousand(1), symbol: "kg/L")
    }
    
    /// g/mL
    public class var gramsPerMilliliter: UnitConcentrationMass {
        return getCustomUnit(coefficient: .thousand(1), symbol: "g/mL")
    }
    
    /// mg/mL
    public class var millgramsPerMilliliter: UnitConcentrationMass {
        return getCustomUnit(coefficient: 1, symbol: "mg/mL")
    }

    /// mg/L
    public class var millgramsPerLiter: UnitConcentrationMass {
        return getCustomUnit(coefficient: .thousand(-1), symbol: "mg/L")
    }
    
    /// ng/L
    public class var nanogramsPerLiter: UnitConcentrationMass {
        return getCustomUnit(coefficient: .thousand(-2), symbol: "ng/L")
    }
    
    /// 通过单位字符获得单位
    /// - Parameter
    ///     - unit: 单位字符
    ///         |unit|return|
    ///         |---|---|
    ///         |kg/L| .kilogramsPerLiter|
    ///         |g/L| .gramsPerLiter|
    ///         |mg/L| .millgramsPerLiter|
    ///         |ng/L| .nanogramsPerLiter|
    ///         |default| .gramsPerLiter|
    /// - Returns: 质量浓度的度量单位
    public func uString(_ unit: String) -> UnitConcentrationMass {
        switch unit {
            case "kg/L":
                return .kilogramsPerLiter
            case "g/mL":
                return .gramsPerMilliliter
            case "mg/mL":
                return .millgramsPerMilliliter
            case "mg/L":
                return .millgramsPerLiter
            case "ng/L":
                return .nanogramsPerLiter
            default:
                return .gramsPerLiter
        }
    }
}


///摩尔浓度
extension UnitConcentrationMass {
    public static let moleC = ["mol/L", "mmol/L", "umol/L", "nmol/L"]
    /// M
    /// - Parameter gramsPerMole: 对应元素或者化学分子的摩尔质量
    /// - Returns: 质量浓度的度量单位
    public class func molesPerLiter(withGramsPerMole gramsPerMole: Double) -> UnitConcentrationMass {
        return getCustomUnit(coefficient: gramsPerMole, symbol: "mol/L")
    }
    
    /// uM
    /// - Parameter gramsPerMole: 对应元素或者化学分子的摩尔质量
    /// - Returns: 质量浓度的度量单位
    public class func micromolesPerLiter(withGramsPerMole gramsPerMole: Double) -> UnitConcentrationMass {
        return getCustomUnit(coefficient: gramsPerMole * .thousand(-2), symbol: "umol/L")
    }
    
    /// nM
    /// - Parameter gramsPerMole: 对应元素或者化学分子的摩尔质量
    /// - Returns: 质量浓度的度量单位
    public class func nanomolesPerLiter(withGramsPerMole gramsPerMole: Double) -> UnitConcentrationMass {
        return getCustomUnit(coefficient: gramsPerMole * .thousand(-3), symbol: "nmol/L")
    }
    /// 通过单位字符和摩尔质量获得单位
    /// - Parameters:
    ///   - unit: 单位字符
    ///
    ///     |unit|return|
    ///     |---|---|
    ///     |mol/L|.molesPerLiter(withGramsPerMole: gramsPerMole)|
    ///     |mmol/L|.millimolesPerLiter(withGramsPerMole: gramsPerMole)|
    ///     |nmol/L|.nanomolesPerLiter(withGramsPerMole: gramsPerMole)|
    ///   - gramsPerMole: 摩尔质量
    /// - Returns: 质量浓度的度量单位
    public func uString(_ unit: String, _ gramsPerMole: Double) -> UnitConcentrationMass {
        switch unit {
            case "mol/L":
                return .molesPerLiter(withGramsPerMole: gramsPerMole)
            case "mmol/L":
                return .millimolesPerLiter(withGramsPerMole: gramsPerMole)
            case "umol/L":
                return .micromolesPerLiter(withGramsPerMole: gramsPerMole)
            case "nmol/L":
                return .nanomolesPerLiter(withGramsPerMole: gramsPerMole)
            default:
                return .gramsPerLiter
        }
    }
}

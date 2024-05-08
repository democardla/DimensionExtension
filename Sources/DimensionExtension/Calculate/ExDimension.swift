//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

// MARK: 对`Dimension`的扩展
extension Dimension {
    /// 自定义单位
    /// - Parameters:
    ///   - coefficient: 系数
    ///   - symbol: 单位文字
    /// - Returns: 对应的度量单位
    ///
    /// 是创建`UnitConverterLinear`和`Dimension`子类的组合方法
    fileprivate static func getCustomUnit(
        coefficient: Double,
        symbol: String
    ) -> Self {
        let converter = UnitConverterLinear(coefficient: coefficient)
        return Self(symbol: symbol, converter: converter)
    }
}

// MARK: 对`UnitConcentrationMass`的扩展。
extension UnitConcentrationMass {

    public static let moleC = ["mol/L", "mmol/L", "umol/L", "nmol/L"]
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
    
    /// 通过单位字符和摩尔质量获得单位
    /// - Parameters:
    ///   - unit: 单位字符
    ///
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

// MARK: 对`UnitVolume`的扩展
extension UnitVolume {
    /// uL
    public class var micorliter: UnitVolume {
        return getCustomUnit(coefficient: .thousand(-2), symbol: "uL")
    }
    
    /// 立方厘米
    public class var cubicCentimeters: UnitVolume {
        return getCustomUnit(coefficient: .thousand(-1), symbol: "cm³")
    }
    
}

/// 自定义的倍速浓度单位
///
/// |Name|Method|Symbol|Coefficient|
/// |-|-|-|-|
/// |Time|``time``|X|1.0|
public class UnitChemicalConcentration: Dimension {
    
    /// 设置基础单位
    /// - Returns: 基础单位为``time``
    /// - Important: 返回值需要进行类型强行转换。
    public override class func baseUnit() -> Self {
        return self.time as! Self
    }
    
    /// The grams per liter unit of concentration.
    public class var time: UnitChemicalConcentration {
        return getCustomUnit(coefficient: 1, symbol: "X")
    }
    
    public static let unitArray = ["X"]
}

/// 自定义物质的量单位
///
/// |Name|Method|Symbol|Coefficient|
/// |-|-|-|-|
/// |Mole|``mole``|mole|1.0|
/// |Millimole|``mmole``|mmole|e-3|
/// |Micromole|``umole``|umole|e-6|
/// |Nanomole|``nmole``|nmole|e-9|
public class UnitMole: Dimension {
    /// 设置基础单位
    /// - Returns: 基础单位为``mole``
    public override class func baseUnit() -> Self {
        return self.mole as! Self
    }
    
    /// mole
    public class var mole: UnitMole {
        return getCustomUnit(coefficient: 1, symbol: "mole")
    }
    
    /// millimole
    public class var mmole: UnitMole {
        return getCustomUnit(coefficient: .thousand(-1), symbol: "mmole")
    }
    
    /// micromole
    public class var umole: UnitMole {
        return getCustomUnit(coefficient: .thousand(-2), symbol: "umole")
    }
    
    /// nanomole
    public class var nmole: UnitMole {
        return getCustomUnit(coefficient: .thousand(-3), symbol: "nmole")
    }
}



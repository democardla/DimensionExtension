//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/8.
//

import Foundation

/// 自定义物质的量单位
///
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

extension UnitMole {
    public func uString(_ unit: String) -> UnitMole {
        switch unit {
            case "mole":
                return .mole
            case "mmole":
                return .mmole
            case "umole":
                return .umole
            case "nmole":
                return .nmole
            default:
                return .mole
        }
    }
}


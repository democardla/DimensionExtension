//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/8.
//

import Foundation

/// 自定义的倍速浓度单位
///
/// |Name|Method|Symbol|Coefficient|
/// |-|-|-|-|
/// |Time|``time``|X|1.0|
public class UnitTimesConcentration: Dimension {
    
    /// 设置基础单位
    /// - Returns: 基础单位为``time``
    /// - Important: 返回值需要进行类型强行转换。
    public override class func baseUnit() -> Self {
        return self.time as! Self
    }
    
    /// The grams per liter unit of concentration.
    public class var time: UnitTimesConcentration {
        return getCustomUnit(coefficient: 1, symbol: "X")
    }
    
    public static let unitArray = ["X"]
    
}

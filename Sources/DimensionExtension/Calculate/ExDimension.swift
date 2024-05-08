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
    static func getCustomUnit(
        coefficient: Double,
        symbol: String
    ) -> Self {
        let converter = UnitConverterLinear(coefficient: coefficient)
        
        return Self(symbol: symbol, converter: converter)
    }
}







//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation

// MARK: 对`Double`的扩展
extension Double {
    
    /// 返回10的`index`次方
    /// - Parameter index: 次方数
    /// - Returns: 返回计算值
    /// - Authors: Demo Cardla
    static func exp(_ index: Int) -> Double {
        return pow(10, Double(index))
    }
    
    /// 千为底的`index`次幂
    /// - Parameter index: 指数
    /// - Returns: 幂
    static func thousand(_ index: Int) -> Double {
        return exp(3*(index))
    }
    
}

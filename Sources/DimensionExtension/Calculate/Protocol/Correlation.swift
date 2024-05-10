import Foundation

/// 相关关系描述协议
public protocol Correlation {
    associatedtype X
    associatedtype Y
    
    /// 相关关系中的自变量
    var x: X { get }
    /// 相关关系中的应变量
    var y: Y { get }
    
    /// 线性相关关系描述
    var converter: UnitConverterLinear { get }

    /// 相关关系的变量间相互转化
    /// - Parameter X: 自变量
    /// - Returns: 应变量
    func x2y(_ X: X) -> Y
    
    /// 相关关系的变量间相互转化
    /// - Parameter Y: 应变量
    /// - Returns: 自变量
    func y2x(_ Y: Y) -> X
}

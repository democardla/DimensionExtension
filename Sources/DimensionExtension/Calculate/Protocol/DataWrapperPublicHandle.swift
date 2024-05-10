import Foundation

public protocol DataWrapperPublicHandle {
    associatedtype T
    
    /// 定量值
    var value: T { get }
    
    var wrappedValue: T { get set }
    
    /// 摩尔质量
    var moleMass: Double { get }
    
    init(wrappedValue: T, moleMass: Double)

    init()
    
}

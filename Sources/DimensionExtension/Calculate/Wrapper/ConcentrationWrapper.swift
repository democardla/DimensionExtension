//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/7.
//

import Foundation


@propertyWrapper
/// <#Description#>
public struct ConcentrationWrapper{
    
    /// 浓度值
    private var value: Concentration = Concentration(value: 0, unit: .gramsPerLiter)
    public var wrappedValue: Concentration {
        get { value }
        set { 
            value = newValue
        }
    }
    
    /// 摩尔质量
    public let moleMass: Double
    
    private var moleC: [String] = ["mol/L", "mmol/L", "umol/L", "nmol/L"]
    private var massC: [String] = ["kg/L", "g/L", "mg/L", "ng/L"]
    private var timeC: [String] {
        return ["X"]
    }
    
    /// 打印值
    public var projectedValue: String {
        return "原子质量：\(moleMass)；浓度：\(value)"
    }
    
    /// 当前单位符号集
    private var currentC: [String] {
        let symbol = wrappedValue.unit.symbol
        if moleC.contains(symbol) {
            return moleC
        } else if massC.contains(symbol) {
            return massC
        }
        
        return timeC
    }
    
    /// 单位转换
    /// - Parameter to: 单位符号
    public mutating func convert(to: String) {
        if moleC.contains(to) {
            wrappedValue.convert(to: to, moleMass)
            return
        }
        wrappedValue.convert(to: to)
    }
    
    /// 返回单位转换后的浓度值
    /// - Parameter to: 单位符号
    /// - Returns: 摩尔浓度||质量浓度
    public func converted(to: String) -> Concentration {
        if moleC.contains(to) {
            return wrappedValue.converted(to: to, moleMass)
        }
        return wrappedValue.converted(to: to)
    }
    
    /// 把单位向上或向下转换一个进制
    /// - Parameter
    ///     - offset: 向大单位转化使用
    ///
    ///     |Value|Description|
    ///     |-|-|
    ///     | -1|单位减小，数值增加|
    ///     | 1|单位增加，数值减小|
    public mutating func convert(_ offset: Int) throws {
        let current = value.unit.symbol
        guard let index = currentC.firstIndex(of: current) else {
            throw NSError(domain: "输入不正确", code: 1, userInfo: nil) as Error
        }
        if index != 0 && index != currentC.endIndex - 1 {
            let newIndex = index - offset
            convert(to: currentC[newIndex])
        }
    }
    
    /// 默认初始化器不要忘记重写
    public init() {
        moleMass = 0
    }
    
    public init(moleMass: Double, value: Double, unit: String) {
        self.moleMass = moleMass
        let unitMass = self.value.unit.uString(unit, moleMass)
        self.value = Concentration(value: value, unit: unitMass)
        
    }
    
    public init(wrappedValue: Concentration, moleMass: Double) {
        self.moleMass = moleMass
        value = wrappedValue
    }
}

import Foundation

///``ConcentrationWrapper``与``TimesConcentration``的相关关系描述与计算方法
public struct CTCorrelation: Correlation {
    public typealias X = ConcentrationWrapper
    
    public typealias Y = TimesConcentrationWrapper
    
    /// 自变量
    public var x: X
    public var y: Y
    
    var coefficient: Double { return x.value.value / y.value.value }
    
    public var converter: UnitConverterLinear {
        return UnitConverterLinear(coefficient: coefficient)
    }
    
    public func x2y(_ X: X) -> Y {
        let value = converter.value(fromBaseUnitValue: X.value.value)
        @TimesConcentrationWrapper(value: value) var res
        return _res
    }
    

    public func y2x(_ Y: Y) -> X {
        let value = converter.baseUnitValue(fromValue: Y.value.value)
        @ConcentrationWrapper(moleMass: self.x.moleMass, value: value, unit: self.x.value.unit.symbol) var res
        return _res
    }

}



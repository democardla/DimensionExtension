import Foundation




///``ConcentrationWrapper``与``TimesConcentration``的相关关系描述与计算方法
public struct CTCorrelation: Correlation {
    
    /// 自变量
    public var x: ConcentrationWrapper
    public var y: TimesConcentration
    
    var coefficient: Double { return x.value.value / y.value }
    
    public var converter: UnitConverterLinear {
        return UnitConverterLinear(coefficient: coefficient)
    }
    
    public func x2y(_ X: ConcentrationWrapper) -> TimesConcentration {
        let value = converter.value(fromBaseUnitValue: X.value.value)
        return TimesConcentration(value: value, unit: .time)
    }
    

    public func y2x(_ Y: TimesConcentration) -> ConcentrationWrapper {
        let value = converter.baseUnitValue(fromValue: Y.value)
        @ConcentrationWrapper(moleMass: self.x.moleMass, value: value, unit: self.x.value.unit.symbol) var res
        return _res
    }
}



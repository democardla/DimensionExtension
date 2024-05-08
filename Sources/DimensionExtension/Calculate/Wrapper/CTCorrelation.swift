import Foundation

/// 相关关系
///
///
public struct CTCorrelation {
    
    /// 自变量
    var x: ConcentrationWrapper
    var y: TimesConcentration
    
    private var coefficient: Double { return x.value.value / y.value }
    
    var converter: UnitConverterLinear {
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

//protocol Correlation {
//    <#requirements#>
//}

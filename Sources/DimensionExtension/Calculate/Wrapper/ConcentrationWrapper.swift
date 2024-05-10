import Foundation
/// 浓度属性包装器
///
/// # 使用时注意事项
/// 使用``ConcentrationWrapper``包装器创建实例必须给出确切的摩尔质量``moleMass``，以便于后续进行摩尔浓度与质量浓度之间的转换（如果有需要）。通过以下方式创建包装类实例：
///
/// 如果是质量浓度（以kg/L为例）
/// ```
/// @ConcentrationWrapper(moleMass: 18, value: 18, unit: "g/L") var concs
/// ```
/// 如果是摩尔浓度（以mol/L为例）
///
/// ```
/// @ConcentrationWrapper(moleMass: 18, value: 18, unit: "mol/L") var concs
/// ```
/// 初始化器中的参数描述
///
/// |Parameter|Description|
/// |-|-|
/// |``moleMass``|摩尔质量|
/// |``value``|实际浓度的计量值|
/// |``unit``|浓度的计量单位|
@propertyWrapper
public struct ConcentrationWrapper: DataWrapperPublicHandle{
    
    /// 浓度值
    public var value: Concentration = Concentration(value: 0, unit: .gramsPerLiter)
    
    public var wrappedValue: Concentration {
        get { value }
        set { 
            value = newValue
        }
    }
    
    /// 摩尔质量
    public var moleMass: Double
    
    /// 打印值
    public var projectedValue: String {
        return "原子质量：\(moleMass)；浓度：\(value)"
    }
    
    /// 当前单位符号集
    private var currentSet: CSet {
        let symbol = wrappedValue.unit.symbol
        return CSet.currentSetType(symbol)
    }
    
    /// 当前包装类使用的单位类型
    private enum CSet {
        case mole
        case mass
        
        /// 获得单位集
        /// - Returns: 枚举对应的单位集
        func getUnitSet() -> [String] {
            switch self {
                case .mole:
                    return ["mol/L", "mmol/L", "umol/L", "nmol/L"]
                case .mass:
                    return ["kg/L", "g/L", "mg/L", "ng/L"]
            }
        }
        
        /// 获得当前的单位集类型
        /// - Parameter symbol: 单位符号如`g/L`
        /// - Returns: 单位集类型
        static func currentSetType(_ symbol: String) -> CSet {
            if mole.getUnitSet().contains(symbol) {
                return mole
            }
            return mass
        }
    }
    
    /// 转换为固定单位符号代表的单位
    /// - Parameter to: 单位符号
    public mutating func convert(to: String) {
        if CSet.mole.getUnitSet().contains(to) {
            wrappedValue.convert(to: to, moleMass)
            return
        }
        wrappedValue.convert(to: to)
    }
    
    /// 返回单位转换后的浓度值
    /// - Parameter to: 单位符号
    /// - Returns: 摩尔浓度||质量浓度
    public func converted(to: String) -> Concentration {
        if CSet.mole.getUnitSet().contains(to) {
            return wrappedValue.converted(to: to, moleMass)
        }
        return wrappedValue.converted(to: to)
    }
    
    /// 把单位向上或向下转换一个进制
    ///
    /// - Parameter offset: 单位转换使用
    ///
    ///  下面是关于
    ///  |Value|Description|
    ///  |-|-|
    ///  | -1|单位减小，数值增加|
    ///  | 1|单位增加，数值减小|
    public mutating func convert(_ offset: Int) throws {
        let current = value.unit.symbol
        guard let index = currentSet.getUnitSet().firstIndex(of: current) else {
            throw NSError(domain: "输入不正确", code: 1, userInfo: nil) as Error
        }
        if index != 0 && index != currentSet.getUnitSet().endIndex - 1 {
            let newIndex = index - offset
            convert(to: currentSet.getUnitSet()[newIndex])
        }
    }
    
    
    public init() {
        moleMass = 0
    }
    
    /// 建议使用的初始化器
    /// - Parameters:
    ///   - moleMass: 物质的摩尔质量
    ///   - value: 物质的实际测量浓度值
    ///   - unit: 物质的浓度计量单位
    public init(moleMass: Double, value: Double, unit: String) {
        self.moleMass = moleMass
        let cunit:UnitConcentrationMass
//        switch currentSet {
//            case .mole:
//                cunit = self.value.unit.uString(unit, moleMass)
//            case .mass:
//                cunit = self.value.unit.uString(unit)
//            default:
//                // TODO: 倍乘 democardla@icloud.com
//                cunit = self.value.unit.uString(unit)
//        }
        cunit = (currentSet == .mole) ? self.value.unit.uString(unit, moleMass) : self.value.unit.uString(unit)
        
        self.value = Concentration(value: value, unit: cunit)
        
    }
    
    public init(wrappedValue: Concentration, moleMass: Double) {
        self.moleMass = moleMass
        value = wrappedValue
    }
}

extension ConcentrationWrapper {
    
    /// 质量浓度和摩尔浓度相互转换
    public mutating func toggle() {
        if currentSet == .mass {
            self.wrappedValue.convert(to: "mol/L", self.moleMass)
        } else {
            self.wrappedValue.convert(to: "g/L")
        }
    }
    
    /// 中缀运算符：相关
    /// - Parameters:
    ///   - lh: 计量单元
    ///   - rh: 倍乘计量单位
    /// - Returns: 浓度&倍乘浓度线性模型描述
    public static func ~ (lh: ConcentrationWrapper, rh: TimesConcentrationWrapper) -> CTCorrelation {
        let res = CTCorrelation(x: lh, y: rh)
        return res
    }
}

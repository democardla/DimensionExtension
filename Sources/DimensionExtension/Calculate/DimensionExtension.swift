// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

//`Measurement`的重命名

/// 浓度
public typealias Concentration = Measurement<UnitConcentrationMass>
/// 质量
public typealias Mass = Measurement<UnitMass>
/// 体积
public typealias Volume = Measurement<UnitVolume>
/// 摩尔
public typealias Mole = Measurement<UnitMole>
/// 倍乘
public typealias TimesConcentration = Measurement<UnitTimesConcentration>


/// 定义优先级组
precedencegroup LinearCorrelationGroup {
    // higherThan: AdditionPrecedence   // 优先级,比加法运算高
    lowerThan: AdditionPrecedence
    // 优先级, 比加法运算低
    associativity: none
    // 结合方向:left, right or none
    assignment: false
    // true=赋值运算符,false=非赋值运算符
}
/// 定义了一个新的中缀运算符：相关
infix operator ~ : LinearCorrelationGroup

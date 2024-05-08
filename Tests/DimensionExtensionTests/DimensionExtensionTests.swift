import XCTest
@testable import DimensionExtension

/// 计量单位
final class DimensionExtensionTests: XCTestCase {
    /// 摩尔浓度->质量浓度的测试✅
    func testMole2Mass() throws {
        var a = Concentration(value: 1.99, unit: .millimolesPerLiter(withGramsPerMole: 1257.31))
        a.convert(to: .millgramsPerLiter)
        print(a)
        XCTAssertEqual(a, Concentration(value: 2502.0469, unit: .millgramsPerLiter), "❌：【摩尔-质量】与预期结果不符")
    }
    
    
    /// 摩尔浓度间转换的测试✅
    func testMoleConvert() throws {
        var a = Concentration(value: 1, unit: .millimolesPerLiter(withGramsPerMole: 12))
        a.convert(to: .micromolesPerLiter(withGramsPerMole: 12))
        XCTAssertEqual(a, Concentration(value: 1000, unit: .micromolesPerLiter(withGramsPerMole: 12)), "❌：【摩尔浓度】结果与预期结果不符")
    }
    
}

/// 单体
final class MonocaseTests: XCTestCase {
    /// 具有摩尔质量的单体测试
    func testMonocase() throws {
        @MassWrapper(moleMass: 12) var monocase = Mass(value: 12, unit: .grams)
        Info.titled("Monocase")
            .log(monocase)
    }
}

/// 计量运算
final class MeasurementTests: XCTestCase {
    
    /// 具有质量浓度的除法测试
    func testDivision() throws {
        let mass = Mass(value: 5, unit: .grams)
        let volume = Volume(value: 1, unit: .liters)
        let exp1 = mass / volume
        let exp2 = Concentration(value: 5, unit: .gramsPerLiter)
        XCTAssertEqual(exp1, exp2, "❌：【除法】结果与预期结果不符")
    }
    /// 具有质量浓度的除法测试(Monocase)
    func testDivision_Monocase() throws {
        @MassWrapper(moleMass: 12) var mono = Mass(value: 12, unit: .grams)
        let volume = Volume(value: 1, unit: .liters)
        let exp1 = mono / volume
        let exp2 = Concentration(value: 12, unit: .gramsPerLiter)
        XCTAssertEqual(exp1, exp2, "❌：【除法(Monocase)】结果与预期结果不符")
    }
    /// 具有质量浓度的除法测试(MoleMonocase)
    func testDivision_MoleMonocase() throws {
        @MoleWrapper(moleMass: 12) var mono = Mole(value: 12, unit: .mmole)
        let volume = Volume(value: 1, unit: .milliliters)
        let exp1 = _mono / volume
        let exp2 = Concentration(value: 12, unit: .molesPerLiter(withGramsPerMole: _mono.moleMass))
        @ConcentrationWrapper(moleMass: _mono.moleMass, value: 12, unit: "mol/L") var exp3
        XCTAssertEqual(exp1, exp2, "❌：【除法(MoleMonocase)】结果与预期结果不符")
        XCTAssertEqual(exp1, exp3, "❌：【除法(MoleMonocase)】结果与预期结果不符")
    }
    
    func testWrapper() throws {
        let exp2 = Concentration(value: 12, unit: .molesPerLiter(withGramsPerMole: 18))
        @ConcentrationWrapper(wrappedValue: exp2, moleMass: 18) var conc: Concentration
        @ConcentrationWrapper(moleMass: 18) var cons = exp2
        @ConcentrationWrapper(moleMass: 18, value: 18, unit: "mol/L") var concs
        
        print(cons, conc)
        let res = _cons.moleMass
        print(res)
        print($conc)
        
        Info.titled("提示").log("nihao")
    }
}

/// 日志系统
final class InfoTests: XCTestCase {
    
    /// 打印日志功能测试
    func testWrapper() throws {
        let exp2 = Concentration(value: 12, unit: .molesPerLiter(withGramsPerMole: 18))

        Info.titled("打印日志功能测试")
            .log(exp2)
    }
    
    /// 打印日志功能测试
    func testConverter() throws {
        @ConcentrationWrapper(moleMass: 12, value: 0.12, unit: "g/L") var con
        
        @ConcentrationWrapper(moleMass: 12, value: 12, unit: "g/L") var metaC
        var time = TimesConcentration(value: 1, unit: .time)
        
        let link = _metaC ~ time
        let res = link.x2y(_con)
        
        Info.titled("converter功能测试")
            .log(res)
    }
    
}


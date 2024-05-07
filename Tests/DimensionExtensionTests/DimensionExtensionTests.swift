import XCTest
@testable import DimensionExtension

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


final class MonocaseTests: XCTestCase {
    /// 具有摩尔质量的单体测试
    func testMonocase() throws {
        let monocase = Monocase(moleMass: 12, value: 12, unit: .grams)
        print(monocase)
    }
}

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
        let mono = Monocase(moleMass: 12, value: 12, unit: .grams)
        let volume = Volume(value: 1, unit: .liters)
        let exp1 = mono / volume
        let exp2 = Concentration(value: 12, unit: .gramsPerLiter)
        XCTAssertEqual(exp1, exp2, "❌：【除法(Monocase)】结果与预期结果不符")
    }
    /// 具有质量浓度的除法测试(MoleMonocase)
    func testDivision_MoleMonocase() throws {
        let mono = MoleMonocase(moleMass: 12, value: 12, unit: .mmole)
        let volume = Volume(value: 1, unit: .milliliters)
        let exp1 = mono / volume
        let exp2 = Concentration(value: 12, unit: .molesPerLiter(withGramsPerMole: mono.moleMass))
        XCTAssertEqual(exp1, exp2, "❌：【除法(MoleMonocase)】结果与预期结果不符")
    }
    
    func testWrapper() throws {
        let exp2 = Concentration(value: 12, unit: .molesPerLiter(withGramsPerMole: 18))
        @ConcentrationWrapper(moleMass: 18, wrappedValue: exp2) var conc
        print(conc)
//        print($conc)
        print(_conc.moleMass)
    }
}

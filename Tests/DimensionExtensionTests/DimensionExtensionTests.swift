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
        var monocase = Monocase(moleMass: 12, value: 12, unit: "mol/L")
        print(monocase.concentration)
    }
}

//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/8.
//

import Foundation

public class Info {
    static var title: String = ""
    
    private enum Symbol: String {
        case log = "ℹ️"
        case warning = "⚠️"
    }
    
    public static func titled(_ t: String) -> Info.Type {
        title = t
        return Info.self
    }
    /// 在控制台打印日志
    /// - Parameter content: 想要打印的任意值
    public static func log(_ content: Any) {
        let symbol: Symbol = .log
        print("\(symbol.rawValue) [Log] <\(title)> \(content)")
    }
    
    
}

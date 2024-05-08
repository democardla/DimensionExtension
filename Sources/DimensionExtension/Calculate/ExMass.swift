//
//  File.swift
//  
//
//  Created by DemoCardla on 2024/5/9.
//

import Foundation

extension Mass {
    
    /// 通过单位文本改变`Concentration`原有的单位为目标单位
    /// - Parameter to: 想要转换到的单位文本
    public mutating func convert(to: String) {
        let handle = self.unit.uString(to)
        self.convert(to: handle)
        
    }

    /// 通过单位文本返回一个新的带有目标单位的`Concentration`
    /// - Parameter to: 想要转换到的单位文本
    /// - Returns: 一个新的带有目标单位的`Concentration`
    public func converted(to: String) -> Self {
        let handle = self.unit.uString(to)
        return self.converted(to: handle)
    }
}

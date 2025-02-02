//
//  ZeroOneRange.swift
//  Harbeth
//
//  Created by Condy on 2022/11/25.
//

import Foundation

/// 0.0 ~ 1.0 范围区间属性包装器
/// 0.0 ~ 1.0 Range Interval Property Packer.
@propertyWrapper public struct ZeroOneRange {
    
    public var wrappedValue: Float {
        didSet {
            wrappedValue = min(1.0, max(0.0, wrappedValue))
        }
    }
    
    public init(wrappedValue: Float) {
        self.wrappedValue = min(1.0, max(0.0, wrappedValue))
    }
}


/// 范围包装器
/// Extra argument 'wrappedValue' in call. This is because `radius` is set to the default value `1`.
/// Example`: @Range(min: 0, max: 2, defult: 0.5) public var radius: Float // = 1
@propertyWrapper public struct Range<T: Comparable> {
    
    let min_: T
    let max_: T
    
    public var wrappedValue: T {
        didSet {
            wrappedValue = min(max_, max(min_, wrappedValue))
        }
    }
    
    public init(min: T, max: T, defult: T) {
        self.min_ = min
        self.max_ = max
        self.wrappedValue = Swift.min(max, Swift.max(min, defult))
    }
}

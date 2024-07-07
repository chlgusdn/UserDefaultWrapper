//
//  PlainObject.swift
//
//
//  Created by NUNU:D on 7/8/24.
//

import Foundation

/// Plain객체를 Userdefault에 저장하기 위한 wrapper 구조체
@propertyWrapper
open class PlainObject<T> {
    
    /// Userdefault에 저장할 키 정보
    public let key: String
    /// Userdefault에 값을 가져오지 못했을 경우에 사용될 기본 값
    public let defaultValue: T
    
    public var wrappedValue: T {
        get { return UserDefaults.standard.object(forKey: self.key) as? T ?? defaultValue}
        set { UserDefaults.standard.setValue(newValue, forKey: self.key) }
    }
    
    public init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

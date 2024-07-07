//
//  CustomObject.swift
//
//
//  Created by NUNU:D on 7/8/24.
//

import Foundation
/// 커스텀 객체를 UserDefault에 저장하기위한 Wrapper 구조체
@propertyWrapper
open class CustomObject<T: Codable> {
    /// Userdefault에 저장할 키 정보
    public let key: String
    /// Userdefault에 값을 가져오지 못했을 경우에는 값이 nil
    public var wrappedValue: T? {
        get {
            guard let userDefaultCustomData = UserDefaults.standard.data(forKey: self.key),
                  let data = try? PropertyListDecoder().decode(T.self, from: userDefaultCustomData)
            else { return nil }
            
            return data
        }
        
        set {
            guard let data = try? PropertyListEncoder().encode(newValue) else {
                print("값을 저장하지 못하였습니다.")
                return
            }
            UserDefaults.standard.setValue(data, forKey: self.key)
        }
        
    }
    
    public init(key: String) {
        self.key = key
    }
}

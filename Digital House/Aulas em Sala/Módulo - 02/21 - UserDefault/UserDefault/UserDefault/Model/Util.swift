//
//  Util.swift
//  UserDefault
//
//  Created by Giuliano Accorsi on 28/05/19.
//  Copyright © 2019 Giuliano Accorsi. All rights reserved.
//

import Foundation
class Utils {
    static func saveObject(key: String, value: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func getStringObject(key: String) -> String? {
        let value = UserDefaults.standard.string(forKey: key)
        return value
    }
    
    static func saveObject(key: String, value: Any) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    static func getObject(key: String) -> Any? {
        let value = UserDefaults.standard.object(forKey: key)
        return value
    }
    
    static func saveDictionary(dic: [String:Any], key: String) {
        UserDefaults.standard.set(dic, forKey: key)
    }
    
    static func getDictionary(key: String) {
        if let dicObtido = UserDefaults.standard.dictionary(forKey: key) {
            print(dicObtido)
        }
    }
    
    static func dictionaryRepresentation() {
        print(UserDefaults.standard.dictionaryRepresentation())
    }
    
    static func removeForKey(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
        print("RemoveForKey")
    }
    

}

//
//  NSCache+Subscript.swift
//  Earthquakes
//  An extension that adds subscripting to NSCache with CacheObject values
//  Created by Uri on 28/9/25.
//

import Foundation

extension NSCache where KeyType == NSString, ObjectType == CacheEntryObject {
    subscript(_ url: URL) -> CacheEntry? {
        get {
            let key = url.absoluteString as NSString
            let value = object(forKey: key)
            return value?.entry
        }
        
        set {
            let key = url.absoluteString as NSString
            if let entry = newValue {
                let value = CacheEntryObject(entry: entry)
                setObject(value, forKey: key)
            } else {    // if newValue == nil
                removeObject(forKey: key)
            }
        }
    }
}

/*
 Subscript allows us to access to elements of a collection, a list or a container
 We use subscript to interact with NSCache
 object(forKey:) takes an NSString and returns an optional CacheEntryObject.
*/

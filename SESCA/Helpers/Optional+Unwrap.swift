//
//  Optional+Unwrap.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/16/25.
//

import Foundation

extension Optional {
    func unwrap<E: Error>(
        throwing error: @autoclosure () -> E
    ) throws(E) -> Wrapped {
        guard let wrapped = self else {
            throw error()
        }
        
        return wrapped
    }
    
    func unsafelyUnwrap(
        throwing message: @autoclosure () -> String
    ) -> Wrapped {
        guard let wrapped = self else {
            fatalError(message())
        }
        
        return wrapped
    }
}

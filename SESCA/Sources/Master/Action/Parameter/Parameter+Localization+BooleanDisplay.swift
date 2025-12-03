//
//  Parameter+Localization+BooleanDisplay.swift
//  SESCA
//
//  Created by Kenna Blackburn on 11/27/25.
//

extension Master.Action.Parameter.Localization {
    struct BooleanDisplay: Codable, Hashable {
        var trueString: String?
        var falseString: String?
        
        init?(
            true trueString: String?,
            false falseString: String?,
        ) {
            guard trueString != nil && falseString != nil else {
                return nil
            }
            
            self.trueString = trueString
            self.falseString = falseString
        }
        
        enum CodingKeys: String, CodingKey {
            case trueString = "true"
            case falseString = "false"
        }
    }
}

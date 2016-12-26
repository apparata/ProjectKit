//
//  Copyright © 2016 Apparata AB. All rights reserved.
//

import Foundation

public class ObjectID {
    
    public let id: String
    
    public init(id: String) {
        self.id = id
    }
}

extension ObjectID: Equatable {

    public static func ==(lhs: ObjectID, rhs: ObjectID) -> Bool {
        return lhs.id == rhs.id
    }
}


extension ObjectID: Hashable {
    
    public var hashValue: Int {
        return id.hashValue
    }
}


import Foundation

public class ObjectID {
    
    public let id: String
    
    public required init(id: String) {
        self.id = id
    }
}

extension ObjectID: Equatable {

    public static func ==(lhs: ObjectID, rhs: ObjectID) -> Bool {
        return lhs.id == rhs.id
    }
}


extension ObjectID: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

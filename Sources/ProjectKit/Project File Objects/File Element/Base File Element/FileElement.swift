
import Foundation

/// Abstract base class of the concrete file element objects.
public class FileElement {
        
    public class ID: ObjectID { }

    /// A 96 bit unique identifier.
    public private(set) var id: ID

    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }

    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var path: String?
    
    public private(set) var sourceTree: SourceTree?
    
    public private(set) var name: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        path = object["path"] as? String
        name = object["name"] as? String
        sourceTree = nil
        if let sourceTree = object["sourceTree"] as? String {
            self.sourceTree = SourceTree(rawValue: sourceTree)
        }
    }
}

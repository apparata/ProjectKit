
import Foundation

/// References product of another project.
public class ReferenceProxy: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXReferenceProxy"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    /// The name of the reference.
    public private(set) var name: String?
    
    /// The file type of the referenced filed.
    public private(set) var fileType: String?
    
    /// The path of the referenced filed.
    public private(set) var path: String?
    
    /// The proxy to the project that contains the object.
    public private(set) var remoteRef: ContainerItemProxy.ID?
    
    /// The source tree for the path of the reference.
    public private(set) var sourceTree: SourceTree?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        name = object["name"] as? String
        fileType = object["fileType"] as? String
        path = object["path"] as? String
        remoteRef = decodeID(object["remoteRef"])
        sourceTree = nil
        if let sourceTree = object["sourceTree"] as? String {
            self.sourceTree = SourceTree(rawValue: sourceTree)
        }
    }
}

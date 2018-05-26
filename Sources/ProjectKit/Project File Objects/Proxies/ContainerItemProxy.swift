
import Foundation

/// A proxy for another object which might belong another project
/// contained in the same workspace of the project document.
public class ContainerItemProxy: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXContainerItemProxy"
    }

    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    /// The ID of the root object Project of the project containing
    /// the represented object.
    public private(set) var containerPortal: Project.ID?
    
    /// The type of the proxy.
    public private(set) var proxyType: String?
    
    /// The ID of the represented object.
    public private(set) var remoteGlobalIDString: ObjectID?

    /// Name of the object represented by the proxy.
    public private(set) var remoteInfo: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        containerPortal = decodeID(object["containerPortal"])
        proxyType = object["proxyType"] as? String
        remoteGlobalIDString = decodeID(object["remoteGlobalIDString"])
        remoteInfo = object["remoteInfo"] as? String
    }
}


import Foundation

/// References a target through content proxies.
public class TargetDependency: ProjectFileObject {
    
    public class ID: ObjectID { }
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXTargetDependency"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    /// The target to build to satisfy this dependency.
    public private(set) var target: NativeTarget.ID?
    
    // Proxy for the target to build.
    public private(set) var targetProxy: ContainerItemProxy.ID?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        target = decodeID(object["target"])
        targetProxy = decodeID(object["targetProxy"])
    }
}

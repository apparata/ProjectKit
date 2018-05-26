
import Foundation

/// Abstract base class of the concrete build phase objects.
public class BuildPhase {
    
    public class ID: ObjectID { }

    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var buildActionMask: String?
    
    public private(set) var files: [BuildFile.ID] = []
    
    public private(set) var runOnlyForDeploymentPostprocessing: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        buildActionMask = object["buildActionMask"] as? String
        files = decodeIDs(object["files"])
        runOnlyForDeploymentPostprocessing = object["runOnlyForDeploymentPostprocessing"] as? String
    }
}

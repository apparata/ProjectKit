
import Foundation

/// Abstract base class of the concrete target objects.
public class Target {
    
    public class ID: ObjectID { }

    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }

    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var buildConfigurationList: ConfigurationList.ID?
    
    public private(set) var buildPhases: [BuildPhase.ID] = []
    
    public private(set) var buildRules: [BuildRule.ID] = []
    
    public typealias TargetDependencyID = ObjectID
    /// For some reason, the compiler segfaults if this is TargetDependency.ID
    public private(set) var dependencies: [TargetDependencyID]

    public private(set) var name: String?
    
    public private(set) var productName: String?
    
    public private(set) var productReference: FileReference.ID?
    
    public private(set) var productType: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        buildConfigurationList = decodeID(object["buildConfigurationList"])
        buildPhases = decodeIDs(object["buildPhases"])
        buildRules = decodeIDs(object["buildRules"])
        dependencies = decodeIDs(object["dependencies"])
        name = object["name"] as? String
        productName = object["productName"] as? String
        productReference = decodeID(object["productReference"])
        productType = object["productType"] as? String
    }
}

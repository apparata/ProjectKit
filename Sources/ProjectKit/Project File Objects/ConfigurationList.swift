
import Foundation

/// Lists build configurations, e.g. Release or Debug
public class ConfigurationList: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "XCConfigurationList"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var buildConfigurations: [BuildConfiguration.ID] = []
    
    public private(set) var defaultConfigurationIsVisible: String?
    
    public private(set) var defaultConfigurationName: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        buildConfigurations = decodeIDs(object["buildConfigurations"])
        defaultConfigurationIsVisible = object["defaultConfigurationIsVisible"] as? String
        defaultConfigurationName = object["defaultConfigurationName"] as? String
    }
}

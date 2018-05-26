
import Foundation

/// Defines build configuration.
public class BuildConfiguration: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "XCBuildConfiguration"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary

    /// Configuration name, e.g. Debug or Release
    public private(set) var name: String?
    
    /// Path of optional xcconfig file that contains the build settings.
    public private(set) var baseConfigurationReference: String?
    
    /// Xcode project build settings
    public private(set) var buildSettings: NSDictionary? = [:]

    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        name = object["name"] as? String
        baseConfigurationReference = object["baseConfigurationReference"] as? String
        if let buildSettings = object["buildConfigurations"] as? NSDictionary {
            self.buildSettings = buildSettings
        }
    }
}

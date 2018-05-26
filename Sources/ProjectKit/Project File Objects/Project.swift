
import Foundation

/// Represents the root object of a project document.
public class Project: ProjectFileObject {

    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXProject"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    /// Target attributes. Upgrade checks, organization name, etc.
    public private(set) var attributes: NSDictionary = [:]
    
    /// The configuration list of the project.
    public private(set) var buildConfigurationList: ConfigurationList.ID?
    
    /// The compatibility version of the project.
    public private(set) var compatibilityVersion: String?
    
    /// The development region of the project.
    public private(set) var developmentRegion: String?
    
    /// Indicates whether the project has scanned for encodings.
    public private(set) var hasScannedForEncodings: String?
    
    /// The list of known regions in the project.
    public private(set) var knownRegions: [String] = []
    
    /// Main group of the project.
    public private(set) var mainGroup: Group.ID?
    
    // Any references to other projects. Each dictionary in
    // the array contains two keys: ProductGroup and ProjectRef.
    public private(set) var projectReferences: [NSDictionary] = []
    
    /// The group containing the references to products of the project.
    public private(set) var productRefGroup: Group.ID?
    
    /// The directory of the project.
    public private(set) var projectDirPath: String?
    
    /// The root of the project.
    public private(set) var projectRoot: String?
    
    /// Targets in the project.
    public private(set) var targets: [Target.ID] = []
 
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object

        if let attributes = object["attributes"] as? NSDictionary {
            self.attributes = attributes
        }
        buildConfigurationList = decodeID(object["buildConfigurationList"])
        compatibilityVersion = object["compatibilityVersion"] as? String
        developmentRegion = object["developmentRegion"] as? String
        hasScannedForEncodings = object["hasScannedForEncodings"] as? String
        if let knownRegions = object["knownRegions"] as? [String] {
            self.knownRegions = knownRegions
        }
        mainGroup = decodeID(object["mainGroup"])
        if let projectReferences = object["projectReferences"] as? [NSDictionary] {
            self.projectReferences = projectReferences
        }
        productRefGroup = decodeID(object["productRefGroup"])
        projectDirPath = object["projectDirPath"] as? String
        projectRoot = object["projectRoot"] as? String
        targets = decodeIDs(object["targets"])
    }
}

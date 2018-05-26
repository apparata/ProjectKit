
import Foundation

/// A file reference that is used in a PBXBuildPhase
/// (either as an include or resource).
public class BuildFile: ProjectFileObject {
    
    public class ID: ObjectID { }
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXBuildFile"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var fileRef: FileReference.ID?
    
    public private(set) var settings: NSDictionary = [:]
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        fileRef = decodeID(object["fileRef"])
        if let settings = object["settings"] as? NSDictionary {
            self.settings = settings
        }
    }
}

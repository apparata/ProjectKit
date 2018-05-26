
import Foundation

/// Represents a custom build rule of a Target.
public class BuildRule: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXBuildRule"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var compilerSpec: String?
    public private(set) var filePatterns: String?
    public private(set) var fileType: String?
    public private(set) var isEditable: String?
    public private(set) var name: String?
    public private(set) var outputFiles: [FileReference.ID] = []
    public private(set) var outputFilesCompilerFlags: [String] = []
    public private(set) var script: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        compilerSpec = object["compilerSpec"] as? String
        filePatterns = object["filePatterns"] as? String
        fileType = object["fileType"] as? String
        isEditable = object["isEditable"] as? String
        name = object["name"] as? String
        outputFiles = decodeIDs(object["outputFiles"])
        if let outputFilesCompilerFlags = object["outputFilesCompilerFlags"] as? [String] {
            self.outputFilesCompilerFlags = outputFilesCompilerFlags
        }
        script = object["script"] as? String
    }
}

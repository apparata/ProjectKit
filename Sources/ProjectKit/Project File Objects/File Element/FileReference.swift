
import Foundation

/// Used to track an external file referenced by the project.
public class FileReference: FileElement, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXFileReference"
    }
    
    // Output file
    
    public private(set) var explicitFileType: String?
    public private(set) var includeInIndex: String?
    
    // Input file
    
    public private(set) var lastKnownFileType: String?
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
        explicitFileType = object["explicitFileType"] as? String
        includeInIndex = object["includeInIndex"] as? String
        lastKnownFileType = object["lastKnownFileType"] as? String
    }
}

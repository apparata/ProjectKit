
import Foundation

/// Copy files build phase.
public class CopyFilesBuildPhase: BuildPhase, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXCopyFilesBuildPhase"
    }
    
    public private(set) var destinationPath: String?
    
    public private(set) var destinationSubfolderSpec: String?
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
        destinationPath = object["dstPath"] as? String
        destinationSubfolderSpec = object["dstSubfolderSpec"] as? String
    }
}


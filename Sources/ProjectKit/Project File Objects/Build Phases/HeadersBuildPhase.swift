
import Foundation

/// Headers build phase.
public class HeadersBuildPhase: BuildPhase, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXHeadersBuildPhase"
    }
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
    }
}


import Foundation

/// Framework build phase.
public class FrameworksBuildPhase: BuildPhase, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXFrameworksBuildPhase"
    }
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
    }
}

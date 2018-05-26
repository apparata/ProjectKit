
import Foundation

/// Resources copy build phase.
public class ResourcesBuildPhase: BuildPhase, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXResourcesBuildPhase"
    }
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
    }
}

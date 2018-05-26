
import Foundation

/// Sources compilation build phase.
public class SourcesBuildPhase: BuildPhase, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXSourcesBuildPhase"
    }
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
    }
}

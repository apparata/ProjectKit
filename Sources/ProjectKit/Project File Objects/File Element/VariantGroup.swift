
import Foundation

/// Element for referencing localized resources.
public class VariantGroup: FileElement, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXVariantGroup"
    }
    
    /// Objects contained in this group.
    public private(set) var children: [FileElement.ID] = []
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
        children = decodeIDs(object["children"])
    }
}

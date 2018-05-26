
import Foundation

/// Groups files or groups.
public class Group: FileElement, ProjectFileObject {
        
    /// Object type from project file.
    public static var isa: String {
        return "PBXGroup"
    }
    
    /// Objects contained in this group.
    public private(set) var children: [FileElement.ID] = []
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
        children = decodeIDs(object["children"])
    }
}

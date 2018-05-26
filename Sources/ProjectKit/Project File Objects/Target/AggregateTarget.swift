
import Foundation

/// Build target that aggregates several others.
public class AggregateTarget: Target, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXAggregateTarget"
    }
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
    }
}

extension AggregateTarget: CustomStringConvertible {
    
    public var description: String {
        return "AggregateTarget(name: \(name ?? "N/A"))"
    }
}

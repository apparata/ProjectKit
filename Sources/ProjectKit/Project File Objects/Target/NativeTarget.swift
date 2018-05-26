
import Foundation

/// A build target that produces a binary, such as an app or a library.
public class NativeTarget: Target, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXNativeTarget"
    }
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
    }
}

extension NativeTarget: CustomStringConvertible {
    
    public var description: String {
        return "NativeTarget(name: \(name ?? "N/A"), type: \(productType ?? "N/A"))"
    }
}

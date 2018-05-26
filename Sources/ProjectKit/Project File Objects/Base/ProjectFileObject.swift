
import Foundation

/// Base protocol for all Xcode project file objects.
public protocol ProjectFileObject {
    
    /// Object type from project file.
    static var isa: String { get }
    
    /// A 96 bit unique identifier.
    var objectID: ObjectID { get }
    
    /// The raw dictionary representation of the object.
    var object: NSDictionary { get }
}


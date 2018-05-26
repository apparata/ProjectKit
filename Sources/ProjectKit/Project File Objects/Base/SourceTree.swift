
import Foundation

public enum SourceTree: String {
    case absolute = "<absolute>"
    
    /// The file path is relative to the group the file is in.
    case group = "<group>"
    
    /// The file path is relative to the project path.
    case projectPath = "SOURCE_ROOT"
    
    /// The file path is relative to the developer directory.
    case developerDirectory = "DEVELOPER_DIR"
    
    /// The file path is relative to built products path.
    case buildProducts = "BUILT_PRODUCTS_DIR"
    
    /// The file path is relative to SDK path.
    case sdkRoot = "SDKROOT"
}

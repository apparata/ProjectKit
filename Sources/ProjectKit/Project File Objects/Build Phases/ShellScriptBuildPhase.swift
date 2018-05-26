
import Foundation

/// Shell script build phase.
public class ShellScriptBuildPhase: BuildPhase, ProjectFileObject {
    
    /// Object type from project file.
    public static var isa: String {
        return "PBXShellScriptBuildPhase"
    }
    
    public private(set) var inputPaths: [String] = []
    
    public private(set) var outputPaths: [String] = []
    
    /// Path to the shell interpreter.
    public private(set) var shellPath: String?
    
    /// The content of the shell script.
    public private(set) var shellScript: String?
    
    public override init(id: ID, object: NSDictionary) {
        super.init(id: id, object: object)
        if let inputPaths = object["inputPaths"] as? [String] {
            self.inputPaths = inputPaths
        }
        if let outputPaths = object["outputPaths"] as? [String] {
            self.outputPaths = outputPaths
        }
        shellPath = object["shellPath"] as? String
        shellScript = object["shellScript"] as? String
    }
}


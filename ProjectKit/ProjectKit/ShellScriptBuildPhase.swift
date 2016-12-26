//
//  Copyright (c) 2016 Apparata AB
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//
//  (MIT License)
//

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


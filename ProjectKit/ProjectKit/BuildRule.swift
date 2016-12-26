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

/// Represents a custom build rule of a Target.
public class BuildRule: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXBuildRule"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var compilerSpec: String?
    public private(set) var filePatterns: String?
    public private(set) var fileType: String?
    public private(set) var isEditable: String?
    public private(set) var name: String?
    public private(set) var outputFiles: [FileReference.ID] = []
    public private(set) var outputFilesCompilerFlags: [String] = []
    public private(set) var script: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        compilerSpec = object["compilerSpec"] as? String
        filePatterns = object["filePatterns"] as? String
        fileType = object["fileType"] as? String
        isEditable = object["isEditable"] as? String
        name = object["name"] as? String
        if let outputFiles = object["outputFiles"] as? [FileReference.ID] {
            self.outputFiles = outputFiles
        }
        if let outputFilesCompilerFlags = object["outputFilesCompilerFlags"] as? [String] {
            self.outputFilesCompilerFlags = outputFilesCompilerFlags
        }
        script = object["script"] as? String
    }
}

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

/// References product of another project.
public class ReferenceProxy: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXReferenceProxy"
    }
    
    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    /// The name of the reference.
    public private(set) var name: String?
    
    /// The file type of the referenced filed.
    public private(set) var fileType: String?
    
    /// The path of the referenced filed.
    public private(set) var path: String?
    
    /// The proxy to the project that contains the object.
    public private(set) var remoteRef: ContainerItemProxy.ID?
    
    /// The source tree for the path of the reference.
    public private(set) var sourceTree: SourceTree?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        name = object["name"] as? String
        fileType = object["fileType"] as? String
        path = object["path"] as? String
        remoteRef = object["remoteRef"] as? ContainerItemProxy.ID
        sourceTree = nil
        if let sourceTree = object["sourceTree"] as? String {
            self.sourceTree = SourceTree(rawValue: sourceTree)
        }
    }
}

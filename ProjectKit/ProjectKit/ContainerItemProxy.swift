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

/// A proxy for another object which might belong another project
/// contained in the same workspace of the project document.
public class ContainerItemProxy: ProjectFileObject {
    
    public class ID: ObjectID { }

    /// Object type from project file.
    public static var isa: String {
        return "PBXContainerItemProxy"
    }

    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }
    
    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    /// The ID of the root object Project of the project containing
    /// the represented object.
    public private(set) var containerPortal: Project.ID?
    
    /// The type of the proxy.
    public private(set) var proxyType: String?
    
    /// The ID of the represented object.
    public private(set) var remoteGlobalIDString: ObjectID?

    /// Name of the object represented by the proxy.
    public private(set) var remoteInfo: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        containerPortal = object["containerPortal"] as? Project.ID
        proxyType = object["proxyType"] as? String
        remoteGlobalIDString = object["remoteGlobalIDString"] as? ObjectID
        remoteInfo = object["remoteInfo"] as? String
    }
}

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

/// Abstract base class of the concrete file element objects.
public class FileElement {
        
    public class ID: ObjectID { }

    /// A 96 bit unique identifier.
    public private(set) var id: ID

    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }

    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var path: String?
    
    public private(set) var sourceTree: SourceTree?
    
    public private(set) var name: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        path = object["path"] as? String
        name = object["name"] as? String
        sourceTree = nil
        if let sourceTree = object["sourceTree"] as? String {
            self.sourceTree = SourceTree(rawValue: sourceTree)
        }
    }
}

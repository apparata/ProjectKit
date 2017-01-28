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

/// Abstract base class of the concrete target objects.
public class Target {
    
    public class ID: ObjectID { }

    /// A 96 bit unique identifier.
    public private(set) var id: ID
    
    /// A 96 bit unique identifier.
    public var objectID: ObjectID {
        return id
    }

    /// The raw dictionary representation of the object.
    public private(set) var object: NSDictionary
    
    public private(set) var buildConfigurationList: ConfigurationList.ID?
    
    public private(set) var buildPhases: [BuildPhase.ID] = []
    
    public private(set) var buildRules: [BuildRule.ID] = []
    
    public typealias TargetDependencyID = ObjectID
    /// For some reason, the compiler segfaults if this is TargetDependency.ID
    public private(set) var dependencies: [TargetDependencyID]

    public private(set) var name: String?
    
    public private(set) var productName: String?
    
    public private(set) var productReference: FileReference.ID?
    
    public private(set) var productType: String?
    
    public init(id: ID, object: NSDictionary) {
        self.id = id
        self.object = object
        buildConfigurationList = decodeID(object["buildConfigurationList"])
        buildPhases = decodeIDs(object["buildPhases"])
        buildRules = decodeIDs(object["buildRules"])
        dependencies = decodeIDs(object["dependencies"])
        name = object["name"] as? String
        productName = object["productName"] as? String
        productReference = decodeID(object["productReference"])
        productType = object["productType"] as? String
    }
}

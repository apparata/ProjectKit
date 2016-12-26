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

public enum XcodeProjectError: Error {
    case failedToOpenProjectFile
    case failedToParseProjectFile
}

public class XcodeProject {
    
    /// Seems to always be 1?
    public private(set) var archiveVersion: Int?
    
    /// Seems to always be empty?
    public private(set) var classes: NSDictionary = [:]
    
    /// XcodeCompatibilityVersion enum
    public private(set) var objectVersion: Int?
    
    /// All objects in the entire Xcode project file.
    public private(set) var objects: [String: NSDictionary] = [:]
    
    /// The root project object.
    public private(set) var rootObject: Project.ID?
    
    public private(set) var projects: [Project.ID: Project] = [:]
    public private(set) var groups: [Group.ID: Group] = [:]
    public private(set) var buildFiles: [BuildFile.ID: BuildFile] = [:]
    public private(set) var fileReferences: [FileReference.ID: FileReference] = [:]
    public private(set) var nativeTargets: [NativeTarget.ID: NativeTarget] = [:]
    public private(set) var variantGroups: [VariantGroup.ID: VariantGroup] = [:]
    public private(set) var containerItemProxies: [ContainerItemProxy.ID: ContainerItemProxy] = [:]
    public private(set) var referenceProxies: [ReferenceProxy.ID: ReferenceProxy] = [:]
    public private(set) var targetDependencies: [TargetDependency.ID: TargetDependency] = [:]
    public private(set) var buildConfigurations: [BuildConfiguration.ID: BuildConfiguration] = [:]
    public private(set) var configurationLists: [ConfigurationList.ID: ConfigurationList] = [:]
    public private(set) var frameworksBuildPhases: [FrameworksBuildPhase.ID: FrameworksBuildPhase] = [:]
    public private(set) var resourcesBuildPhases: [ResourcesBuildPhase.ID: ResourcesBuildPhase] = [:]
    public private(set) var sourcesBuildPhases: [SourcesBuildPhase.ID: SourcesBuildPhase] = [:]
    public private(set) var shellScriptBuildPhases: [ShellScriptBuildPhase.ID: ShellScriptBuildPhase] = [:]
    public private(set) var headersBuildPhases: [HeadersBuildPhase.ID: HeadersBuildPhase] = [:]
    public private(set) var copyFilesBuildPhases: [CopyFilesBuildPhase.ID: CopyFilesBuildPhase] = [:]
    public private(set) var otherObjects: [ObjectID: NSDictionary] = [:]
    
    public init(url: URL) throws {
        guard let inputStream = InputStream(url: url) else {
            throw XcodeProjectError.failedToOpenProjectFile
        }
        
        inputStream.open()
        
        guard let projectFile = deserialize(from: inputStream) else {
            throw XcodeProjectError.failedToParseProjectFile
        }
        
        inputStream.close()
        
        parse(projectFile)
    }

    private func deserialize(from inputStream: InputStream) -> NSDictionary? {
        let propertyList = try? PropertyListSerialization.propertyList(with: inputStream, format: nil)
        return propertyList as? NSDictionary
    }
    
    private func parse(_ project: NSDictionary) {
        
        archiveVersion = Int(project["archiveVersion"] as? String ?? "")
        classes = project["classes"] as? NSDictionary ?? [:]
        objectVersion = Int(project["objectVersion"] as? String ?? "")
        objects = project["objects"] as? [String: NSDictionary] ?? [:]
        if let rootObject = project["rootObject"] as? String {
            self.rootObject = Project.ID(id: rootObject)
        }
        
        for (objectID, object) in objects {
            guard let type = object["isa"] as? String else { continue }
            
            switch type {
            case Project.isa:
                let id = Project.ID(id: objectID)
                projects[id] = Project(id: id, object: object)
                
            case Group.isa:
                let id = Group.ID(id: objectID)
                groups[id] = Group(id: id, object: object)

            case VariantGroup.isa:
                let id = VariantGroup.ID(id: objectID)
                variantGroups[id] = VariantGroup(id: id, object: object)
                
            case FileReference.isa:
                let id = FileReference.ID(id: objectID)
                fileReferences[id] = FileReference(id: id, object: object)

            case NativeTarget.isa:
                let id = NativeTarget.ID(id: objectID)
                nativeTargets[id] = NativeTarget(id: id, object: object)
                
            case ContainerItemProxy.isa:
                let id = ContainerItemProxy.ID(id: objectID)
                containerItemProxies[id] = ContainerItemProxy(id: id, object: object)
                
            case TargetDependency.isa:
                let id = TargetDependency.ID(id: objectID)
                targetDependencies[id] = TargetDependency(id: id, object: object)
                
            case ReferenceProxy.isa:
                let id = ReferenceProxy.ID(id: objectID)
                referenceProxies[id] = ReferenceProxy(id: id, object: object)
                
            case BuildFile.isa:
                let id = BuildFile.ID(id: objectID)
                buildFiles[id] = BuildFile(id: id, object: object)
                
            case BuildConfiguration.isa:
                let id = BuildConfiguration.ID(id: objectID)
                buildConfigurations[id] = BuildConfiguration(id: id, object: object)
                
            case ConfigurationList.isa:
                let id = ConfigurationList.ID(id: objectID)
                configurationLists[id] = ConfigurationList(id: id, object: object)
                
            case FrameworksBuildPhase.isa:
                let id = FrameworksBuildPhase.ID(id: objectID)
                frameworksBuildPhases[id] = FrameworksBuildPhase(id: id, object: object)
                
            case ResourcesBuildPhase.isa:
                let id = ResourcesBuildPhase.ID(id: objectID)
                resourcesBuildPhases[id] = ResourcesBuildPhase(id: id, object: object)
                
            case SourcesBuildPhase.isa:
                let id = SourcesBuildPhase.ID(id: objectID)
                sourcesBuildPhases[id] = SourcesBuildPhase(id: id, object: object)
                
            case ShellScriptBuildPhase.isa:
                let id = ShellScriptBuildPhase.ID(id: objectID)
                shellScriptBuildPhases[id] = ShellScriptBuildPhase(id: id, object: object)
                
            case HeadersBuildPhase.isa:
                let id = HeadersBuildPhase.ID(id: objectID)
                headersBuildPhases[id] = HeadersBuildPhase(id: id, object: object)
                
            case CopyFilesBuildPhase.isa:
                let id = CopyFilesBuildPhase.ID(id: objectID)
                copyFilesBuildPhases[id] = CopyFilesBuildPhase(id: id, object: object)
            
            default:
                let id = ObjectID(id: objectID)
                otherObjects[id] = object
            }
        }
    }
}

extension XcodeProject: CustomStringConvertible {
    
    public var description: String {
        return "Project(archiveVersion: \(archiveVersion ?? 0), objectVersion: \(objectVersion ?? 0))"
    }
}

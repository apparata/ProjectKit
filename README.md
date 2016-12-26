# ProjectKit

ProjectKit is a Swift framework for parsing Xcode project files.

## Example

```Swift
import ProjectKit

let url = URL(fileURLWithPath: "<YourProject>.pbxproj")

do {
    
    let project = try XcodeProject(url: url)

    print(project)

} catch XcodeProjectError.failedToOpenProjectFile {
    print("Failed to open project file.")
} catch XcodeProjectError.failedToParseProjectFile {
    print("Failed to parse project file.")
}
```

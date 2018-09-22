# ProjectKit

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![SwiftPM compatible](https://img.shields.io/badge/SwiftPM-compatible-4BC51D.svg?style=flat)](https://swift.org/package-manager/) ![license](https://img.shields.io/badge/license-MIT-blue.svg) ![language Swift 4.2](https://img.shields.io/badge/language-Swift%204.2-orange.svg) ![platform macOS](https://img.shields.io/badge/platform-OSX-lightgrey.svg)

ProjectKit is a Swift framework for parsing Xcode project files.

## Example

Here's an example that loads an Xcode project file and prints the name of all targets in the project.

```Swift
import ProjectKit

let url = URL(fileURLWithPath: "<YourProject>.pbxproj")

do {
    
    let project = try XcodeProject(url: url)

    print(project)
    
    for (targetID, target) in project.nativeTargets {
        print(target.name)
    }

} catch XcodeProjectError.failedToOpenProjectFile {
    print("Failed to open project file.")
} catch XcodeProjectError.failedToParseProjectFile {
    print("Failed to parse project file.")
}
```

## Installation

### Carthage

ProjectKit is [Carthage](https://github.com/Carthage/Carthage) compatible.

1. Add `Carthage/Build` and `Carthage/Checkouts` to your .gitignore, if you're using git.
2. Create a Carthage folder in your repo. You could name it `Carthage`, for example.
3. Create a text file in that folder and name it `Cartfile`.
4. Add the following line to the `Cartfile`:

    `git "git@github.com:apparata/ProjectKit.git" "master"`

5. Then update using Carthage from the command line for whichever platform you want to build for:

    `carthage update`

6. Build result (`ProjectKit.framework`) is found in `Carthage/Build/Mac/`.
7. Make sure you check in `Cartfile.resolved`.
8. Add ProjectKit.framework to your project.

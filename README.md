# ProjectKit

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

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

## Installation

### Carthage

ProjectKit is [Carthage](https://github.com/Carthage/Carthage) compatible.

1. Add `Carthage/Build` and `Carthage/Checkouts` to your .gitignore, if you're using git.
2. Create a Carthage folder in your repo. You could name it `Carthage`, for example.
3. Create a text file in that folder and name it `Cartfile`.
4. Add the following line to the `Cartfile`:

    `git "git@bitbucket.org:apparata/ProjectKit.git" "master"`

5. Then update using Carthage from the command line for whichever platform you want to build for:

    `carthage update`

6. Make sure you check in `Cartfile.resolved`.

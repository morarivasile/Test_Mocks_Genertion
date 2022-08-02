#!/usr/bin/swift

import Foundation

enum Constants {
    static let filePath = "[file_path]"
    static let mockName = "[mock_name]"
    static let swiftFileExtension = "swift"
    static let templateConfiguration: NSString = """
    sources:
      - [file_path]
    templates:
      - Templates/Mock.stencil
    output:
      path: Test_Mocks_GenertionTests/GeneratedMocks/[mock_name]
      link:
        project: Test_Mocks_Genertion.xcodeproj
        target: Test_Mocks_GenertionTests
        group: Test_Mocks_GenertionTests/GeneratedMocks
    """
}

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}

func setupConfifuration(filePath: String, mockName: String) {
    let configuration = Constants.templateConfiguration
        .replacingOccurrences(of: Constants.filePath, with: filePath)
        .replacingOccurrences(of: Constants.mockName, with: mockName)
    do {
        try configuration.write(toFile: ".sourcery.yml", atomically: true, encoding: .utf8)
        print("✅ .sourcery.yml updated!")
    } catch {
        print(error)
    }
}

func generatedMockName(for fileName: String) -> String { 
    "\(fileName)Mock.swift"
}

func main() {
    if CommandLine.argc == 2 {
        let arguments = CommandLine.arguments
        let path = arguments[1]
        let pathExtension = NSString(string: path).pathExtension
        print("path is here")
        print(path)
        
        if pathExtension.isEmpty {
            print("❗️ You entered a directory, instead of file name.")
        } else if pathExtension == Constants.swiftFileExtension {
            if let fileName = NSString(string: path).deletingPathExtension.components(separatedBy: "/").last { 
                setupConfifuration(filePath: path, mockName: generatedMockName(for: fileName))
                shell("sourcery")
            } else { 
                print("❗️ Unable to determine file name.")
            }  
        } else { 
            print("❗️ Not a swift file.")
        }
    } else {
        print("❗️ Need to pass as argument file name with protocol you want to mock.")
    }
}

main()
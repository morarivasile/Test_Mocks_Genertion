#!/usr/bin/swift

import Foundation

enum Constants {
    static let templatePath = "Templates/Mock.stencil"
    static let swiftFileExtension = "swift"
    static let mockTargetName = "Test_Mocks_GenertionTests"
    static let mockDirectoryName = "GeneratedMocks"
}

@discardableResult
func shell(_ command: String) -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.standardInput = nil
    task.launch()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    return output
}

func generatedMockPath(for fileName: String) -> String { 
    "\(Constants.mockTargetName)/\(Constants.mockDirectoryName)/\(fileName).swift"
}

func main() {
    if CommandLine.argc == 2 {
        let arguments = CommandLine.arguments
        let path = arguments[1]
        let pathExtension = NSString(string: path).pathExtension
        
        if pathExtension.isEmpty {
            print("❗️ You entered a directory, instead of file name.")
        } else if pathExtension == Constants.swiftFileExtension {
            if let fileName = NSString(string: path).deletingPathExtension.components(separatedBy: "/").last { 
                print(
                    shell("sourcery --sources \(path) --templates \(Constants.templatePath) --output \(generatedMockPath(for: fileName))")
                )
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
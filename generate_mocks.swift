#!/usr/bin/swift

import Foundation

enum Constants {
    static let moduleName = "[module_name]"
    static let submoduleName = "[submodule_name]"
    static let templateConfiguration: NSString = """
    sources:
      - Modules/[module_name]/[submodule_name]/
    templates:
      - Templates/Mock/Mock.stencil
    output:
      path: Modules/[module_name]/[submodule_name]/[submodule_name]Mocks.swift
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

func setupConfifuration(_ moduleName: String, submoduleName: String) {
    let configuration = Constants.templateConfiguration
        .replacingOccurrences(of: Constants.moduleName, with: moduleName)
        .replacingOccurrences(of: Constants.submoduleName, with: submoduleName)
    do {
        let currentDirectoryPath = FileManager.default.currentDirectoryPath
        try configuration.write(toFile: "\(currentDirectoryPath)/.sourcery.yml", atomically: true, encoding: .utf8)
        print("✅ .sourcery.yml updated!")
    } catch {
        print(error)
    }
}

func main() {
    if CommandLine.argc == 3 {
        let arguments = CommandLine.arguments
        setupConfifuration(arguments[1], submoduleName: arguments[2])
        shell("Pods/Sourcery-private/sourcery")
    } else {
        print("❗️ Необходимо передать 2 параметра в формате: module_name submodule_name")
    }
}

main()

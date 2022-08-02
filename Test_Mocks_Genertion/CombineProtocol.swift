//
//  CombineProtocol.swift
//  Test_Mocks_Genertion
//
//  Created by Vasile Morari on 01.08.2022.
//

import Foundation

import Combine

protocol CombineProtocol: AnyObject {
    var configurationPublisher: AnyPublisher<String, Never> { get }
}

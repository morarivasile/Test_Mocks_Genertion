//
//  MainCoordinatorProtocol.swift
//  Test_Mocks_Genertion
//
//  Created by Vasile Morari on 31.07.2022.
//

import Foundation

protocol MainCoordinatorProtocol: AnyObject {
    func goToLogin(_ completion: (Bool) -> Void)
    func goToMainScreen()
    func dismiss()
}

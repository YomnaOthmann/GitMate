//
//  DependencyHandler.swift
//  GitMate
//
//  Created by Yomna Othman on 29/04/2024.
//

import Foundation
import Swinject

class LaunchAssembly: Assembly{
    func assemble(container: Container) {
        
    }
}
class AuthenticationAssembly: Assembly{
    func assemble(container: Container) {
        
    }
}
class HomeAssembly: Assembly{
    func assemble(container: Container) {
        
    }
}



extension Assembler{
    static let sharedAssembler : Assembler = {
        var container = Container()
        var assembler = Assembler(
    [
        LaunchAssembly(),
        AuthenticationAssembly(),
        HomeAssembly(),
    ],
    container: container
        )
        return assembler
    }()
}



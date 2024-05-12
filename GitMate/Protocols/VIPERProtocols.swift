//
//  VIPERProtocols.swift
//  GitMate
//
//  Created by Yomna Othman on 12/05/2024.
//

import Foundation
import UIKit

protocol AnyView{
    var presenter : AnyPresenter?{get set}
    func updateView(with: Decodable)
    func updateView(with error : String)
}

protocol AnyInteractor{
    var presenter: AnyPresenter?{get set}

}

protocol AnyPresenter{
    var interactor: AnyInteractor?{get set}
    var router: AnyRouter?{get set}
    var view: AnyView?{get set}
    
    func didFetchData()
}

typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter{
    var view:EntryPoint?{get}
    func start() -> AnyRouter
}


//
//  AlbumsRouter.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//
import UIKit

protocol RouterProtocol {
    func start()
}

class AlbumsRouter: RouterProtocol {
    
    var parentView: UIViewController?
    var presenter: PresenterProtocol?

    func start() {
        let presenter = AlbumsPresenter(router: self)
        let view = AlbumsViewController()
        view.presenter = presenter
        parentView = view
    }
}

//
//  AlbumsPresenter.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

protocol PresenterProtocol {
    func moduleWasLoaded(with view: ViewProtocol)
}

class AlbumsPresenter: PresenterProtocol {
    
    private var view: ViewProtocol?
    var interactor: InteractorProtocol? = AlbumsInteractor()
    let router: RouterProtocol?

    init(router: RouterProtocol?) {
        self.router = router
    }

    func moduleWasLoaded(with view: ViewProtocol) {
        self.view = view

        interactor?.updateData(completion: { [unowned self] models in
            self.view?.updateModule(with: models)
        })
    }
}

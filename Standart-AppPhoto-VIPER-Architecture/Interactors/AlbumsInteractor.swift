//
//  AlbumsInteractor.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

protocol InteractorProtocol {
    func updateData(completion: (([String : [ModelCellAlbums]]?) -> Void)?)
}

class AlbumsInteractor: InteractorProtocol {
    
    var presenter: PresenterProtocol?
    var entity = AlbumsEntity()

    func updateData(completion: (([String : [ModelCellAlbums]]?) -> Void)?) {
        completion?(entity.updateData())
    }
}
    

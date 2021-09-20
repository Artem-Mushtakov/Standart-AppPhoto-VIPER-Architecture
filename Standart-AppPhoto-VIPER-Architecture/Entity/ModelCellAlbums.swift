//
//  ModelCelAlbums.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

struct ModelCellAlbums {
    let type: ModelCellType
    let titleImage: UIImageView
    let titleLabel: String
    let titleCount: String
}

enum ModelCellType {
    case cellMyAlbums
    case cellPeopleAndPlaces
    case cellTypesOfMedia
}

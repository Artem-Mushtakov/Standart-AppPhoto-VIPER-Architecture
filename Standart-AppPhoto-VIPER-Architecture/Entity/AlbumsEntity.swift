//
//  AlbumsEntity.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.

import Foundation
import UIKit

protocol EntityProtocol {
    func updateData() -> [String: [ModelCellAlbums]]?
}

class AlbumsEntity: EntityProtocol {

    func updateData() -> [String: [ModelCellAlbums]]? {
        
        let data = [ "Section0": [ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-1")!),
                                    titleLabel: "Недавние",
                                    titleCount: "9 259"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-2")!),
                                    titleLabel: "Избранное",
                                    titleCount: "123"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-3")!),
                                    titleLabel: "Instagram",
                                    titleCount: "654"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-4")!),
                                    titleLabel: "WhatsApp",
                                    titleCount: "14"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-1")!),
                                    titleLabel: "FaceApp",
                                    titleCount: "321"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-2")!),
                                    titleLabel: "Gradient",
                                    titleCount: "456"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-3")!),
                                    titleLabel: "Movavi Clips",
                                    titleCount: "321"),
                                  ModelCellAlbums(
                                    type: .cellMyAlbums,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-4")!),
                                    titleLabel: "Недавние",
                                    titleCount: "456")],
                     "Section1": [ModelCellAlbums(
                                    type: .cellPeopleAndPlaces,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-1")!),
                                    titleLabel: "Люди",
                                    titleCount: "9 259"),
                                  ModelCellAlbums(
                                    type: .cellPeopleAndPlaces,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-2")!),
                                    titleLabel: "Места",
                                    titleCount: "123"),
                                  ModelCellAlbums(
                                    type: .cellPeopleAndPlaces,
                                    titleImage: UIImageView.init(image: UIImage(named: "image-3")!),
                                    titleLabel: "Разное",
                                    titleCount: "654")],
                     "Section2": [ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "video")),
                                    titleLabel: "Видео",
                                    titleCount: "455"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "person.crop.square")),
                                    titleLabel: "Селфи",
                                    titleCount: "177"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "livephoto")),
                                    titleLabel: "Фото Live Photos",
                                    titleCount: "810"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "square.stack.3d.forward.dottedline")),
                                    titleLabel: "Портреты",
                                    titleCount: "449"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "timelapse")),
                                    titleLabel: "Таймлапс",
                                    titleCount: "15"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "slowmo")),
                                    titleLabel: "Замедленно",
                                    titleCount: "9"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "square.on.square")),
                                    titleLabel: "Серии",
                                    titleCount: "8"),
                                  ModelCellAlbums(
                                    type: .cellTypesOfMedia,
                                    titleImage: UIImageView.init(image: UIImage(systemName: "doc.text.viewfinder")),
                                    titleLabel: "Снимки экрана",
                                    titleCount: "801")],
        ]
        return data
    }
}

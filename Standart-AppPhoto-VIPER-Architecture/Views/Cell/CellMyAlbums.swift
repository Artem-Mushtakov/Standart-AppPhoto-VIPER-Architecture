//
//  CellMyAlbums.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

class CellMyAlbums: UICollectionViewCell {
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    // MARK: - Properties
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = MetricCellMyAlbums.labelFont
        label.textColor = .white
        return label
    }()
    
    lazy var titleCount: UILabel = {
        let label = UILabel()
        label.font = MetricCellMyAlbums.labelFont
        label.textColor = .gray
        return label
    }()
    
    lazy var titleImage: UIImageView = {
        let titleImage = UIImageView()

        return titleImage
    } ()
}

// MARK: - Setup Layout

extension CellMyAlbums {
    
    private func setupUI() {
        
        falseTranslatesAutoresizingMaskIntoConstraints()
        
        self.contentView.addSubview(titleImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(titleCount)

        titleImage.clipsToBounds = true
        titleImage.layer.masksToBounds = true
        titleImage.layer.cornerRadius = 5
        titleImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        NSLayoutConstraint.activate([
            
            titleImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: MetricCellMyAlbums.titleImageTopAnchorConstant),
            titleImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            titleImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: MetricCellMyAlbums.titleImageLeadingAnchorConstant),
            titleImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: MetricCellMyAlbums.titleImageTrailingAnchorConstant),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: MetricCellMyAlbums.titleLabelTopAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricCellMyAlbums.titleLabelLeadingAnchorConstant),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricCellMyAlbums.titleLabelTrailingAnchorConstant),
            
            titleCount.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: MetricCellMyAlbums.titleCountTopAnchorConstant),
            titleCount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: MetricCellMyAlbums.titleCountLeadingAnchorConstant),
            titleCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricCellMyAlbums.titleCountTrailingAnchorConstant),
        ])
    }
    
    private func falseTranslatesAutoresizingMaskIntoConstraints() {
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleCount.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric

struct MetricCellMyAlbums {
    
    static let labelFont = UIFont(name: "system", size: 17)
    
    static let titleImageTopAnchorConstant: CGFloat = 5
    static let titleImageLeadingAnchorConstant: CGFloat = 5
    static let titleImageTrailingAnchorConstant: CGFloat = -5
    
    static let titleLabelTopAnchorConstant: CGFloat = 5
    static let titleLabelLeadingAnchorConstant: CGFloat = 5
    static let titleLabelTrailingAnchorConstant: CGFloat = 5
    
    static let titleCountTopAnchorConstant: CGFloat = 5
    static let titleCountLeadingAnchorConstant: CGFloat = 5
    static let titleCountTrailingAnchorConstant: CGFloat = 5
}

//
//  СellTypesOfMedia.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

class СellTypesOfMedia: UICollectionViewCell {
    
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
        label.font = UIFont(name: "system", size: 18)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var titleCount: UILabel = {
        let label = UILabel()
        label.font = MetricСellTypesOfMedia.labelFont
        label.textColor = .gray
        return label
    }()
    
    lazy var titleImage: UIImageView = {
        let titleImage = UIImageView()
        return titleImage
    } ()
    
    private lazy var actionRightImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "thanMore")
        return image
    } ()
}

// MARK: - Setup Layout

extension СellTypesOfMedia {
    
    private func setupUI() {
        
        falseTranslatesAutoresizingMaskIntoConstraints()
        
        self.contentView.addSubview(titleImage)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(titleCount)
        self.contentView.addSubview(actionRightImage)
        
        NSLayoutConstraint.activate([
            
            titleImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: MetricСellTypesOfMedia.titleImageTopAnchorConstant),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleImage.widthAnchor.constraint(equalToConstant: MetricСellTypesOfMedia.titleImageWidthAnchorConstant
            ),
            titleImage.heightAnchor.constraint(equalToConstant: MetricСellTypesOfMedia.titleImageHeightAnchorConstant),
            
            titleLabel.topAnchor.constraint(equalTo: titleImage.topAnchor, constant: MetricСellTypesOfMedia.titleLabelTopAnchorConstant),
            titleLabel.leadingAnchor.constraint(equalTo: titleImage.leadingAnchor, constant: MetricСellTypesOfMedia.titleLabelLeadingAnchorConstant),
            
            titleCount.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleCount.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            titleCount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricСellTypesOfMedia.titleCountTrailingAnchorConstant),
            
            actionRightImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: MetricСellTypesOfMedia.actionRightImageTopAnchorConstant),
            actionRightImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: MetricСellTypesOfMedia.actionRightImageTrailingAnchorConstant),
            actionRightImage.widthAnchor.constraint(equalToConstant: MetricСellTypesOfMedia.actionRightImageWidthAnchorConstant),
            actionRightImage.heightAnchor.constraint(equalToConstant: MetricСellTypesOfMedia.actionRightImageHeightAnchorConstant)
        ])
    }
    
    private func falseTranslatesAutoresizingMaskIntoConstraints() {
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleCount.translatesAutoresizingMaskIntoConstraints = false
        actionRightImage.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric

struct MetricСellTypesOfMedia {
    
    static let labelFont = UIFont(name: "system", size: 17)
    
    static let titleImageTopAnchorConstant: CGFloat = 5
    static let titleImageWidthAnchorConstant: CGFloat = 30
    static let titleImageHeightAnchorConstant: CGFloat = 30
    
    static let titleLabelTopAnchorConstant: CGFloat = 5
    static let titleLabelLeadingAnchorConstant: CGFloat = 50
    
    static let titleCountTrailingAnchorConstant: CGFloat = -40
    
    static let actionRightImageTopAnchorConstant: CGFloat = 5
    static let actionRightImageTrailingAnchorConstant: CGFloat = -15
    static let actionRightImageWidthAnchorConstant: CGFloat = 6
    static let actionRightImageHeightAnchorConstant: CGFloat = 10
}

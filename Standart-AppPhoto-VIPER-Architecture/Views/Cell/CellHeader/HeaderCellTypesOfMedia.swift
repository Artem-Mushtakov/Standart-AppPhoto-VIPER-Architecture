//
//  HeaderCellTypesOfMedia.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

class HeaderCellTypesOfMedia: UICollectionReusableView {
    
    // MARK: - Properties
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Типы медиафайлов"
        label.textColor  = .white
        label.font = MetricHeaderCellTypesOfMedia.labelFont
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Setup Layout
    
    public func configure() {
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        falseTranslatesAutoresizingMaskIntoConstraints()
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: MetricHeaderCellTypesOfMedia.labeleTopAnchorConstant),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: MetricHeaderCellTypesOfMedia.labelLeadingAnchorConstant),
        ])
    }
    
    private func falseTranslatesAutoresizingMaskIntoConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric

struct MetricHeaderCellTypesOfMedia {
    
    static let labelFont: UIFont = .boldSystemFont(ofSize: 18)
    
    static let labeleTopAnchorConstant: CGFloat = 10
    static let labelLeadingAnchorConstant: CGFloat = 5
}

//
//  HeaderCellPeopleAndPlaces.swift
//  Standart-AppPhoto-VIPER-Architecture
//
//  Created by Артем on 15.09.2021.
//

import UIKit

class HeaderCellPeopleAndPlaces: UICollectionReusableView {
    
    // MARK: - Properties
    
    private var label: UILabel = {
        let label = UILabel()
        label.text = "Люди и места"
        label.textColor  = .white
        label.font = MetricHeaderCellPeopleAndPlaces.labelFont
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
            label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: MetricHeaderCellPeopleAndPlaces.labeleTopAnchorConstant),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: MetricHeaderCellPeopleAndPlaces.labelLeadingAnchorConstant),
        ])
    }
    
    private func falseTranslatesAutoresizingMaskIntoConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: - Metric

struct MetricHeaderCellPeopleAndPlaces {
    
    static let labelFont: UIFont = .boldSystemFont(ofSize: 18)
    
    static let labeleTopAnchorConstant: CGFloat = 10
    static let labelLeadingAnchorConstant: CGFloat = 5
}

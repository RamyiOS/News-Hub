//
//  TitleView.swift
//  News Hub
//
//  Created by Mac on 3/21/22.
//  Copyright © 2022 ramy. All rights reserved.
//

import UIKit

final class TitleView: UIView {
    
    private var fontSize: CGFloat
    
    
    init(fontSize: CGFloat) {
        self.fontSize = fontSize
        super.init(frame: .zero)
        configer()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Title.news
        label.font = UIFont.boldSystemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sFSymbolImage: UIImageView = {
        let caseImage = UIImageView()
        caseImage.contentMode = .scaleAspectFit
        
        let configuration = UIImage.SymbolConfiguration(pointSize: fontSize, weight: .bold)
        caseImage.image = UIImage(systemName: SFSymbolImage.name, withConfiguration: configuration)?.withRenderingMode(.alwaysOriginal)
        caseImage.backgroundColor = .systemBackground
        caseImage.translatesAutoresizingMaskIntoConstraints = false
        return caseImage
    }()
    
    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sFSymbolImage, titleLabel])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var subTileLabel: UILabel = {
        let label = UILabel()
        label.text = Title.headlines
        label.font.withSize(fontSize)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private func configer() {
        setViews()
        layoutUI()
    }
    
    private func setViews() {
        addSubview(titleStackView)
        addSubview(subTileLabel)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layoutUI() {
        NSLayoutConstraint.activate([
            titleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleStackView.topAnchor.constraint(equalTo: topAnchor, constant: -8),
            
            subTileLabel.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant:8),
            subTileLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            subTileLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}

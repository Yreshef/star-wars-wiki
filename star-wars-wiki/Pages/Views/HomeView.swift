//
//  HomeView.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 02/08/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import UIKit

public class HomeView: UIView {
    
    // MARK: - Properties | Components
    
    
    // MARK: - Properties | Variables
    
    
    // MARK: - Life Cycle
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Subviews
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    
    // MARK: - Methods
    
    private func setConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 50).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        backgroundColor = .white
        setConstraints()
    }

}

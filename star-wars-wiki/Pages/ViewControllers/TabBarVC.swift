//
//  TabBarVC.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 03/08/2021.
//  Copyright © 2021 YReshef. All rights reserved.
//

import UIKit

public class TabBarVC: UITabBarController, UITabBarControllerDelegate{
    
    // MARK: - Properties | Components
    var swapiInteractor: SWAPIInteracting
    var logger: Logging
    
    
    // MARK: - Properties | Variables
    
    
    // MARK: - Initializers
    
    init(swapiInteractor: SWAPIInteracting, logger: Logging) {
        self.swapiInteractor = swapiInteractor
        self.logger = logger
        super.init(nibName: nil, bundle: nil)
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Disable Landscape
    
    override public var shouldAutorotate: Bool {
        return false
    }
    
    override public var supportedInterfaceOrientations:
        UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    // MARK: - Methods
    
    private func setupTabBar() {
        //TODO: Add required tabs here
        
        let homeVC = HomeVC(logger: logger, swapiInteractor: swapiInteractor)
        let discoverVC = HomeVC(logger: logger, swapiInteractor: swapiInteractor)
        let searchVC = HomeVC(logger: logger, swapiInteractor: swapiInteractor)
        
        homeVC.title = "Home"
        discoverVC.title = "Discover"
        searchVC.title = "Search"
    }

}

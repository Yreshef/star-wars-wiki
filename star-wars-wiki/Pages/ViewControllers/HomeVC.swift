//
//  HomeVC.swift
//  star-wars-wiki
//
//  Created by Yohai Reshef on 7/31/21.
//

import UIKit
import Combine

class HomeVC: UIViewController {
    
    // MARK: - Properties | Dependencies
    
    private let logger: Logging
    private let swapiInteractor: SWAPIInteracting
    private let homeView = HomeView()
    
    // MARK: - Properties | Components
    
    private var subscriptions: Set<AnyCancellable> = []
    private var swPeople = [Person]()
    var person: Person? {
        didSet{
            if let person = person {
                print(person)
            }
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    
    
    init(logger: Logging, swapiInteractor: SWAPIInteracting) {
        self.logger = logger
        self.swapiInteractor = swapiInteractor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logger.info("View loaded")
        view.addSubview(homeView)
        homeView.anchor(top: view.topAnchor,
                        leading: view.leadingAnchor,
                        bottom: view.bottomAnchor,
                        trailing: view.trailingAnchor)
        homeView.titleLabel.text = "Moshe!"
        
        swapiInteractor.requestPerson(id: "1").sink { [weak self] completion in
            switch completion {
            case .finished: break
            case .failure(let error):
                self?.logger.error("\(error)")
            }
        } receiveValue: { person in
            self.person = person
            self.titleLabel.text = person.name
        }.store(in: &subscriptions)
    }
}


//
//  File.swift
//  ItsHappening
//
//  Created by Oleg McNamara on 4/4/20.
//  Copyright © 2020 Oleg McNamara. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController<HomeViewModel> {
    
    let label: UILabel = {
        let l = UILabel()
        l.text = "asdfasdfasdf"
        return l
    }()
    
    override func setupUI() {
        self.view.add(label)
        
        label.makeLayout {
            $0.centerX.equalToSuperView()
            $0.centerY.equalToSuperView()
        }
        FirebaseAuthService.sharedInstance.loggedInUser.subscribe(onNext: { [weak self] (happeningUser) in
            self?.label.text = happeningUser?.firstName ?? "logged out"
        }).disposed(by: disposeBag)
        label.addTapGestureRecognizer {
            FirebaseAuthService.sharedInstance.logout()
        }
    }
    
    override func setupBinding() {
        
    }
}
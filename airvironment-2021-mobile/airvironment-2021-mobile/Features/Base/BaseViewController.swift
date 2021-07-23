//
//  BaseViewController.swift
//  airvironment-2021-mobile
//
//  Created by Letnja Praksa 5 on 23.7.21..
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T!
    
    var loadingOverlay: LoadingOverlay = LoadingOverlay()
    
    private var loadingObserver: [NSKeyValueObservation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        observeLiveData()
    }
    
    private func observeLiveData() {
        loadingObserver = [viewModel.observe(\.isLoading, options: .new) { _, isLoading  in
            if let isLoading = isLoading.newValue {
                if (isLoading) {
                    self.loadingOverlay.show()
                }
                else {
                    self.loadingOverlay.hide()
                }
            }
        }]
    }
}

//
//  UnlockAppViewModel.swift
//  Bouncer
//

import Foundation
import Combine

class UnlockAppViewModel: ObservableObject {
    
    //let storeService: StoreService
    //var productsCancellable: AnyCancellable?
    //var transactionStateCancellable: AnyCancellable?
    
//    @Published private(set) var products: [Product] = []
//    @Published private(set) var shouldDisplayBuyButton: Bool = true
//    @Published private(set) var transactionCompletedSuccessdfully: Bool = false
    
    init(storeService: StoreService = StoreServiceDefault()) {
//        self.storeService = storeService
//
//        productsCancellable =
//            storeService
//                .productsPublisher
//                .receive(on: RunLoop.main)
//                .sink { [weak self] products in
//                    self?.products = products
//            }
//
//        transactionStateCancellable =
//            storeService
//                .transactionStatePublisher
//                .receive(on: RunLoop.main)
//                .sink { [weak self] state in
//                    self?.manageTransactionCompletion(state: state)
//            }
//    }
    
    func purchase(product: Product) {
        //self.shouldDisplayBuyButton = false
        storeService.startPurchase(product: product)
    }
    
    func restorePurchases() {
        //self.shouldDisplayBuyButton = false
        storeService.restorePurchases()
    }
    
    func manageTransactionCompletion(state: StoreTransactionState) {
        switch state {
        case .notInitiated, .cancelled, .failed, .restoreFailed, .processing:
            break
            //self.shouldDisplayBuyButton = true
        case .completed, .restored:
            break
            //self.transactionCompletedSuccessdfully = true
        }}
    }
}

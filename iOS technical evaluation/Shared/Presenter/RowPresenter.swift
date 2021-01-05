//
//  RowPresenter.swift
//  iOS technical evaluation
//
//  Created by Jiren on 05/01/21.
//

import Foundation
import Combine

class RowPresenter {
    var view: VJourney?
    var repository: IRowRepo?
    var cancellables = Set<AnyCancellable>()
    
    init(repository: IRowRepo = RowRepo()){
        self.repository = repository
    }
    
    func loadData() {
        repository?.getData()
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                debugPrint(completion)
            }, receiveValue: { [self] value in
                view?.fill(data: value)
                
            }).store(in: &cancellables)
    }
    
    static func getPresenter(view: VJourney) -> RowPresenter {
        let presener = RowPresenter()
        presener.view = view
        return presener
    }
}

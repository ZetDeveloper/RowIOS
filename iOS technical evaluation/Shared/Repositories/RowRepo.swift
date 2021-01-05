//
//  RowRepo.swift
//  iOS technical evaluation
//
//  Created by Jiren on 05/01/21.
//

import Foundation
import Combine

protocol IRowRepo {
    func getData() -> Future<RowModel,Never>
}

class RowRepo: IRowRepo {
    func getData() -> Future<RowModel, Never> {
        Future<RowModel, Never> { promise in
            if let path = Bundle.main.path(forResource: "data", ofType: ".json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(RowModel.self, from: data)
                    return promise(.success(jsonData))
                } catch let error {
                    debugPrint(error)
                    return promise(.success([]))
                }
            } else {
                return promise(.success([]))
            }
        }
    }
}

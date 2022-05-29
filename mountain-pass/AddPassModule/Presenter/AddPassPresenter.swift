//
//  AddPassPresenter.swift
//  mountain-pass
//
//  Created by Vasily on 21.05.2022.
//

import Foundation
import SwiftUI

protocol AddPassViewProtocol {
    
}

protocol AddPassPresenterProtocol {
    init(view: AddPassViewProtocol, model: MountainPass)
}

class AddPassPresenter: AddPassPresenterProtocol {
    let view: AddPassViewProtocol!
    let model: MountainPass!
    
    required init(view: AddPassViewProtocol, model: MountainPass) {
        self.view = view
        self.model = model
    }
    
    func makePOSTRequest() {
        guard let url = URL(string: "https://pereval2602.herokuapp.com/api/v1/pereval/") else { return }
        
        
        var request = URLRequest(url: url)
//        method, body, headers
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: AnyHashable] = [
            :
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        
//        Make the request
        
        let task =  URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("SUCCESS: \(response)")
            }
            catch {
                print(error)
            }

        }
        task.resume()
    }
    
    
}

struct Responce: Codable {
    
}


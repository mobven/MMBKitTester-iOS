//
//  StateMachineFormsService.swift
//  MMBKitTester
//
//  Created by Eren Bayrak on 13.05.2020.
//  Copyright © 2020 Mobven. All rights reserved.
//

import Foundation
import StateMachineForms

class StateMachineFormsService {
    
    var className: String
    
    init(className: String) {
        self.className = className
    }
    
    func getFormsClass(completion: @escaping (([Form]?, Error?) -> Void)) {
        guard let url = URL(string: "https://capture.mobven.com:4043/mmkit/classes/\(className)") else {
            completion(nil, nil)
            return
        }
        var request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                                 timeoutInterval: TimeInterval(60))
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-Parse-Application-Id": "cGzULzD6IY7PmVPJheOtbZTLtXnupEmA"
        ]
        URLSession.shared.dataTask(with: request) { [ weak self ] (data, _, _) in
            DispatchQueue.main.async { [ weak self ] in
                self?.formsResult(data, completion: completion)
            }
            
        }.resume()
    }
    
    func formsResult(_ data: Data?, completion: @escaping (([Form]?, Error?) -> Void)) {
        do {
            if let data = data {
                if let jsonObject = try? JSONSerialization.jsonObject(with: data,
                                                                      options: .fragmentsAllowed) as? [String: Any] {
                    if let results = jsonObject["results"] as? [[String: Any]] {
                        let sortedResults = results.sorted { (result1, result2) -> Bool in
                            if let index1 = result1["index"] as? Int,
                                let index2 = result2["index"] as? Int {
                                return index2 > index1
                            } else {
                                return false
                            }
                        }
                        
                        let data = try JSONSerialization.data(withJSONObject: sortedResults, options: .fragmentsAllowed)
                        let decodedObject = try JSONDecoder().decode([Form]?.self, from: data)
                        completion(decodedObject, nil)
                    }
                }
            }
        } catch {
            completion(nil, error)
        }
    }
}

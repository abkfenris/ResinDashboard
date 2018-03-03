//
//  ResinAPIManager.swift
//  ResinDashboard
//
//  Created by Alex Kerney on 2/19/18.
//  Copyright © 2018 Alex Kerney. All rights reserved.
//

import Foundation

class ResinAPI {
    static let shared = ResinAPI()
    
    private var token: String?
    
    private var applications: [String: Application] = [:]
    private var devices: [String: Device] = [:]
    
    let baseURL = URL(string: "https://api.resin.io/v1/")!
    
    func setToken(token: String) {
        self.token = token
    }
    
    func setHeaders(url: URL) -> URLRequest? {
        guard let token = token else { return nil }
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    func fetchApplications(completion: @escaping (Applications?, String?) -> Void) {
        let applicationsURL = baseURL.appendingPathComponent("application")
        
        if let request = setHeaders(url: applicationsURL) {
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                /*let jsonDecoder = JSONDecoder()
                if let data = data, let apps = try? jsonDecoder.decode(Applications.self, from: data) {
                 
                    if self.applications.count > 0 {
                        self.applications.removeAll()
                    }
                    completion(apps, nil)

                } else {
                    completion(nil, "Unable to decode json")
                }*/
                if let data = data, let string = String(data: data, encoding: .utf8) {
                    print(string)
                }
            }
            task.resume()
        } else {
            completion(nil, "Unable to create request. Is the Resin token set?")
        }
        
    }
    
    func fetchDevices() {
        
    }
    
    func applicationById(id: String) -> Application? {
        if let app = applications[id] {
            return app
        }
        return nil
    }
    
    func deviceById(id: String) -> Device? {
        if let device = devices[id] {
            return device
        }
        return nil
    }
}

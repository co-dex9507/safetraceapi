//
//  Submit.swift
//  SafeTrace Demo
//
//  Created by Jack Hester on 3/26/20.
//  Copyright © 2020 SafeTrace API. All rights reserved.
//
import Foundation

//post new phone nubmer to user endpoint
func phonePoster(post: postPhone, completion:((Error?) -> Void)?) {
    
    let url_str = "https://safetraceapi.herokuapp.com/api/users"
    guard let url = URL(string: url_str) else {fatalError()}
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    var headers = request.allHTTPHeaderFields ?? [:]
    headers["Content-Type"] = "application/json"
    request.allHTTPHeaderFields = headers
    
    
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(post)
        // ... and set our request's HTTP body
        request.httpBody = jsonData
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
    } catch {
        completion?(error)
    }
    
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else {
            completion?(responseError!)
            return
        }
        
        
        if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
            print("response: ", utf8Representation)
        } else {
            print("no readable data received in response")
        }
    }
    task.resume()
}

//post location to event endpoint
func postGPSInfo(post: postLoc, completion:((Error?) -> Void)?) {
    
    let url_str = "https://safetraceapi.herokuapp.com/api/events"
    guard let url = URL(string: url_str) else {fatalError()}
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    var headers = request.allHTTPHeaderFields ?? [:]
    headers["Content-Type"] = "application/json"
    request.allHTTPHeaderFields = headers
    
    
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(post)
        
        request.httpBody = jsonData
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
    } catch {
        completion?(error)
    }
    
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else {
            completion?(responseError!)
            return
        }
        
        
        if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
            print("response: ", utf8Representation)
        } else {
            print("no readable data received in response")
        }
    }
    task.resume()
}

//post symptoms to event endpoint
func postSymptomInfo(post: postSymptoms, completion:((Error?) -> Void)?) {
    
    let url_str = "https://safetraceapi.herokuapp.com/api/events"
    guard let url = URL(string: url_str) else {fatalError()}
    // Specify this request as being a POST method
    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    var headers = request.allHTTPHeaderFields ?? [:]
    headers["Content-Type"] = "application/json"
    request.allHTTPHeaderFields = headers
    
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(post)
        
        request.httpBody = jsonData
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
    } catch {
        completion?(error)
    }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else {
            completion?(responseError!)
            return
        }
        
        if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
            print("response: ", utf8Representation)
        } else {
            print("no readable data received in response")
        }
    }
    task.resume()
}

//send test status to event endpoint
func postTestStatus(post: postTest, completion:((Error?) -> Void)?) {
    
    let url_str = "https://safetraceapi.herokuapp.com/api/events"
    guard let url = URL(string: url_str) else {fatalError()}

    var request = URLRequest(url: url)
    request.httpMethod = "POST"

    var headers = request.allHTTPHeaderFields ?? [:]
    headers["Content-Type"] = "application/json"
    request.allHTTPHeaderFields = headers
    
    // Now let's encode out Post struct into JSON data...
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(post)
        // ... and set our request's HTTP body
        request.httpBody = jsonData
        print("jsonData: ", String(data: request.httpBody!, encoding: .utf8) ?? "no body data")
    } catch {
        completion?(error)
    }
    
    let config = URLSessionConfiguration.default
    let session = URLSession(configuration: config)
    let task = session.dataTask(with: request) { (responseData, response, responseError) in
        guard responseError == nil else {
            completion?(responseError!)
            return
        }
        
        if let data = responseData, let utf8Representation = String(data: data, encoding: .utf8) {
            print("response: ", utf8Representation)
        } else {
            print("no readable data received in response")
        }
    }
    task.resume()
}

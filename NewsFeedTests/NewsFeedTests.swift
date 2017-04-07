//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by Mossial on 4/6/2560 BE.
//  Copyright © 2560 Mossial. All rights reserved.
//

import XCTest
@testable import NewsFeed

class NewsFeedTests: XCTestCase {
    
    func xtestNewsAPIConnection() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let headers = [
            "cache-control": "no-cache",
            "postman-token": "57fedfde-c2d8-258f-cc0d-8ae598d09853"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://newsapi.org/v1/articles?source=techcrunch&apiKey=452de9db12a4456c98e72d3075baae05")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        let expect = expectation(description: "Wait until get response")
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                print(error!)
                return
            }
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse ?? "nil")
            guard let data = data else {
                XCTAssertNotNil(nil)
                expect.fulfill()
                return
            }
            let responseString = String(data: data, encoding: .utf8)
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            XCTAssertNotNil(responseString, "reponse data should not nil")
            XCTAssertNotNil(responseJSON, "respone json should not nil")
            print(responseString!)
            expect.fulfill()
        })
        
        dataTask.resume()
        waitForExpectations(timeout: 20) { (error) in
            XCTAssertNil(error)
        }
    }
    
}

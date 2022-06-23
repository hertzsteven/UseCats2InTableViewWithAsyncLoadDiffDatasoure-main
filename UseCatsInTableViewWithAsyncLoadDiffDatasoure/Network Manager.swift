    //
    //  Network Manager.swift
    //  UseCatsInTableViewWithAsyncLoadDiffDatasoure
    //
    //  Created by Steven Hertz on 6/17/22.
    //


    //
    //  Network Manager.swift
    //  LearnCollectionVCWithAsyncImages
    //
    //  Created by Steven Hertz on 5/31/22.
    //

import UIKit


enum GettingDataError: Error {
    case dataTask
    case response(URLResponse)
    case jsonConvert
    case dataToImage
}

class GettingDataManager{
    
    static let shared: GettingDataManager = {
        let gettingDataManager = GettingDataManager()
        return gettingDataManager
    }()
    
    let session: URLSession
    private init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    
    func getTheImage(url: String, doThisWhenFinished completion:@escaping (Result<UIImage,Error>) -> Void) -> Void {
        print("--- in \(#function) at line \(#line)")
        
            // Convert the string into a URL
        guard let theURL = URL(string: url) else { fatalError("error converting url") }
        
        let task = URLSession.shared.dataTask(with: theURL) { data, response, error in
            
            if error != nil {
                print("there was an error")
                completion(.failure(GettingDataError.dataTask))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print(response as Any)
                guard let response = response as? HTTPURLResponse else {
                    fatalError("converting the respinse")
                }
                completion(.failure(GettingDataError.response(response)))
                return
            }
            
            guard let data = data else {
                fatalError("data not retreived")
            }
            
            
                //do the decoding from here
            print(" in \(#function) at line \(#line)")
            do {
                guard let image = UIImage(data: data) else { fatalError("could not convert data to image")}
                completion(.success(image))
                
            } catch let error {
                print("error decoding the response \(error)")
                completion(.failure(GettingDataError.dataToImage))
            }
            
        }
        task.resume()
        
    }
    
}

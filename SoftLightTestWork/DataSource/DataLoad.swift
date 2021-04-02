//
//  DataLoad.swift
//  SoftLightTestWork
//
//  Created by Дмитрий Жучков on 31.03.2021.
//

import Foundation
class DataLoad {
    static let service = DataLoad()
     
    func getData(completed: @escaping (JSONDecode) -> ()) {
         
         let urlString = "https://api.github.com/repos/videolan/vlc/contributors"
         guard let url = URL(string: urlString) else {return}
         
         let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
             
             if let _ = error {
                 return
             }
             
             guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
    
                 return
             }
             
             guard let data = data else {

                 return
             }
             
             do {
                 let deconder = JSONDecoder()
                 let jsonData = try deconder.decode(JSONDecode.self, from: data)
                 completed(jsonData)
             } catch {
             }
             
         }
         task.resume()
         
     }
}

//
//  NPApi.swift
//  PlayersAssesment
//
//  Created by kamal abdelmonem on 17/03/2023.
//

import Foundation
import Alamofire

class NPApi {
    
    static let shared = NPApi()
    
    enum URLS: String {
        case players = "players"
        case playerDetails = "player/details"
    }
    
    let baseURL="https://ios.app99877.com/api/sc/"
    
    
    func request<T:Codable>(Url:String,parameters:Dictionary<String,Any>?,success:@escaping (_ response:T?)->(),failure:@escaping (_ response:APIError?)->(),method:HTTPMethod,requiresAuth:Bool)
    {
        let manager = Alamofire.Session.default
        let headers : HTTPHeaders = HTTPHeaders()
        
        manager.request(Url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers:headers).responseJSON { (dataResponse) in
            print("Full-Response : \(Url) : ",dataResponse)
            switch dataResponse.result {
            case .success( _):
                do{
                    let msg = try JSONDecoder().decode(T.self, from: dataResponse.data!)
                    success(msg)
                }
                catch let error {
                    failure(APIError(mssage: "\(error)"))
                }
            case .failure(let error):
                print(error.localizedDescription)
                let data = try? JSONDecoder().decode(APIError.self, from: dataResponse.data ?? Data())
                failure(data)
            }
        }
    }

    func getPlayers(success: @escaping ((_ response:PlayersResponse?)->()), failure: @escaping ((_ response:APIError?)->())) {
        let url:String=String(format:"\(baseURL)\(URLS.players.rawValue)")
        self.request(Url: url , parameters: nil, success: success, failure:failure,method: .get,requiresAuth: false)
    }
    
    func getPlayerDetails(slug:String,success: @escaping ((_ response:PlayerDetailsResponse?)->()), failure: @escaping ((_ response:APIError?)->())) {
        let url:String=String(format:"\(baseURL)\(URLS.playerDetails.rawValue)")
        let params = [
            "slug":slug
        ]
        self.request(Url: url , parameters: params, success: success, failure:failure,method: .post,requiresAuth: false)
    }

}

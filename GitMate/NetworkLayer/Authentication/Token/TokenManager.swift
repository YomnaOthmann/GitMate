//
//  TokenManager.swift
//  GitMate
//
//  Created by Yomna Othman on 13/05/2024.
//

import Foundation
import Combine
import Alamofire

class TokenManager{
    
    static let shared = TokenManager()
    
    let secureStore: SecureStore = {
        let accessTokenQueryable = GenericPasswordQueryable(service: "GithubService")
        return SecureStore(secureStoreQueryable: accessTokenQueryable)
    }()
    
    private init(){}
    
    func fetchAccessTokenPublisher(accessCode: String) -> AnyPublisher<Bool, Error>{
        
        let headers: HTTPHeaders = [
            "Accept" : "application/json"
        ]
        
        let parameters = [
            "client_id" : TokenConstants.clientID,
            "client_secret" : TokenConstants.clientSecret,
            "code" : accessCode
        ]
        
        return  RequestHandler.shared.session.request(
            TokenConstants.accessTokenURL,
            method: .post,
            parameters: parameters,
            headers: headers
        )
        .publishDecodable(type: AccessTokenEntity.self)
        .tryMap { response in
            guard let cred = response.value else{
                throw URLError(.badServerResponse)
            }
            TokenManager.shared.saveAccessToken(gitToken: cred)
            return true
        }
        .eraseToAnyPublisher()
        
    }
    
    func fetchAcessToken(accessCode:String) async throws -> Bool {
        let publisher = fetchAccessTokenPublisher(accessCode: accessCode)
        return try await withCheckedThrowingContinuation { continuation in
            var cancellable :AnyCancellable?
            cancellable = publisher.sink(receiveCompletion: { completion in
                if case .failure(let error) = completion{
                    continuation.resume(throwing: error)
                }
                cancellable?.cancel()
            }, receiveValue: { success in
                continuation.resume(returning: success)
            })
        }
    }
    
    func saveAccessToken(gitToken: AccessTokenEntity){
        do{
            try secureStore.setValue(gitToken.accessToken, for: TokenConstants.userAccount)
        }catch let exception {
            print("Error Saving Access Token\(exception)")
        }
    }
    
    func fetchAccessToken()->String?{
        do{
            let token = try secureStore.getValue(for: TokenConstants.userAccount)
            return token
        }catch let exception{
            print("Error Fetching Token \(exception)")
        }
        return nil
    }
    
    func clearAccessToken(){
        do{
            try secureStore.removeValue(for: TokenConstants.userAccount)
        }catch let exception{
            print("Error Removing Token \(exception)")
        }
    }
}

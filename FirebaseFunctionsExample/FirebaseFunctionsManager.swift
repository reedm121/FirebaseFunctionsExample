//
//  FirebaseFunctionsManager.swift
//  FirebaseFunctionsExample
//
//  Created by Reed Gantz on 11/26/24.
//

import Foundation
import FirebaseFunctions

class FirebaseFunctionsManager: ObservableObject {
    var functions = Functions.functions()
    
    func callHelloWorld() async throws -> ResponseData {
        do {
            let result = try await functions.httpsCallable("helloWorld").call()
            
            // Decode response directly into responseData struct
            if let data = result.data as? [String: Any],
               let jsonData = try? JSONSerialization.data(withJSONObject: data),
               let decodedResponse = try? JSONDecoder().decode(ResponseData.self, from: jsonData) {
                return decodedResponse
            } else {
                throw NSError(domain: "InvalidResponse", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unexpected response format."])
            }
        } catch {
            throw error
        }
    }
}

struct ResponseData: Codable {
    var message: String = "no message set by Firebase function yet"
    var timestamp: Int = 0
}

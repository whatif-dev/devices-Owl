//
//  JSONDecoder+Decoding.swift
//  UntitledAI
//
//  Created by ethan on 1/23/24.
//

import Foundation

extension JSONDecoder {
    static func decode<T: Codable>(_ type: T.Type, from jsonString: String) -> Result<T, Error> {
        guard let data = jsonString.data(using: .utf8) else {
            return .failure(DecodingError.dataCorrupted(DecodingError.Context(codingPath: [], debugDescription: "Data conversion failed")))
        }
        
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedObject)
        } catch {
            return .failure(error)
        }
    }
}

extension JSONDecoder {
    static func dateDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0) // Adjust if necessary
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
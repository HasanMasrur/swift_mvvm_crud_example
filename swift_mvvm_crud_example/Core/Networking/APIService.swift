import Foundation

class APIService {
    
    func fetchData<T: Decodable>(from endpoint: APIEndpoint) async -> Result<T, NetworkError> {
        guard let url = endpoint.url else {
            return .failure(.invalidURL)
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                return .failure(.serverError(statusCode: httpResponse.statusCode))
            }
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch let error {
            return .failure(.networkFailure(error))
        }
    }
    
    func postData<T: Decodable, U: Encodable>(to endpoint: APIEndpoint, body: U) async -> Result<T, NetworkError> {
        guard let url = endpoint.url else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        do {
            request.httpBody = try JSONEncoder().encode(body)
            let (data, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                return .failure(.serverError(statusCode: httpResponse.statusCode))
            }
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedData)
        } catch let error {
            return .failure(.networkFailure(error))
        }
    }
    
    func deleteData(from endpoint: APIEndpoint) async -> Result<Bool, NetworkError> {
        guard let url = endpoint.url else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        do {
            let (_, response) = try await URLSession.shared.data(for: request)
            if let httpResponse = response as? HTTPURLResponse, !(200...299).contains(httpResponse.statusCode) {
                return .failure(.serverError(statusCode: httpResponse.statusCode))
            }
            return .success(true)
        } catch let error {
            return .failure(.networkFailure(error))
        }
    }
}

import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case noData
    case decodingError
    case serverError(statusCode: Int)
    case networkFailure(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL. Please contact support."
        case .noData:
            return "No data received from the server."
        case .decodingError:
            return "Failed to decode data. Please try again later."
        case .serverError(let statusCode):
            return "Server error (Status code: \(statusCode)). Please try again later."
        case .networkFailure(let error):
            return "Network error: \(error.localizedDescription)"
        }
    }
}

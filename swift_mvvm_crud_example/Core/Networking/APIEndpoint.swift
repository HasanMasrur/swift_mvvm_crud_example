import Foundation

enum APIEndpoint {
    case posts
    case postDetail(id: Int)
    case createPost
    case deletePost(id: Int)
    
    var url: URL? {
        let baseURL = "https://jsonplaceholder.typicode.com"
        switch self {
        case .posts:
            return URL(string: "\(baseURL)/posts")
        case .postDetail(let id):
            return URL(string: "\(baseURL)/posts/\(id)")
        case .createPost:
            return URL(string: "\(baseURL)/posts")
        case .deletePost(let id):
            return URL(string: "\(baseURL)/posts/\(id)")
        }
    }
}

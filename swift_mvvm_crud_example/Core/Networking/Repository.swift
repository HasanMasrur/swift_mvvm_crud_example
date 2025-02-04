import Foundation

class PostRepository {
    private let apiService = APIService()
    
    func fetchPosts() async -> Result<[PostModel], NetworkError> {
        return await apiService.fetchData(from: .posts)
    }
    
    func fetchPostDetail(id: Int) async -> Result<PostModel, NetworkError> {
        return await apiService.fetchData(from: .postDetail(id: id))
    }
    
    func createPost(title: String, body: String) async -> Result<PostModel, NetworkError> {
        let newPost = PostModel(id: 0, title: title, body: body)
        return await apiService.postData(to: .createPost, body: newPost)
    }
    
    func deletePost(id: Int) async -> Result<Bool, NetworkError> {
        return await apiService.deleteData(from: .deletePost(id: id))
    }
}

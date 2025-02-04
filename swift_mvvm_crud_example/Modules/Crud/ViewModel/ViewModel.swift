import Foundation

@MainActor
class PostViewModel: ObservableObject {
    @Published var posts: [PostModel] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    private let repository = PostRepository()
    
    func fetchPosts() async {
        isLoading = true
        errorMessage = nil
        
        switch await repository.fetchPosts() {
        case .success(let posts):
            self.posts = posts
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}

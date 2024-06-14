//
//  PostViewModel.swift
//  APITest
//
//  Created by Subham Dhakal on 6/3/24.
//

import Alamofire
import Combine

@available(iOS 17, *)
class PostViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var errorMessage: String?

    func fetchPosts() {
        let url = "https://jsonplaceholder.typicode.com/posts"
        
        AF.request(url).responseDecodable(of: [Post].self) { response in
            switch response.result {
            case .success(let posts):
                DispatchQueue.main.async {
                    self.posts = posts
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.errorMessage = error.localizedDescription
                    self.posts = []
                }
            }
        }
    }
}

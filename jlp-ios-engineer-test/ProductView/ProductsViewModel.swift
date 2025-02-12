import Foundation
import UIKit

class ProductsViewModel {
    var products: [ProductElement] = []
    
    func fetchProducts(urlPaths: URLPaths, completion: @escaping () -> Void) {
        NetworkManager.shared.request(url: urlPaths) { (result: Result<Product, APIError>) in
            switch result {
            case .success(let data):
                self.products = data.products
            
                completion()
            case .failure(let error):
                print("Error fetching products: \(error)")
            }
        }
        
    }
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(UIImage(named: "Placeholder.jpg"))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, error == nil {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(UIImage(named: "Placeholder.jpg"))
                }
            }
        }.resume()
    }
}

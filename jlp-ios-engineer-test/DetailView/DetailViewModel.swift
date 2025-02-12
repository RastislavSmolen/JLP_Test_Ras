import Foundation
import UIKit

class DetailViewModel {
    var detailProduct: [DetailsData] = []
   
    func fetchProductsDetail(urlPaths: URLPaths, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            NetworkManager.shared.request(url: urlPaths) { (result: Result<ProductDetailData, APIError>) in
                switch result {
                case .success(let data):
                    self.detailProduct = data.detailsData
                    
                    completion()
                case .failure(let error):
                    print("Error fetching products: \(error)")
                }
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
    

    
    func stripHTML(_ html: String) -> String {
        let regex = try? NSRegularExpression(pattern: "<[^>]+>", options: .caseInsensitive)
        return regex?.stringByReplacingMatches(in: html, options: [], range: NSRange(location: 0, length: html.count), withTemplate: "") ?? html
    }
}

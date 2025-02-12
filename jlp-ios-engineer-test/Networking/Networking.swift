import Foundation

// MARK: - APIError
enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

// MARK: - HTTPMethod
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

// MARK: - Endpoint
///  NOTE This would be used if you had a real endpoint with different paths

//protocol Endpoint {
//    var path: String { get }
//    var method: HTTPMethod { get }
//    var queryParameters: [String: String]? { get }
//    var body: Data? { get }
//}

//struct ProductEndpoint: Endpoint {
//    var path: String { "" }
//    var method: HTTPMethod { .get }
//    var queryParameters: [String: String]? { nil }
//    var body: Data? { nil }
//}

enum URLPaths: String {
    case productsPageURL = "https://gitlab.com/jlp-jobs/jlp-ios-engineer-test/-/raw/main/mockData/data.json?ref_type=hea"
    case detailViewURL = "https://gitlab.com/jlp-jobs/jlp-ios-engineer-test/-/raw/main/mockData/data2.json?ref_type=heads"
    
    func rawValue() -> String {
        self.rawValue
    }
}

// MARK: - NetworkManager
class NetworkManager {
    static let shared = NetworkManager()
    private var session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(url: URLPaths, completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: url.rawValue) else {
            completion(.failure(.invalidURL))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
  
        let task = session.dataTask(with: urlRequest) { data, response, error in 
            if let error = error {
                completion(.failure(.requestFailed(error)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidResponse))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedResponse))
                }
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        task.resume()
    }
}

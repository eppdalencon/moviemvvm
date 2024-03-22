import Foundation


class MovieService {
    
    static var urlStringPopular = "https://api.themoviedb.org/3/movie/popular?api_key=f179d970a1a37d56685f7e23c024008e&language=en-US&page="
    static var urlStringNowPlaying = "https://api.themoviedb.org/3/movie/now_playing?api_key=f179d970a1a37d56685f7e23c024008e&language=en-US&page="
    
     static func loadData(page: Int, url: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string:url + String(page)) else { return }
        
        URLSession.shared.dataTask(with: url) {  data, response, error in
            
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil,
                  let data = data
            else {
                print(error ?? "error")
                return
            }
            
            
            
            // Parse data
            let parsedData = self.decodeByProtocols(data: data, isPopular: true)
            
            
            
            completion(parsedData)
            
        }
        .resume()
    }
    
    //MARK: Decode Response
     static  func decodeByProtocols(data: Data, isPopular: Bool) -> [Movie] {
        do {
            let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            
            return decodedResponse.results
            
        } catch {
            print("Decoding Error: \(error)")
            return []
        }
    }
    
     static func getImage(urlString: String, completionBlock: @escaping (Data, String) -> Void) {
       
        guard let url = URL(string: "https://image.tmdb.org/t/p/w200" + urlString) else { fatalError() }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
           
            guard let response = response as? HTTPURLResponse,
                  response.statusCode == 200,
                  error == nil,
                  let data = data
            else {
                print(error ?? "error")
                return
            }
            
            completionBlock(data,  urlString)
        }
        .resume()
    }
    
    
}


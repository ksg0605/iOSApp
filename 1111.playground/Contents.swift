import UIKit

// MARK: - Welcome
struct MusicData: Codable {
    let resultCount: Int
    let results: [Music]
}

// MARK: - Result
struct Music: Codable {
    
    let artistName: String
    let collectionName: String
    let trackName : String
    let previewURL: String
    let artworkUrl100: String
    let releaseDate: Date

    enum CodingKeys: String, CodingKey {
        case artistName
        case collectionName
        case trackName
        case previewURL = "previewUrl"
        case artworkUrl100
        case releaseDate
    }
}


func getMethod() {

    // URL구조체 만들기
    guard let url = URL(string: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20120101") else {
        print("Error: cannot create URL")
        return
    }
    
    // URL요청 생성
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    
    // 요청을 가지고 작업세션시작
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        // 에러가 없어야 넘어감
        guard error == nil else {
            print("Error: error calling GET")
            print(error!)
            return
        }
        // 옵셔널 바인딩
        guard let safeData = data else {
            print("Error: Did not receive data")
            return
        }
        // HTTP 200번대 정상코드인 경우만 다음 코드로 넘어감
        guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
            print("Error: HTTP request failed")
            return
        }

        // 원하는 모델이 있다면, JSONDecoder로 decode코드로 구현 ⭐️
        do {
            let decoder = JSONDecoder()
            let musicArray = try decoder.decode(MusicData.self, from: safeData)
            dump(musicArray)
        } catch {
            
        }
        


    }.resume()     // 시작
}


getMethod()



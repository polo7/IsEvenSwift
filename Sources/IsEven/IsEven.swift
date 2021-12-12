import Foundation
public struct IsEven {
  //    public private(set) var text = "Hello, World!"
  
  private init() {
  }
  
  private static func parseJSON(_ data: Data) -> Bool? {
    let decoder = JSONDecoder()
    if let decodedData = try? decoder.decode(IsEvenData.self, from: data) {
      return decodedData.iseven
    } else {
      return nil
    }
  }
  
  static func isEven(_ number: Int) -> Bool? {
    let baseURL = "https://api.isevenapi.xyz/api/"
    let urlString = "\(baseURL)/\(number)/"
    
    if let url = URL(string: urlString) {
      if let data = try? Data(contentsOf: url) {
        if let isEvenValue = parseJSON(data) {
          return isEvenValue
        } else {
          return nil
        }
      } else {
        return nil
      }
    } else {
      return nil
    }
  }
}

import Foundation

public struct IsEven {
  private init() {
  }
  
  private static func parseJSON(_ data: Data) -> Bool? {
    let decoder = JSONDecoder()
    guard let decodedData = try? decoder.decode(IsEvenData.self, from: data) else { return nil }
    
    return decodedData.iseven
  }
  
  /// Checks whether the given number is even or not using IsEven API
  /// Due to limitations of the API it works with numbers from 0 <= N <= 999 999 only.
  /// - Parameter number: integer number
  /// - Returns: True if the number is even, False otherwise.
  public static func isEven(_ number: Int) -> Bool? {
    let urlString = "https://api.isevenapi.xyz/api/iseven/\(number)/"
    guard let url = URL(string: urlString) else { return nil }
    guard let data = try? Data(contentsOf: url) else { return nil }
    guard let isEvenValue = parseJSON(data) else { return nil }
    
    return isEvenValue
  }
}

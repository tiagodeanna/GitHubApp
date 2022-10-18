import Foundation

extension Data {
    var prettyPrintedJSONString: NSString? {
        guard
            let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(
                withJSONObject: object,
                options: [.withoutEscapingSlashes, .prettyPrinted]
            ),
            let prettyPrintedString = NSString(
                data: data,
                encoding: String.Encoding.utf8.rawValue
            )
        else { return nil }
        return prettyPrintedString
    }
    
    func parse<Model: Decodable>(completion: @escaping (Result<Model, APIError>) -> Void) {
        do {
            let jsonDecoded = try JSONDecoder().decode(Model.self, from: self)
            completion(.success(jsonDecoded))
            print(prettyPrintedJSONString ?? "")
        } catch {
            print("========= Begin error to decode =========")
            print(error)
            print("========= End error to decode =========")
            completion(.failure(.errorDecode))
        }
    }
}

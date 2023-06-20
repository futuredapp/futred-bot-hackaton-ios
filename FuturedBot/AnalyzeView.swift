//
//  AnalyzeView.swift
//  FuturedBot
//
//  Created by Patrik Potocek on 20.06.2023.
//

import Foundation
import SwiftUI

// View that containts TextField input
struct AnalyzeView: View {

    @State var inputText: String = ""
    @State var response: String = ""
    @State var searchedGif: GIPHYClip? = nil
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter text to analyze", text: $inputText)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button("Analyze") {
                    print("analyze")
                    analyze(text: inputText)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.horizontal)
                
                Text(response)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button("Test Networking") {
                    Task {
                        //                    let users = try await loadActiveUsers()
                        //                    print("Users", users)
                        loadGIF(for: "cheesburger")
                        
                    }
                }
                if let searchedGif = searchedGif {
                    WebView(url: URL(urlString: searchedGif.embed_url))
                        .frame(width: 300, height: 200)
                } else {
                    Text("LOADUJU PIICO!")
                }
            }
        }
    }
    
    func loadActiveUsers() async throws -> [UserCompact] {
        let baseUrl = URL(urlString: "https://coin.futured.dev/graphql")
        let keychainService = ProductionKeychainService()
        keychainService.credentials = Credentials(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJhZGVrLmRvbGV6YWxAZnV0dXJlZC5hcHAiLCJzdWIiOiI2M2Y5MjE1ZDk0ODI5NDI3NmUzYzYzNmIiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNjg3MjYxODM5LCJleHAiOjE2ODcyNjU0Mzl9.Ri_WKaKOtPobTWWY1B89aPzRaG6NCj1b438IEIiw3o4", refreshToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJhZGVrLmRvbGV6YWxAZnV0dXJlZC5hcHAiLCJzdWIiOiI2M2Y5MjE1ZDk0ODI5NDI3NmUzYzYzNmIiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY4NzI2MTgzOSwiZXhwIjoxNjg3MzQ4MjM5fQ.gkb_1x640AuRH8XxNQ-hEpYU1T2EsahGVgf5-QgimZU")
        let networkingService = ProductionNetworkingService(baseUrl: baseUrl, keychainService: keychainService)
        let data = try await networkingService.fetch(query: CompactUserListQuery(filter: UserSelectOptionsFilterInput(onlyActive: true)), cachePolicy: .returnCacheDataAndFetch, queue: .main)
        return data.userSelectOptions.compactMap {
            UserCompact(data: $0)
        }
    }
    
    func loadGIF(for term: String) {
        let url = URL(string: "https://api.giphy.com/v1/gifs/search")!
        let params: URLQuery = [
            "api_key": "Di5swh6HM4cr9DRQCnAzYeabXvamqMpe",
            "q": term
        ]
        let request = URLRequest(url: url.appendingQuery(params))
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("ERROR: Nejsou data")
                return
            }
            print("DATA PICO: \(String(data: data, encoding: .utf8) ?? "Mrdka")")
            print("RESPONSE: \(response)")
            print("ERROR: \(error)")
            
            let decoder = JSONDecoder()
            do {
                let parsedData = try decoder.decode(GIPHYResponse.self, from: data)
                print("NAPARSOVAL JSEM:", parsedData)
                searchedGif = parsedData.data.first
            } catch {
                print("ERROR PICO: ", error)
            }
        }
        task.resume()
    }
    
    func analyze(text: String) {
//        openAI.chats(query: ChatQuery(
//            model: .gpt4_0613,
//            messages: [Chat(role: .user, content: prompt)],
//            functions: functions
//        )) { result in
//            switch result {
//            case .success(let response):
//                process(choises: response.choices)
//            case .failure(let error):
//                self.response = error.localizedDescription
//            }
//        }
    }
    
    
}

import SwiftUI
import WebKit
 
struct WebView: UIViewRepresentable {
 
    var url: URL
 
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
 
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}


struct GIPHYResponse: Codable {
    let data: [GIPHYClip]
}

struct GIPHYClip: Codable {
    let id: String
    let url: String
    let bitly_url: String
    let embed_url: String
}

extension URL {
    mutating func appendQuery(_ query: URLQuery) {
        self = appendingQuery(query)
    }

    func appendingQuery(_ query: URLQuery) -> URL {
        guard let query = query.percentEncoded else {
            return self
        }
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        let queries = [
            components?.percentEncodedQuery,
            query
        ]
        components?.percentEncodedQuery = queries.compactMap { $0 }.joined(separator: "&")
        return components?.url ?? self
    }
}

public struct URLQuery: ExpressibleByDictionaryLiteral {
    /// Array of URL query items.
    public let items: [URLQueryItem]

    init() {
        self.items = []
    }

    /// Creates a structure representing URL query using array of unencoded URL query items.
    /// - Parameter items: Array of unencoded URL query items.
    public init(items: [URLQueryItem]) {
        self.items = items
    }

    /// Dictionary literals may not be unique, same keys are allowed and can't be overridden.
    public init(dictionaryLiteral elements: (String, String)...) {
        self.init(items: elements.map(URLQueryItem.init))
    }

    /// Returns the query item, which is percent encoded version of provided item. If an item is already percent
    /// encoded, it **will** be encoded again.
    private func encode(item: URLQueryItem) -> URLQueryItem {
        let encodedName = item.name.addingPercentEncoding(withAllowedCharacters: .urlQueryNameValueAllowed) ?? item.name
        let encodedValue = item.value?.addingPercentEncoding(withAllowedCharacters: .urlQueryNameValueAllowed)
        return URLQueryItem(name: encodedName, value: encodedValue)
    }

    /// String of all query items, encoded by percent encoding and divided by `&` delimiter.
    public var percentEncoded: String? {
        guard !items.isEmpty else {
            return nil
        }
        return items.lazy
            .map(encode)
            .map { item in "\(item.name)=\(item.value ?? String())" }
            .joined(separator: "&")
    }
}

extension CharacterSet {
    private static let urlGeneralDelimiters: CharacterSet = [":", "/", "?", "#", "[", "]", "@"]
    private static let urlSubDelimiters: CharacterSet = ["!", "$", "&", "'", "(", ")", "*", "+", ",", ";", "="]
    private static let urlDelimiters = CharacterSet.urlGeneralDelimiters.union(.urlSubDelimiters)

    /// All characters allowed in URL query name or value.
    ///
    /// > Note: The list of characters is derived from
    /// > [RFC-3986 Section 2.2](https://tools.ietf.org/html/rfc3986#section-2.2).
    static let urlQueryNameValueAllowed = CharacterSet.urlQueryAllowed.subtracting(.urlDelimiters)
}

struct UserCompact {
    let id: String
    let fullname: String
}

extension UserCompact {
    init(data: CompactUserListQuery.Data.UserSelectOption) {
        id = data.value
        fullname = data.label
    }
}



// preview
struct AnalyzeView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyzeView()
    }
}



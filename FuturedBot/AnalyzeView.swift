//
//  AnalyzeView.swift
//  FuturedBot
//
//  Created by Patrik Potocek on 20.06.2023.
//

import Foundation
import SwiftUI
import OpenAI

struct Tag: Identifiable {
    let value: String
    
    var id: String {
        value
    }
}

class AnalyzeObject: ObservableObject {
    let openAI = OpenAI(apiToken: "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")

    @Published var searchedGif: GIPHYClip? = nil
    @Published var searchedTags: [Tag] = []

    func tagsPrompt(with message: String) -> [Chat] {
        [Chat(role: .user, content: "Toto je ocenění ze systému Futured Coin na oceňování mezi kolegy. Identifikuj jednu až tři kategorii, do které lze toto ocenění přiřadit (např. týmová práce, psychická podpora, spokojené bříško). Kategorie vrať jako jeden řetězec ve kterém budou jednotlivé kategorie oddělené znakem \",\" Text ocenění: \(message)")]
    }
    
    func giphyPrompt(with message: String) -> [Chat] {
        [Chat(role: .user, content: "Jsi bot, který extrahuje informace ze zpráv. Extrahuj mi z následující zprávy stručný řetězec v angličtině bez konkrétních jmen o maximálně třech slovech, vhodný pro pojmenování vtipného GIFu: \(message).")]
    }
    
    func analyze(prompt: String) {
        analyzeTags(prompt: tagsPrompt(with: prompt))
        analyzeGiphy(prompt: giphyPrompt(with: prompt))
    }

    func analyzeTags(prompt: [Chat]) {
        openAI.chats(query: ChatQuery(
            model: .gpt4_0613,
            messages: prompt
        )) { result in
            switch result {
            case .success(let response):
                self.processTagsChoises(response.choices)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func processTagsChoises(_ choises: [ChatResult.Choice]) {
        let choice = choises.first!
        print("CHOISES: \(choises)")
        if choice.finishReason == "stop" {
            DispatchQueue.main.async {
                print("CHOISES RESULT: \(choice.message.content)")
                let tags = choice.message.content?.split(separator: ", ")
                print(tags, tags?.compactMap { Tag(value: String($0)) } ?? [])
                self.searchedTags = tags?.compactMap { Tag(value: String($0)) } ?? []
            }
        }
    }

    func analyzeGiphy(prompt: [Chat]) {
        openAI.chats(query: ChatQuery(
            model: .gpt4_0613,
            messages: prompt
        )) { result in
            switch result {
            case .success(let response):
                self.processGiphyChoises(response.choices)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func processGiphyChoises(_ choises: [ChatResult.Choice]) {
        let choice = choises.first!
        print("CHOISES: \(choises)")
        if choice.finishReason == "stop" {
            print("CHOISES GIPHY RESULT: \(choice.message.content)")
            loadGIF(for: choice.message.content ?? "Random gif")
        }
    }
    
    func loadGIF(for term: String) {
        print("GIF TERM: \(term)")
        let url = URL(string: "https://api.giphy.com/v1/gifs/search")!
        let params: URLQuery = [
            "api_key": "Di5swh6HM4cr9DRQCnAzYeabXvamqMpe",
            "q": term
        ]
        let request = URLRequest(url: url.appendingQuery(params))
        print(request)
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
                DispatchQueue.main.async {
                    self.searchedGif = parsedData.data.first
                }
            } catch {
                print("ERROR PICO: ", error)
            }
        }
        task.resume()
    }
}


// View that containts TextField input
struct AnalyzeView: View {
    @StateObject var object: AnalyzeObject = AnalyzeObject()
    
    @State var inputText: String = "Za to, že se stará tak hezky o mojí mámu."
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    TextField("Input", text: $inputText)
                        .padding()

                    Button("Analyze") {
                        object.analyze(prompt: inputText)
                    }
                    .padding()
                }
                .padding(5)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                
                if !object.searchedTags.isEmpty {
                    VStack(alignment: .center, spacing: 4) {
                        ForEach(object.searchedTags) { tag in
                            Text(tag.value)
                                .padding(.horizontal, 10)
                                .frame(height: 30)
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                
                if let gifUrl = object.searchedGif?.embed_url {
                    WebView(url: URL(urlString: gifUrl))
                        .frame(width: 300, height: 200)
                }
            }
            .padding(.horizontal, 16)
        }
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


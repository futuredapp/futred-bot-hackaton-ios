//
//  ContentView.swift
//  FuturedBot
//
//  Created by Patrik Potocek on 20.06.2023.
//

import SwiftUI
import OpenAI

// codable struct with name string atribute
struct UserRequest: Codable {
    let name: String
}

// codable struct with amount userId and reason
struct GiveCoinsRequest: Codable {
    let amount: Int
    let userId: String
    let reason: String
}



class ChatObject: ObservableObject {
    let networkingService: ProductionNetworkingService

    var messages: [Chat] = []

    @Published var response: String = ""

    var timer: Timer?

    let openAI = OpenAI(apiToken: "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")
    var users: [UserCompact] = []

    init() {
        let service = ProductionKeychainService()
        service.credentials = Credentials(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJhZGVrLmRvbGV6YWxAZnV0dXJlZC5hcHAiLCJzdWIiOiI2M2Y5MjE1ZDk0ODI5NDI3NmUzYzYzNmIiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNjg3MjYxODM5LCJleHAiOjE2ODcyNjU0Mzl9.Ri_WKaKOtPobTWWY1B89aPzRaG6NCj1b438IEIiw3o4", refreshToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InJhZGVrLmRvbGV6YWxAZnV0dXJlZC5hcHAiLCJzdWIiOiI2M2Y5MjE1ZDk0ODI5NDI3NmUzYzYzNmIiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY4NzI2MTgzOSwiZXhwIjoxNjg3MzQ4MjM5fQ.gkb_1x640AuRH8XxNQ-hEpYU1T2EsahGVgf5-QgimZU")

        self.networkingService = ProductionNetworkingService(baseUrl: URL(urlString: "https://coin.futured.dev/graphql"), keychainService: service)
    }


    var configMessages: [Chat] {
        [
            Chat(role: .system, content: "You are FUCoin bot. You will receive text from which you should parse the following properties: names, number of points (which are called FUCoin, FUCoins, fukoins, fuckoins, coins or somehow similar or doesn't have to be mentioned directly) and a reason why the persons are receiving these coins. All of the properties are mandatory. If some property is missing return error: {\"error_message\": \"[missing properties]\"}"),
        ]
    }

    var functions: [ChatFunctionDeclaration] {
        [
            .init(
                name: "giveCoins",
                description: "Gives an amount of coins to a specific user for a specific reason",
                parameters: .init(type: .object, properties: [
                    "amount": .init(type: .number, description: "Amount of coins to give"),
                    "userId": .init(type: .string, description: "ID of the user to give coins to"),
                    "reason": .init(type: .string, description: "Reason of the transation")
                ])
            ),
            .init(
                name: "getPersonId",
                description: "Returns the ID of a person for specific user",
                parameters: .init(type: .object, properties: [
                    "name": .init(type: .string, description: "User name")
                ])
            ),
            .init(name: "getPersonBudget",
                  description: "Returns the account balance for a specific user",
                  parameters: .init(type: .object, properties: [
                    "name": .init(type: .string, description: "User name")
                ]))
        ]
    }

    func send(prompt: String) {
        // Timer that changes response variable every 2 seconds from array of emojis
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            let emojis = ["🤔", "😐", "🤨", "😕", "😑", "😶", "🙄", "😏", "😒", "🤐", "😬", "🤥", "🤫", "🤭", "🧐", "🤓", "😈", "👿", "👹", "👺", "💀", "👻", "👽", "🤖", "💩", "😺", "😸", "😹", "😻", "😼", "😽", "🙀", "😿", "😾"]
            let randomIndex = Int.random(in: 0..<emojis.count)
            self.response = emojis[randomIndex]
        }

        messages = [Chat(role: .user, content: prompt)]
        sendMessages()
    }

    func sendMessages() {
        openAI.chats(query: ChatQuery(
            model: .gpt4_0613,
            messages: messages,
            functions: functions
        )) { result in
            switch result {
            case .success(let response):
                self.process(choises: response.choices)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func process(choises: [ChatResult.Choice]) {
        let choice = choises.first!

        if let functionCall = choice.message.functionCall {
            switch functionCall.name! {
            case "getPersonId":
                let userRequest = try! JSONDecoder().decode(UserRequest.self, from: functionCall.arguments!.data(using: .utf8)!)
                Task {
                    let userId = await self.personId(for: userRequest.name)
                    self.messages += [Chat(role: .function, content: userId, name: functionCall.name)]
                    sendMessages()
                }
            case "giveCoins":
                let giveCoinsRequest = try! JSONDecoder().decode(GiveCoinsRequest.self, from: functionCall.arguments!.data(using: .utf8)!)
                Task {
                    do {
                        try await giveKudos(amount: giveCoinsRequest.amount, message: giveCoinsRequest.reason, id: giveCoinsRequest.userId)
                        self.messages += [Chat(role: .function, content: "Hotovo. Neposielaj JSON, vráť mi len success správu.", name: functionCall.name)]
                        sendMessages()
                    } catch {
                        print(error)
                    }
                }
            case "getPersonBudget":
                Task {
                    do {
                        let budget = await try self.getUserBaget()
                        self.messages += [Chat(role: .function, content: "\(budget)", name: functionCall.name)]
                        sendMessages()
                    } catch {
                        print(error)
                    }

                }
            default:
                print("unimplemented function \(choice.message.functionCall)")
            }
        }

        if choice.finishReason == "stop" {
            DispatchQueue.main.async {
                self.response = choice.message.content ?? ""
                self.timer?.invalidate()
                self.timer = nil
            }
        }
    }

    func personId(for name: String) async -> String? {
        users.first { $0.fullname.contains(name) }?.id

    }

    func loadUsers() {
        Task {
            let data = try await networkingService.fetch(query: CompactUserListQuery(filter: UserSelectOptionsFilterInput(onlyActive: true)), cachePolicy: .returnCacheDataAndFetch, queue: .main)
            self.users = data.userSelectOptions.compactMap {
                UserCompact(data: $0)
            }
        }
    }

    func giveKudos(amount: Int, message: String, id: String) async throws {
        _ = try await networkingService.perform(mutation: GiveKudosMutation(input: GiveKudosInput(amount: amount, message: message, to: id)), publishResultToStore: false, queue: .main)
    }

    func getUserBaget() async throws -> Int {
        let data = try await networkingService.fetch(query: LoggedUserQuery(), cachePolicy: .returnCacheDataAndFetch, queue: .main)
        return data.me.balance
    }
}


struct ChatView: View {
    @StateObject var chat: ChatObject = ChatObject()

    @State var prompt: String = "Kolko mám coinov?"

    var body: some View {
        VStack {
            HStack {
                TextField("Input", text: $prompt)
                    .padding()

                Button("Send") {
                    chat.send(prompt: prompt)
                }
                .padding()
            }
            .padding(5)
            .background(Color.gray.opacity(0.3))
            .cornerRadius(15)

            Spacer()

            Text(chat.response)
                .font(.title)
                .bold()

            Spacer()

        }
        .padding(.horizontal, 16)
        .task {
            chat.loadUsers()
        }
    }


}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}

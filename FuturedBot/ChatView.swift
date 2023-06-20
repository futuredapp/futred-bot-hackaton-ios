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

    var messages: [Chat] = []

    func send(prompt: String) {
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
                    } catch {
                        print(error)
                    }
                }
            default:
                print("unimplemented function \(choice.message.functionCall)")
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
}





struct ChatView: View {
    @StateObject var chat: ChatObject = ChatObject()

    @State var prompt: String = "Daj Radek 1 coinov."
    @State var response: String = ""

    var body: some View {
        VStack {
            // texField input
            TextField("Input", text: $prompt)
                .padding()

            Button("Send") {
                chat.send(prompt: prompt)
            }

            Text(response)
        }
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

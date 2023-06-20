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

    var body: some View {
        VStack {
            TextField("Enter text to analyze", text: $inputText)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)

            Button("Analyze") {
                print("analyze")
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
                    let users = try await loadActiveUsers()
                    print("Users", users)
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



// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct GiveKudosInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount
  ///   - message
  ///   - to
  public init(amount: Int, message: String, to: GraphQLID) {
    graphQLMap = ["amount": amount, "message": message, "to": to]
  }

  public var amount: Int {
    get {
      return graphQLMap["amount"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var message: String {
    get {
      return graphQLMap["message"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "message")
    }
  }

  public var to: GraphQLID {
    get {
      return graphQLMap["to"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "to")
    }
  }
}

public struct PaginationInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - pageNumber
  ///   - pageSize
  public init(pageNumber: Int, pageSize: Int) {
    graphQLMap = ["pageNumber": pageNumber, "pageSize": pageSize]
  }

  public var pageNumber: Int {
    get {
      return graphQLMap["pageNumber"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pageNumber")
    }
  }

  public var pageSize: Int {
    get {
      return graphQLMap["pageSize"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pageSize")
    }
  }
}

public enum Position: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case employee
  case lead
  case pm
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "EMPLOYEE": self = .employee
      case "LEAD": self = .lead
      case "PM": self = .pm
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .employee: return "EMPLOYEE"
      case .lead: return "LEAD"
      case .pm: return "PM"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Position, rhs: Position) -> Bool {
    switch (lhs, rhs) {
      case (.employee, .employee): return true
      case (.lead, .lead): return true
      case (.pm, .pm): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Position] {
    return [
      .employee,
      .lead,
      .pm,
    ]
  }
}

public enum Role: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case admin
  case operations
  case user
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ADMIN": self = .admin
      case "OPERATIONS": self = .operations
      case "USER": self = .user
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .admin: return "ADMIN"
      case .operations: return "OPERATIONS"
      case .user: return "USER"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Role, rhs: Role) -> Bool {
    switch (lhs, rhs) {
      case (.admin, .admin): return true
      case (.operations, .operations): return true
      case (.user, .user): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Role] {
    return [
      .admin,
      .operations,
      .user,
    ]
  }
}

public enum TransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case bankIncome
  case bankPurchase
  case kudos
  case reward
  case userPurchase
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BANK_INCOME": self = .bankIncome
      case "BANK_PURCHASE": self = .bankPurchase
      case "KUDOS": self = .kudos
      case "REWARD": self = .reward
      case "USER_PURCHASE": self = .userPurchase
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .bankIncome: return "BANK_INCOME"
      case .bankPurchase: return "BANK_PURCHASE"
      case .kudos: return "KUDOS"
      case .reward: return "REWARD"
      case .userPurchase: return "USER_PURCHASE"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransactionType, rhs: TransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.bankIncome, .bankIncome): return true
      case (.bankPurchase, .bankPurchase): return true
      case (.kudos, .kudos): return true
      case (.reward, .reward): return true
      case (.userPurchase, .userPurchase): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TransactionType] {
    return [
      .bankIncome,
      .bankPurchase,
      .kudos,
      .reward,
      .userPurchase,
    ]
  }
}

public struct UserSelectOptionsFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - onlyActive
  public init(onlyActive: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["onlyActive": onlyActive]
  }

  public var onlyActive: Swift.Optional<Bool?> {
    get {
      return graphQLMap["onlyActive"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "onlyActive")
    }
  }
}

public struct LeaderboardFilterInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - includeRewards
  ///   - type
  public init(includeRewards: Swift.Optional<Bool?> = nil, type: Swift.Optional<LeaderboardType?> = nil) {
    graphQLMap = ["includeRewards": includeRewards, "type": type]
  }

  public var includeRewards: Swift.Optional<Bool?> {
    get {
      return graphQLMap["includeRewards"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "includeRewards")
    }
  }

  public var type: Swift.Optional<LeaderboardType?> {
    get {
      return graphQLMap["type"] as? Swift.Optional<LeaderboardType?> ?? Swift.Optional<LeaderboardType?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "type")
    }
  }
}

public enum LeaderboardType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case allTime
  case month
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "ALL_TIME": self = .allTime
      case "MONTH": self = .month
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .allTime: return "ALL_TIME"
      case .month: return "MONTH"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: LeaderboardType, rhs: LeaderboardType) -> Bool {
    switch (lhs, rhs) {
      case (.allTime, .allTime): return true
      case (.month, .month): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [LeaderboardType] {
    return [
      .allTime,
      .month,
    ]
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($jwt: JWT!) {
      loginWithGoogle(jwt: $jwt) {
        __typename
        accessToken
        refreshToken
      }
    }
    """

  public let operationName: String = "Login"

  public var jwt: String

  public init(jwt: String) {
    self.jwt = jwt
  }

  public var variables: GraphQLMap? {
    return ["jwt": jwt]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("loginWithGoogle", arguments: ["jwt": GraphQLVariable("jwt")], type: .nonNull(.object(LoginWithGoogle.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(loginWithGoogle: LoginWithGoogle) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "loginWithGoogle": loginWithGoogle.resultMap])
    }

    public var loginWithGoogle: LoginWithGoogle {
      get {
        return LoginWithGoogle(unsafeResultMap: resultMap["loginWithGoogle"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "loginWithGoogle")
      }
    }

    public struct LoginWithGoogle: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
          GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String, refreshToken: String) {
        self.init(unsafeResultMap: ["__typename": "AuthResponse", "accessToken": accessToken, "refreshToken": refreshToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }

      public var refreshToken: String {
        get {
          return resultMap["refreshToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "refreshToken")
        }
      }
    }
  }
}

public final class RefreshTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RefreshToken($refreshToken: JWT!) {
      refreshToken(refreshToken: $refreshToken) {
        __typename
        accessToken
      }
    }
    """

  public let operationName: String = "RefreshToken"

  public var refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }

  public var variables: GraphQLMap? {
    return ["refreshToken": refreshToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("refreshToken", arguments: ["refreshToken": GraphQLVariable("refreshToken")], type: .nonNull(.object(RefreshToken.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(refreshToken: RefreshToken) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "refreshToken": refreshToken.resultMap])
    }

    public var refreshToken: RefreshToken {
      get {
        return RefreshToken(unsafeResultMap: resultMap["refreshToken"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "refreshToken")
      }
    }

    public struct RefreshToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RefreshTokenResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String) {
        self.init(unsafeResultMap: ["__typename": "RefreshTokenResponse", "accessToken": accessToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }
    }
  }
}

public final class GiveKudosMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation GiveKudos($input: GiveKudosInput!) {
      giveKudos(input: $input) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "GiveKudos"

  public var input: GiveKudosInput

  public init(input: GiveKudosInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("giveKudos", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(GiveKudo.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(giveKudos: GiveKudo) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "giveKudos": giveKudos.resultMap])
    }

    public var giveKudos: GiveKudo {
      get {
        return GiveKudo(unsafeResultMap: resultMap["giveKudos"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "giveKudos")
      }
    }

    public struct GiveKudo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Kudos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Kudos", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class HomeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Home($pagination: PaginationInput!) {
      me {
        __typename
        avatar
        balance
        budget
        email
        firstname
        fullname
        id
        position
        lastname
        role
        totalReceived
        receivedThisMonth
      }
      latestTransactions(pagination: $pagination) {
        __typename
        edges {
          __typename
          ... on Kudos {
            __typename
            amount
            createdAt
            from {
              __typename
              avatar
              fullname
              id
            }
            id
            message
            to {
              __typename
              avatar
              fullname
              id
            }
            type
          }
          ... on Reward {
            __typename
            amount
            createdAt
            id
            message
            to {
              __typename
              avatar
              fullname
              id
            }
            type
          }
        }
      }
    }
    """

  public let operationName: String = "Home"

  public var pagination: PaginationInput

  public init(pagination: PaginationInput) {
    self.pagination = pagination
  }

  public var variables: GraphQLMap? {
    return ["pagination": pagination]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .nonNull(.object(Me.selections))),
        GraphQLField("latestTransactions", arguments: ["pagination": GraphQLVariable("pagination")], type: .nonNull(.object(LatestTransaction.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me, latestTransactions: LatestTransaction) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.resultMap, "latestTransactions": latestTransactions.resultMap])
    }

    public var me: Me {
      get {
        return Me(unsafeResultMap: resultMap["me"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "me")
      }
    }

    public var latestTransactions: LatestTransaction {
      get {
        return LatestTransaction(unsafeResultMap: resultMap["latestTransactions"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "latestTransactions")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("balance", type: .nonNull(.scalar(Int.self))),
          GraphQLField("budget", type: .nonNull(.scalar(Int.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstname", type: .nonNull(.scalar(String.self))),
          GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("position", type: .nonNull(.scalar(Position.self))),
          GraphQLField("lastname", type: .nonNull(.scalar(String.self))),
          GraphQLField("role", type: .nonNull(.scalar(Role.self))),
          GraphQLField("totalReceived", type: .nonNull(.scalar(Int.self))),
          GraphQLField("receivedThisMonth", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(avatar: String? = nil, balance: Int, budget: Int, email: String, firstname: String, fullname: String, id: GraphQLID, position: Position, lastname: String, role: Role, totalReceived: Int, receivedThisMonth: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "balance": balance, "budget": budget, "email": email, "firstname": firstname, "fullname": fullname, "id": id, "position": position, "lastname": lastname, "role": role, "totalReceived": totalReceived, "receivedThisMonth": receivedThisMonth])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var avatar: String? {
        get {
          return resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var balance: Int {
        get {
          return resultMap["balance"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance")
        }
      }

      public var budget: Int {
        get {
          return resultMap["budget"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "budget")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var firstname: String {
        get {
          return resultMap["firstname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstname")
        }
      }

      public var fullname: String {
        get {
          return resultMap["fullname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fullname")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var position: Position {
        get {
          return resultMap["position"]! as! Position
        }
        set {
          resultMap.updateValue(newValue, forKey: "position")
        }
      }

      public var lastname: String {
        get {
          return resultMap["lastname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastname")
        }
      }

      public var role: Role {
        get {
          return resultMap["role"]! as! Role
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var totalReceived: Int {
        get {
          return resultMap["totalReceived"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalReceived")
        }
      }

      public var receivedThisMonth: Int {
        get {
          return resultMap["receivedThisMonth"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "receivedThisMonth")
        }
      }
    }

    public struct LatestTransaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TransactionPage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "TransactionPage", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["BankIncome", "BankPurchase", "Kudos", "Reward", "UserPurchase"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["Kudos": AsKudos.selections, "Reward": AsReward.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeBankIncome() -> Edge {
          return Edge(unsafeResultMap: ["__typename": "BankIncome"])
        }

        public static func makeBankPurchase() -> Edge {
          return Edge(unsafeResultMap: ["__typename": "BankPurchase"])
        }

        public static func makeUserPurchase() -> Edge {
          return Edge(unsafeResultMap: ["__typename": "UserPurchase"])
        }

        public static func makeKudos(amount: Int, createdAt: String, from: AsKudos.From, id: GraphQLID, message: String, to: AsKudos.To, type: TransactionType) -> Edge {
          return Edge(unsafeResultMap: ["__typename": "Kudos", "amount": amount, "createdAt": createdAt, "from": from.resultMap, "id": id, "message": message, "to": to.resultMap, "type": type])
        }

        public static func makeReward(amount: Int, createdAt: String, id: GraphQLID, message: String, to: AsReward.To, type: TransactionType) -> Edge {
          return Edge(unsafeResultMap: ["__typename": "Reward", "amount": amount, "createdAt": createdAt, "id": id, "message": message, "to": to.resultMap, "type": type])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asKudos: AsKudos? {
          get {
            if !AsKudos.possibleTypes.contains(__typename) { return nil }
            return AsKudos(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsKudos: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Kudos"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("from", type: .nonNull(.object(From.selections))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("message", type: .nonNull(.scalar(String.self))),
              GraphQLField("to", type: .nonNull(.object(To.selections))),
              GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Int, createdAt: String, from: From, id: GraphQLID, message: String, to: To, type: TransactionType) {
            self.init(unsafeResultMap: ["__typename": "Kudos", "amount": amount, "createdAt": createdAt, "from": from.resultMap, "id": id, "message": message, "to": to.resultMap, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var amount: Int {
            get {
              return resultMap["amount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var from: From {
            get {
              return From(unsafeResultMap: resultMap["from"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "from")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var message: String {
            get {
              return resultMap["message"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }

          public var to: To {
            get {
              return To(unsafeResultMap: resultMap["to"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "to")
            }
          }

          public var type: TransactionType {
            get {
              return resultMap["type"]! as! TransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct From: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }

          public struct To: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }
        }

        public var asReward: AsReward? {
          get {
            if !AsReward.possibleTypes.contains(__typename) { return nil }
            return AsReward(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsReward: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Reward"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("message", type: .nonNull(.scalar(String.self))),
              GraphQLField("to", type: .nonNull(.object(To.selections))),
              GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Int, createdAt: String, id: GraphQLID, message: String, to: To, type: TransactionType) {
            self.init(unsafeResultMap: ["__typename": "Reward", "amount": amount, "createdAt": createdAt, "id": id, "message": message, "to": to.resultMap, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var amount: Int {
            get {
              return resultMap["amount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var message: String {
            get {
              return resultMap["message"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }

          public var to: To {
            get {
              return To(unsafeResultMap: resultMap["to"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "to")
            }
          }

          public var type: TransactionType {
            get {
              return resultMap["type"]! as! TransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct To: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }
        }
      }
    }
  }
}

public final class LoggedUserQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query LoggedUser {
      me {
        __typename
        avatar
        balance
        budget
        email
        firstname
        fullname
        id
        lastname
        position
        receivedThisMonth
        role
        slackNotificationsEnabled
        totalReceived
      }
    }
    """

  public let operationName: String = "LoggedUser"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .nonNull(.object(Me.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.resultMap])
    }

    public var me: Me {
      get {
        return Me(unsafeResultMap: resultMap["me"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("balance", type: .nonNull(.scalar(Int.self))),
          GraphQLField("budget", type: .nonNull(.scalar(Int.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstname", type: .nonNull(.scalar(String.self))),
          GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("lastname", type: .nonNull(.scalar(String.self))),
          GraphQLField("position", type: .nonNull(.scalar(Position.self))),
          GraphQLField("receivedThisMonth", type: .nonNull(.scalar(Int.self))),
          GraphQLField("role", type: .nonNull(.scalar(Role.self))),
          GraphQLField("slackNotificationsEnabled", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("totalReceived", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(avatar: String? = nil, balance: Int, budget: Int, email: String, firstname: String, fullname: String, id: GraphQLID, lastname: String, position: Position, receivedThisMonth: Int, role: Role, slackNotificationsEnabled: Bool, totalReceived: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "balance": balance, "budget": budget, "email": email, "firstname": firstname, "fullname": fullname, "id": id, "lastname": lastname, "position": position, "receivedThisMonth": receivedThisMonth, "role": role, "slackNotificationsEnabled": slackNotificationsEnabled, "totalReceived": totalReceived])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var avatar: String? {
        get {
          return resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var balance: Int {
        get {
          return resultMap["balance"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance")
        }
      }

      public var budget: Int {
        get {
          return resultMap["budget"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "budget")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var firstname: String {
        get {
          return resultMap["firstname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstname")
        }
      }

      public var fullname: String {
        get {
          return resultMap["fullname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "fullname")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var lastname: String {
        get {
          return resultMap["lastname"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastname")
        }
      }

      public var position: Position {
        get {
          return resultMap["position"]! as! Position
        }
        set {
          resultMap.updateValue(newValue, forKey: "position")
        }
      }

      public var receivedThisMonth: Int {
        get {
          return resultMap["receivedThisMonth"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "receivedThisMonth")
        }
      }

      public var role: Role {
        get {
          return resultMap["role"]! as! Role
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var slackNotificationsEnabled: Bool {
        get {
          return resultMap["slackNotificationsEnabled"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "slackNotificationsEnabled")
        }
      }

      public var totalReceived: Int {
        get {
          return resultMap["totalReceived"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalReceived")
        }
      }
    }
  }
}

public final class CompactUserListQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CompactUserList($filter: UserSelectOptionsFilterInput) {
      userSelectOptions(filter: $filter) {
        __typename
        label
        value
      }
    }
    """

  public let operationName: String = "CompactUserList"

  public var filter: UserSelectOptionsFilterInput?

  public init(filter: UserSelectOptionsFilterInput? = nil) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("userSelectOptions", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(UserSelectOption.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userSelectOptions: [UserSelectOption]) {
      self.init(unsafeResultMap: ["__typename": "Query", "userSelectOptions": userSelectOptions.map { (value: UserSelectOption) -> ResultMap in value.resultMap }])
    }

    public var userSelectOptions: [UserSelectOption] {
      get {
        return (resultMap["userSelectOptions"] as! [ResultMap]).map { (value: ResultMap) -> UserSelectOption in UserSelectOption(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UserSelectOption) -> ResultMap in value.resultMap }, forKey: "userSelectOptions")
      }
    }

    public struct UserSelectOption: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SelectOption"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("label", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(label: String, value: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "SelectOption", "label": label, "value": value])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var label: String {
        get {
          return resultMap["label"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "label")
        }
      }

      public var value: GraphQLID {
        get {
          return resultMap["value"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "value")
        }
      }
    }
  }
}

public final class MyTransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query MyTransactions($pagination: PaginationInput!) {
      myTransactions(pagination: $pagination) {
        __typename
        edges {
          __typename
          ... on Kudos {
            __typename
            amount
            createdAt
            from {
              __typename
              avatar
              fullname
              id
            }
            id
            message
            to {
              __typename
              avatar
              fullname
              id
            }
            type
          }
          ... on Reward {
            __typename
            amount
            createdAt
            id
            message
            proposal {
              __typename
              id
              to {
                __typename
                avatar
                fullname
                id
              }
            }
            to {
              __typename
              avatar
              fullname
              id
            }
            type
          }
          ... on UserPurchase {
            __typename
            amount
            benefit {
              __typename
              id
              price
              title
              description
              image
            }
            createdAt
            from {
              __typename
              avatar
              fullname
              id
            }
            id
            type
          }
        }
      }
    }
    """

  public let operationName: String = "MyTransactions"

  public var pagination: PaginationInput

  public init(pagination: PaginationInput) {
    self.pagination = pagination
  }

  public var variables: GraphQLMap? {
    return ["pagination": pagination]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("myTransactions", arguments: ["pagination": GraphQLVariable("pagination")], type: .nonNull(.object(MyTransaction.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(myTransactions: MyTransaction) {
      self.init(unsafeResultMap: ["__typename": "Query", "myTransactions": myTransactions.resultMap])
    }

    public var myTransactions: MyTransaction {
      get {
        return MyTransaction(unsafeResultMap: resultMap["myTransactions"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "myTransactions")
      }
    }

    public struct MyTransaction: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MyTransactionPage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "MyTransactionPage", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Kudos", "Reward", "UserPurchase"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLTypeCase(
              variants: ["Kudos": AsKudos.selections, "Reward": AsReward.selections, "UserPurchase": AsUserPurchase.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public static func makeKudos(amount: Int, createdAt: String, from: AsKudos.From, id: GraphQLID, message: String, to: AsKudos.To, type: TransactionType) -> Edge {
          return Edge(unsafeResultMap: ["__typename": "Kudos", "amount": amount, "createdAt": createdAt, "from": from.resultMap, "id": id, "message": message, "to": to.resultMap, "type": type])
        }

        public static func makeReward(amount: Int, createdAt: String, id: GraphQLID, message: String, proposal: AsReward.Proposal, to: AsReward.To, type: TransactionType) -> Edge {
          return Edge(unsafeResultMap: ["__typename": "Reward", "amount": amount, "createdAt": createdAt, "id": id, "message": message, "proposal": proposal.resultMap, "to": to.resultMap, "type": type])
        }

        public static func makeUserPurchase(amount: Int, benefit: AsUserPurchase.Benefit, createdAt: String, from: AsUserPurchase.From, id: GraphQLID, type: TransactionType) -> Edge {
          return Edge(unsafeResultMap: ["__typename": "UserPurchase", "amount": amount, "benefit": benefit.resultMap, "createdAt": createdAt, "from": from.resultMap, "id": id, "type": type])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var asKudos: AsKudos? {
          get {
            if !AsKudos.possibleTypes.contains(__typename) { return nil }
            return AsKudos(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsKudos: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Kudos"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("from", type: .nonNull(.object(From.selections))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("message", type: .nonNull(.scalar(String.self))),
              GraphQLField("to", type: .nonNull(.object(To.selections))),
              GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Int, createdAt: String, from: From, id: GraphQLID, message: String, to: To, type: TransactionType) {
            self.init(unsafeResultMap: ["__typename": "Kudos", "amount": amount, "createdAt": createdAt, "from": from.resultMap, "id": id, "message": message, "to": to.resultMap, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var amount: Int {
            get {
              return resultMap["amount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var from: From {
            get {
              return From(unsafeResultMap: resultMap["from"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "from")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var message: String {
            get {
              return resultMap["message"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }

          public var to: To {
            get {
              return To(unsafeResultMap: resultMap["to"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "to")
            }
          }

          public var type: TransactionType {
            get {
              return resultMap["type"]! as! TransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct From: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }

          public struct To: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }
        }

        public var asReward: AsReward? {
          get {
            if !AsReward.possibleTypes.contains(__typename) { return nil }
            return AsReward(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsReward: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Reward"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("message", type: .nonNull(.scalar(String.self))),
              GraphQLField("proposal", type: .nonNull(.object(Proposal.selections))),
              GraphQLField("to", type: .nonNull(.object(To.selections))),
              GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Int, createdAt: String, id: GraphQLID, message: String, proposal: Proposal, to: To, type: TransactionType) {
            self.init(unsafeResultMap: ["__typename": "Reward", "amount": amount, "createdAt": createdAt, "id": id, "message": message, "proposal": proposal.resultMap, "to": to.resultMap, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var amount: Int {
            get {
              return resultMap["amount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var message: String {
            get {
              return resultMap["message"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "message")
            }
          }

          public var proposal: Proposal {
            get {
              return Proposal(unsafeResultMap: resultMap["proposal"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "proposal")
            }
          }

          public var to: To {
            get {
              return To(unsafeResultMap: resultMap["to"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "to")
            }
          }

          public var type: TransactionType {
            get {
              return resultMap["type"]! as! TransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct Proposal: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["RewardProposal"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("to", type: .nonNull(.object(To.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, to: To) {
              self.init(unsafeResultMap: ["__typename": "RewardProposal", "id": id, "to": to.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var to: To {
              get {
                return To(unsafeResultMap: resultMap["to"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "to")
              }
            }

            public struct To: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["User"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("avatar", type: .scalar(String.self)),
                  GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
                self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var avatar: String? {
                get {
                  return resultMap["avatar"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "avatar")
                }
              }

              public var fullname: String {
                get {
                  return resultMap["fullname"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "fullname")
                }
              }

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }
            }
          }

          public struct To: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }
        }

        public var asUserPurchase: AsUserPurchase? {
          get {
            if !AsUserPurchase.possibleTypes.contains(__typename) { return nil }
            return AsUserPurchase(unsafeResultMap: resultMap)
          }
          set {
            guard let newValue = newValue else { return }
            resultMap = newValue.resultMap
          }
        }

        public struct AsUserPurchase: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserPurchase"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
              GraphQLField("benefit", type: .nonNull(.object(Benefit.selections))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("from", type: .nonNull(.object(From.selections))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("type", type: .nonNull(.scalar(TransactionType.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(amount: Int, benefit: Benefit, createdAt: String, from: From, id: GraphQLID, type: TransactionType) {
            self.init(unsafeResultMap: ["__typename": "UserPurchase", "amount": amount, "benefit": benefit.resultMap, "createdAt": createdAt, "from": from.resultMap, "id": id, "type": type])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var amount: Int {
            get {
              return resultMap["amount"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var benefit: Benefit {
            get {
              return Benefit(unsafeResultMap: resultMap["benefit"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "benefit")
            }
          }

          public var createdAt: String {
            get {
              return resultMap["createdAt"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var from: From {
            get {
              return From(unsafeResultMap: resultMap["from"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "from")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var type: TransactionType {
            get {
              return resultMap["type"]! as! TransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public struct Benefit: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Benefit"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("price", type: .nonNull(.scalar(Int.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("description", type: .nonNull(.scalar(String.self))),
                GraphQLField("image", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, price: Int, title: String, description: String, image: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Benefit", "id": id, "price": price, "title": title, "description": description, "image": image])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var price: Int {
              get {
                return resultMap["price"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "price")
              }
            }

            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            public var description: String {
              get {
                return resultMap["description"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "description")
              }
            }

            public var image: String? {
              get {
                return resultMap["image"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "image")
              }
            }
          }

          public struct From: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["User"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .scalar(String.self)),
                GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
              self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var avatar: String? {
              get {
                return resultMap["avatar"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatar")
              }
            }

            public var fullname: String {
              get {
                return resultMap["fullname"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullname")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }
          }
        }
      }
    }
  }
}

public final class LeaderboardQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Leaderboard($filter: LeaderboardFilterInput!) {
      leaderboard(filter: $filter) {
        __typename
        amount
        id
        user {
          __typename
          avatar
          fullname
          id
        }
      }
    }
    """

  public let operationName: String = "Leaderboard"

  public var filter: LeaderboardFilterInput

  public init(filter: LeaderboardFilterInput) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("leaderboard", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.nonNull(.object(Leaderboard.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(leaderboard: [Leaderboard]) {
      self.init(unsafeResultMap: ["__typename": "Query", "leaderboard": leaderboard.map { (value: Leaderboard) -> ResultMap in value.resultMap }])
    }

    public var leaderboard: [Leaderboard] {
      get {
        return (resultMap["leaderboard"] as! [ResultMap]).map { (value: ResultMap) -> Leaderboard in Leaderboard(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Leaderboard) -> ResultMap in value.resultMap }, forKey: "leaderboard")
      }
    }

    public struct Leaderboard: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["LeaderboardUser"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("amount", type: .nonNull(.scalar(Int.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(amount: Int, id: GraphQLID, user: User) {
        self.init(unsafeResultMap: ["__typename": "LeaderboardUser", "amount": amount, "id": id, "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var amount: Int {
        get {
          return resultMap["amount"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "amount")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
            GraphQLField("fullname", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(avatar: String? = nil, fullname: String, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "User", "avatar": avatar, "fullname": fullname, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var avatar: String? {
          get {
            return resultMap["avatar"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }

        public var fullname: String {
          get {
            return resultMap["fullname"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fullname")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

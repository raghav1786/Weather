import Foundation
struct CityList {
    static func all() -> [City] {
        return [City(name: "Mumbai", id: UUID()),
                City(name: "Beijing", id: UUID()),
                City(name: "Pune", id: UUID()),
                City(name: "Amsterdam", id: UUID()),
                City(name: "Bengaluru", id: UUID()),
                City(name: "Barcelona", id: UUID()),
                City(name: "London", id: UUID()),
                City(name: "Cambridge", id: UUID()),
                City(name: "Singapore", id: UUID()),
                City(name: "Dubai", id: UUID()),
                City(name: "Paris", id: UUID()),
                City(name: "Tokyo", id: UUID()),
                City(name: "Bruges", id: UUID()),
                City(name: "Budapest", id: UUID()),
                City(name: "Doha", id: UUID())
        ]
    }
}

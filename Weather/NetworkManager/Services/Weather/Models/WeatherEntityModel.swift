struct WeatherEntityModel: Decodable {
    var name: String?
    var id: Int32?
    var cod: Int32?
    var coord: Coordinates?
    var weather: [WeatherDescModel]?
    var main: WeatherTempratureModel?
}


struct Coordinates: Decodable {
    var lon: Double?
    var lat: Double?
}

struct WeatherDescModel: Decodable {
    var id: Int?
    var main: String?
    var desc: String?
    var icon: String?
    private enum CodingKeys : String, CodingKey {
            case desc = "description",id,main,icon
    }
}

struct WeatherTempratureModel: Decodable {
    var temp: Double?
    var feels_like: Double?
    var temp_min: Double?
    var temp_max: Double?
    var pressure: Int?
    var humidity: Int?
}

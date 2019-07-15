import Foundation

struct Scream {
    let username: String
    let timestamp: String
    let status: String
    
    static func fetchScreams() -> [Scream] {
        let scream1 = Scream(username: "Person 1", timestamp: "2019-05-19", status: "This is a placeholder status")
        let scream2 = Scream(username: "Person 2", timestamp: "2019-06-19", status: "This is another placeholder status")
        let scream3 = Scream(username: "Person 3", timestamp: "2019-07-19", status: "This is the last placeholder status")
        
        return [scream1, scream2, scream3]
    }
}

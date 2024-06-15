import Foundation

enum SampleSection: String, CaseIterable {
    case sample1
    case sample2
    case sample3

    var title: String {
        rawValue
    }
}

import Foundation

struct SampleViewData: Identifiable {
    var id = UUID()
    var title: String
}

struct SampleViewDataProvider {
    static var sample1: [SampleViewData] = (1 ... 3).map {
        .init(title: String(describing: $0))
    }

    static var sample2: [SampleViewData] = (1 ... 5).map {
        .init(title: String(describing: $0 * 2))
    }

    static var sample3: [SampleViewData] = (1 ... 10).map {
        .init(title: String(describing: $0 * 3))
    }

    func viewData(
        section: SampleSection,
        id: SampleViewData.ID
    ) -> SampleViewData? {
        switch section {
        case .sample1:
            Self.sample1.first(where: { $0.id == id })

        case .sample2:
            Self.sample2.first(where: { $0.id == id })

        case .sample3:
            Self.sample3.first(where: { $0.id == id })
        }
    }
}

enum SampleSection: CaseIterable {
    case sample1
    case sample2
    case sample3
}

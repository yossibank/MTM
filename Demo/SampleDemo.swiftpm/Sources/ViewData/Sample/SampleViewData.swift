import Foundation

struct SampleViewData: Identifiable {
    var id = UUID()
    var title: String
}

final class SampleViewDataProvider {
    private(set) var sample1: [SampleViewData] = (1 ... 3).map {
        .init(title: String(describing: $0))
    }

    private(set) var sample2: [SampleViewData] = (1 ... 5).map {
        .init(title: String(describing: $0 * 2))
    }

    private(set) var sample3: [SampleViewData] = (1 ... 10).map {
        .init(title: String(describing: $0 * 3))
    }

    func viewData(
        section: SampleSection,
        id: SampleViewData.ID
    ) -> SampleViewData? {
        switch section {
        case .sample1: sample1.first(where: { $0.id == id })
        case .sample2: sample2.first(where: { $0.id == id })
        case .sample3: sample3.first(where: { $0.id == id })
        }
    }

    func delete(
        section: SampleSection,
        id: SampleViewData.ID
    ) {
        switch section {
        case .sample1: sample1 = sample1.filter { $0.id != id }
        case .sample2: sample2 = sample2.filter { $0.id != id }
        case .sample3: sample3 = sample3.filter { $0.id != id }
        }
    }
}

import Foundation

struct Sample1ViewData: Identifiable {
    var id = UUID()
    var title: String
}

final class Sample1ViewDataProvider {
    private(set) var sample1: [Sample1ViewData] = (1 ... 3).map {
        .init(title: String(describing: $0))
    }

    private(set) var sample2: [Sample1ViewData] = (1 ... 7).map {
        .init(title: String(describing: $0 * 2))
    }

    private(set) var sample3: [Sample1ViewData] = (1 ... 10).map {
        .init(title: String(describing: $0 * 3))
    }

    func viewData(
        section: Sample1Section,
        id: Sample1ViewData.ID
    ) -> Sample1ViewData? {
        switch section {
        case .sample1: sample1.first(where: { $0.id == id })
        case .sample2: sample2.first(where: { $0.id == id })
        case .sample3: sample3.first(where: { $0.id == id })
        }
    }

    func delete(
        section: Sample1Section,
        id: Sample1ViewData.ID
    ) {
        switch section {
        case .sample1: sample1 = sample1.filter { $0.id != id }
        case .sample2: sample2 = sample2.filter { $0.id != id }
        case .sample3: sample3 = sample3.filter { $0.id != id }
        }
    }
}

import SnapKit
import UIKit

// MARK: - properties & init

final class Sample2ViewController: UIViewController {
    private let sampleTextView = SampleTextView()
}

// MARK: - override methods

extension Sample2ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - private methods

private extension Sample2ViewController {
    func setupView() {
        title = "sample2"

        view.addSubview(sampleTextView) {
            $0.center.equalToSuperview()
        }
    }
}

import SnapKit
import UIKit

// MARK: - properties & init

final class Sample3ViewController: UIViewController {}

// MARK: - override methods

extension Sample3ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
}

// MARK: - private methods

private extension Sample3ViewController {
    func setupView() {
        title = "sample3"
    }
}

#if DEBUG
    @available(iOS 17.0, *)
    #Preview {
        Sample3ViewController()
    }
#endif

import SnapKit
import UIKit

// MARK: - properties & init

final class Sample2ViewController: UIViewController {
    private var body: UIView {
        VStackView(alignment: .center, spacing: 16) {
            Sample1View().addConstraint {
                $0.height.equalTo(56)
            }

            Sample2View().addConstraint {
                $0.height.equalTo(56)
            }
        }
    }
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

        view.addSubview(body) {
            $0.center.equalToSuperview()
        }
    }
}

#if DEBUG
    @available(iOS 17.0, *)
    #Preview {
        Sample2ViewController()
    }
#endif

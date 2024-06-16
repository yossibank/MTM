import SnapKit
import UIKit

// MARK: - properties & init

final class Sample2ViewController: UIViewController {
    private var body: UIView {
        VStackView(alignment: .center, spacing: 16) {
            Sample1View().configure {
                $0.backgroundColor = .red
            }

            Sample2View().configure {
                $0.backgroundColor = .blue
            }

            CustomView().addConstraint {
                $0.height.equalTo(200)
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

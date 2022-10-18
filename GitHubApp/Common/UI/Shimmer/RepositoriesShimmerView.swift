import UIKit
import Reusable

final class RepositoriesShimmerView: UIView, NibLoadable {
    
    @IBOutlet private weak var shimmerView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shimmerView.startShimmeringEffect()
    }
}

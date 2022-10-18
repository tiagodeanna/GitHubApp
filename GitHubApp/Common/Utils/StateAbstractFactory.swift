import Foundation
import Reusable

enum StateAbstractFactory {
    static func createErrorView() -> ErrorView {
        let view = ErrorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        view.tag = StateTagConstant.error
        return view
    }
    
    static func createEmptyView() -> EmptyView {
        let view = EmptyView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        view.tag = StateTagConstant.empty
        return view
    }
    
    static func createLoadingView() -> LoadingView {
        let view = LoadingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.alpha = 1
        view.tag = StateTagConstant.loading
        return view
    }
    
    static func createShimmerView() -> RepositoriesShimmerView {
        let view = RepositoriesShimmerView.loadFromNib()
        view.alpha = 1
        view.tag = StateTagConstant.shimmer
        return view
    }
}

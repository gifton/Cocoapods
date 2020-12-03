

import UIKit


class SearchHeader: UICollectionReusableView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        backgroundColor = UIColor.white.withAlphaComponent(0.4)
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var searchBar: UISearchBar?
}


private extension SearchHeader {
    
    
    func setView() {
        
        if searchBar != nil {
            return
        }
        
        searchBar = UISearchBar(frame: .init(Padding.small.rawValue, Padding.small.rawValue, Device.width.subtractPadding(.small, multiplier: 2), 50))
        searchBar?.barStyle = UIBarStyle.black
        searchBar?.isTranslucent = true
        searchBar?.barTintColor = .black
        searchBar?.placeholder = "Artists, Songs, Lyrics, and More"
        searchBar?.showsCancelButton = true
        
        if let search = searchBar {
            addSubview(search)
        }
        
    }
}



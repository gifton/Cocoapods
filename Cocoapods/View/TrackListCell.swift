
import UIKit


public class TrackListCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white.withAlphaComponent(0.125)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        setView()
        super.layoutSubviews()
    }
    
    private weak var viewModel: TrackCellViewModel?
    
    func setWith(viewModel: TrackCellViewModel) {
        self.viewModel = viewModel
        setView()
    }
    
    
    public override func prepareForReuse() {
        viewModel = nil
        iv.image = nil
        title.text = ""
        artist.text = ""
        super.prepareForReuse();
    }
    
    
    var iv = UIImageView()
    var title = UILabel()
    var artist = UILabel()
    
}

private extension TrackListCell {
    func setView() {
        guard let vm = viewModel else { return }
        
        iv.image = vm.artwork
        title.text = vm.title
        artist.text = vm.artist
        
        iv.frame.origin = .init(Padding.medium.rawValue)
        iv.frame.size = .init(60)
        addSubview(iv)
        
        title.sizeToFit()
        title.left = iv.right.addPadding()
        title.top = iv.top.addPadding()
        addSubview(title)
        
        artist.sizeToFit()
        artist.left = title.left
        artist.top = artist.bottom
        addSubview(artist)
        
        title.textColor = UIColor.white
        artist.textColor = UIColor.gray
    }
}

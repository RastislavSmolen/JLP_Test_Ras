import Foundation
import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var priceTagLabel: UILabel!
    
    static let identifier = "ProductCollectionViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        productTitle.textColor = UIColor.black
        
        priceTagLabel.textColor = UIColor.black
        priceTagLabel.font = .boldSystemFont(ofSize: 17)
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
    }
}

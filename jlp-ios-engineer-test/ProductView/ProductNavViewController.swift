import UIKit

// MARK: - ViewController
class ProductCollectionViewController: UIViewController {
    
    @IBOutlet weak var colectionView: UICollectionView!
    
    private let viewModel = ProductsViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchProducts(urlPaths: URLPaths.productsPageURL) { [weak self] in
            self?.colectionView.reloadData()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        colectionView.delegate = self
        colectionView.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = .zero
        
        let cellWidth = colectionView.frame.width
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        
        colectionView.collectionViewLayout = layout
    }
}

extension ProductCollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        viewModel.loadImage(from: viewModel.products[indexPath.item].image) { image in
            cell.imageView.image = image
        }
        
        cell.productTitle.text = viewModel.products[indexPath.item].title
        cell.priceTagLabel.text = ("\(Help.with.currencySymbol(code:viewModel.products[indexPath.item].price.currency.rawValue))\(viewModel.products[indexPath.item].price.now)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        vc.productIndex = indexPath.item
        vc.navigationItem.title = viewModel.products[indexPath.item].title
        navigationController?.pushViewController(vc, animated: true)
        
    }
}



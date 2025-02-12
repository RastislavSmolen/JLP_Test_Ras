import Foundation
import UIKit

class DetailViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productDetails: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    //MARK: Variables
    private let viewModel = DetailViewModel()
    var products: [ProductElement] = []
    var productIndex: Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
    }
    
    func setupTableView() {
        viewModel.fetchProductsDetail(urlPaths: URLPaths.detailViewURL) { [weak self] in
                self?.productCodeLabel.text = ("Product code: \(String(describing: self?.viewModel.detailProduct[self?.productIndex ?? 0].code ?? ""))")
                self?.productDetails.text = self?.viewModel.stripHTML(String(self?.viewModel.detailProduct[self?.productIndex ?? 0].details.editorsNotes ?? ""))
                self?.viewModel.loadImage(from: self?.viewModel.detailProduct[self?.productIndex ?? 0].media.images.altText ?? "") { image in
                    self?.imageView.image = image
                }
            self?.tableView.reloadData()
            
        }
    }
    @IBAction func showHalfVC(_ sender: Any) {
        showHalfScreenView()
    }
    
    func showHalfScreenView() {
        
        let sideMenuVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideViewController") as! SideViewController
        sideMenuVC.modalPresentationStyle = .overFullScreen
        sideMenuVC.price = "\(Help.with.currencySymbol(code: viewModel.detailProduct[productIndex].price.currency.rawValue))\(viewModel.detailProduct[productIndex].price.now)"
        sideMenuVC.dealText = viewModel.detailProduct[productIndex].displaySpecialOffer
        sideMenuVC.guaranteeText = viewModel.detailProduct[productIndex].additionalServices.includedServices[0].rawValue
        sideMenuVC.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        present(sideMenuVC, animated: false)
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard viewModel.detailProduct.indices.contains(productIndex) else { return 0 }
        let product = viewModel.detailProduct[productIndex]
        
        return product.details.features.first?.attributes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailViewCell", for: indexPath) as! DetailViewCell
        
        guard viewModel.detailProduct.indices.contains(productIndex),
              let feature = viewModel.detailProduct[productIndex].details.features.first,
              feature.attributes.indices.contains(indexPath.row) else {
            return cell
        }
        let attribute = feature.attributes[indexPath.row]
        cell.valueLabel.text = attribute.name
        cell.contentLabel.text = attribute.value
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Product Specifications"
    }
    
    
}

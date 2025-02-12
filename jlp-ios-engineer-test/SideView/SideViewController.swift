import UIKit

class SideViewController: UIViewController {
//MARK: Variables
    private let sideMenuWidth: CGFloat = UIScreen.main.bounds.width * 0.5
    private let backgroundView = UIView()
    private let sideMenuView = UIView()
    
    private let priceLabel = UILabel()
    private let dealLabel = UILabel()
    private let guaranteeLabel = UILabel()

    var price = ""
    var dealText = ""
    var guaranteeText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLabels()
        setupTapToDismiss()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.sideMenuView.frame.origin.x = UIScreen.main.bounds.width
        
        UIView.animate(withDuration: 0.3) {
            self.sideMenuView.frame.origin.x = UIScreen.main.bounds.width - self.sideMenuWidth
            self.backgroundView.alpha = 0.3
        }
    }
    
    private func setupViews() {
        
        backgroundView.frame = view.bounds
        backgroundView.backgroundColor = UIColor.black
        backgroundView.alpha = 0
        view.addSubview(backgroundView)
        
        
        sideMenuView.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: sideMenuWidth, height: UIScreen.main.bounds.height)
        sideMenuView.backgroundColor = .white
        view.addSubview(sideMenuView)
    }
    
    private func setupLabels() {
        
        let labelStartY: CGFloat = UIScreen.main.bounds.height * 0.1
        let labelSpacing: CGFloat = 20
     
        priceLabel.text = price
        priceLabel.font = UIFont.boldSystemFont(ofSize: 16)
        priceLabel.textColor = .black
        priceLabel.textAlignment = .left
        priceLabel.frame = CGRect(x: 20, y: labelStartY + (CGFloat(0) * labelSpacing), width: sideMenuWidth - 40, height: 30)
        
        if dealText == "" {
            dealText = "No deal available"
        }
        dealLabel.text = dealText
        dealLabel.font = UIFont.systemFont(ofSize: 12)
        dealLabel.textColor = UIColor(resource: ColorResource(name: "Burgundy", bundle: .main))
        dealLabel.textAlignment = .left
        dealLabel.frame = CGRect(x: 20, y: labelStartY + (CGFloat(1) * labelSpacing), width: sideMenuWidth - 40, height: 30)
        
        guaranteeLabel.text = guaranteeText
        guaranteeLabel.font = UIFont.systemFont(ofSize: 12)
        guaranteeLabel.textColor = UIColor(resource: ColorResource(name: "DarkGreen", bundle: .main))
        guaranteeLabel.textAlignment = .left
        guaranteeLabel.frame = CGRect(x: 20, y: labelStartY + (CGFloat(2) * labelSpacing), width: sideMenuWidth - 40, height: 0)
        guaranteeLabel.numberOfLines = 0
        guaranteeLabel.lineBreakMode = .byWordWrapping
        guaranteeLabel.preferredMaxLayoutWidth = sideMenuWidth - 40
        guaranteeLabel.sizeToFit()
        
        sideMenuView.addSubview(priceLabel)
        sideMenuView.addSubview(dealLabel)
        sideMenuView.addSubview(guaranteeLabel)

        
    }
    
    private func setupTapToDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissMenu))
        backgroundView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.sideMenuView.frame.origin.x = UIScreen.main.bounds.width
            self.backgroundView.alpha = 0 // Remove dim effect
        }) { _ in
            self.dismiss(animated: false)
        }
    }
}

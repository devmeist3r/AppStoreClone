import UIKit

class TodayDetailVC: UIViewController {
    var todayApp: TodayApp? {
        didSet {
            if let todayApp = todayApp {
                if todayApp.apps == nil {
                    self.addUnic()
                } else {
                    self.addMultiple()
                }
            }
        }
    }
    
    let closeButton: UIButton = .closeButton()
    
    var centerView: UIView?
    var frame: CGRect?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    let todayDetailUnicVC = TodayDetailUnicVC()
    let todayDetailMultiVC = TodayDetailMultipleVC()
    
    var handlerClose: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    func addButtonClose() {
        view.addSubview(closeButton)
        
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(handleCloseClick), for: .touchUpInside)
        closeButton.fill(top: self.view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 18, left: 0, bottom: 0, right: 24), size: .init(width: 32, height: 32))
        
        UIView.animate(withDuration: 0.3, delay: 0.2, options: .showHideTransitionViews, animations: { self.closeButton.alpha = 1 }, completion: nil)
    }
    
    func addUnic() {
        todayDetailUnicVC.todayApp = self.todayApp
        self.centerView = todayDetailUnicVC.view
        self.animation()
    }
    
    func addMultiple() {
        todayDetailMultiVC.todayApp = self.todayApp
        todayDetailMultiVC.handleClick = { app in
            let detailVC = AppDetailVC()
            detailVC.title = app.nome
            detailVC.appId = app.id
            detailVC.app = app
            
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        self.centerView = todayDetailMultiVC.view
        self.animation()
    }
    
    func animation() {
        guard let centerView = self.centerView else { return }
        guard let frame = self.frame else { return }
        
        centerView.translatesAutoresizingMaskIntoConstraints = false
        centerView.layer.cornerRadius = 16
        centerView.clipsToBounds = true
        
        view.addSubview(centerView)
        self.addButtonClose()
        
        self.topConstraint = centerView.topAnchor.constraint(equalTo: view.topAnchor, constant: frame.origin.y)
        self.leadingConstraint = centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: frame.origin.x)
        self.widthConstraint = centerView.widthAnchor.constraint(equalToConstant: frame.width)
        self.heightConstraint = centerView.heightAnchor.constraint(equalToConstant: frame.height)
        
        self.topConstraint?.isActive = true
        self.leadingConstraint?.isActive = true
        self.widthConstraint?.isActive = true
        self.heightConstraint?.isActive = true
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .overrideInheritedCurve, animations: {
            
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func animationClose() {
        
        self.todayDetailMultiVC.tableView.setContentOffset(CGPoint(x: 0, y: -self.todayDetailMultiVC.tableView.safeAreaInsets.top), animated: false)
        self.todayDetailMultiVC.tableView.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .overrideInheritedCurve, animations: {
            if let frame = self.frame {
                self.topConstraint?.constant = frame.origin.y
                self.leadingConstraint?.constant = frame.origin.x
                self.widthConstraint?.constant = frame.width
                self.heightConstraint?.constant = frame.height
                
                self.centerView?.layer.cornerRadius = 16
                
                self.todayDetailUnicVC.tableView.contentOffset = .zero
                
                self.view.layoutIfNeeded()
            }
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @objc func handleCloseClick() {
        self.closeButton.isHidden = true
        self.handlerClose?()
        self.animationClose()
    }
}

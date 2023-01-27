import UIKit
import SDWebImage

class SearchCell: UITableViewCell {
    var app: App! {
        didSet {
            titleLabel.text = app.nome
            companyLabel.text = app.empresa
            iconImageView.sd_setImage(with: URL(string: app.iconeUrl), completed: nil)
            
            if let screenshotUrls = app.screenshotUrls {
                if screenshotUrls.count > 0 {
                    self.screenshort1ImageView.sd_setImage(with: URL(string: screenshotUrls[0]), completed: nil)
                }
                if screenshotUrls.count > 1 {
                    self.screenshort2ImageView.sd_setImage(with: URL(string: screenshotUrls[1]), completed: nil)
                }
                if screenshotUrls.count > 2 {
                    self.screenshort3ImageView.sd_setImage(with: URL(string: screenshotUrls[2]), completed: nil)
                }
            }
        }
    }
    
    let iconImageView: UIImageView = .iconImageView()
    let titleLabel: UILabel = .textLabel(text: "App nome", fontSize: 18, numberOfLines: 2)
    let companyLabel: UILabel = .textLabel(text: "Empresa nome", fontSize: 14)
    let getButton: UIButton = .getButton()
    
    let screenshort1ImageView: UIImageView = .screenshotImageView()
    let screenshort2ImageView: UIImageView = .screenshotImageView()
    let screenshort3ImageView: UIImageView = .screenshotImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let titleCompanyStackView = UIStackView(arrangedSubviews: [titleLabel, companyLabel])
        titleCompanyStackView.spacing = 8
        titleCompanyStackView.axis = .vertical
        
        let headerstackView = UIStackView(arrangedSubviews: [iconImageView, titleCompanyStackView, getButton])
        headerstackView.spacing = 12
        headerstackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshort1ImageView, screenshort2ImageView, screenshort3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        
        let globalStackView = UIStackView(arrangedSubviews: [headerstackView, screenshotStackView])
        globalStackView.spacing = 16
        globalStackView.axis = .vertical
        
        addSubview(globalStackView)
        globalStackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

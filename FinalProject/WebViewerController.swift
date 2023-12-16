import UIKit
import WebKit

class WebViewerController: UIViewController {

    private let webView = WKWebView()
    private let urlString: String
    
    init(with urlString: String){
        self.urlString = urlString
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        
        guard let url = URL(string: self.urlString) else {
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.webView.load(URLRequest(url: url))
    }
    
    private func setupUI(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        self.navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
        
        self.view.addSubview(webView)
        
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.webView.snp.makeConstraints{ maker in
            maker.top.equalTo(self.view.snp.top)
            maker.bottom.equalTo(self.view.snp.bottom)
            maker.leading.equalTo(self.view.snp.leading)
            maker.trailing.equalTo(self.view.snp.trailing)
        }
    }



    @objc private func didTapDone(){
        self.dismiss(animated: true, completion: nil)
    }
}


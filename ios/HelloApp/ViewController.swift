import UIKit
import WebKit

class ViewController: UIViewController {
    private var webView: WKWebView!

    override func loadView() {
        // WKWebView 配置
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        config.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")

        let controller = WKUserContentController()
        config.userContentController = controller

        webView = WKWebView(frame: .zero, configuration: config)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // 允许 file:// 协议加载
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")

        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 从 app bundle 加载 uni-app index.html
        if let wwwPath = Bundle.main.path(forResource: "www", ofType: nil),
           let indexPath = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "www") {
            let url = URL(fileURLWithPath: indexPath)
            webView.loadFileURL(url, allowingReadAccessTo: URL(fileURLWithPath: wwwPath))
        } else {
            // 降级: 尝试从 bundle 根目录加载
            if let indexPath = Bundle.main.path(forResource: "index", ofType: "html") {
                let url = URL(fileURLWithPath: indexPath)
                webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
            }
        }
    }
}

//
//  AnimationViewController.swift
//  CLX
//
//  Created by MrQi on 2025/4/9.
//


import UIKit
import SnapKit
import SDWebImage

class AnimationView: UIView {
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    public var isMaxUrl: Bool = false
    private var _model: [String: Any]?
    private var currentWidth: CGFloat = 100

    override init(frame: CGRect) {
        super.init(frame: frame)
        //            backgroundColor = .red
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        //            imageView.backgroundColor = .red
        addSubview(imageView)

        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(titleLabel)

        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        titleLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
    }

    func setModel(model: [String: Any]) {
        _model = model
        isMaxUrl = false
        if let minUrl = model["minUrl"] as? String, let url = URL(
            string: minUrl
        ) {
            //            imageView.kf.setImage(with: url)
            imageView
                .sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder")) { [weak self] (
                    image,
                    error,
                    cacheType,
                    url
                ) in
                    if let error = error {
                        print("Image loading error: \(error)")
                        // 可以在这里设置默认图片
                        self?.imageView.image = UIImage(named: "error")
                    }
                }
        }
        titleLabel.text = (model["title"] as? String) ?? ""
    }

    func updateWidth(to width: CGFloat) {
        if currentWidth != width {
            currentWidth = width
            UIView.animate(withDuration: 0.2) {
                self.snp.updateConstraints { make in
                    make.width.equalTo(width)
                }
                self.layoutIfNeeded()
            }
        }
    }

    func changeImage(withUrl type: Bool) {
        if type == isMaxUrl {
            return
        }
        isMaxUrl = type
        if type {
            if let maxUrl = _model?["maxUrl"] as? String, let url = URL(
                string: maxUrl
            ) {
                UIView
                    .transition(
                        with: imageView,
                        duration: 0.3,
                        options: .transitionCrossDissolve,
                        animations: { [weak self] in

                            self?.imageView
                                .sd_setImage(
                                    with: url,
                                    placeholderImage: UIImage(
                                        named: "placeholder"
                                    )
                                )
                        },
                        completion: nil)
            }
        } else {
            if let minUrl = _model?["minUrl"] as? String, let url = URL(
                string: minUrl
            ) {


                self.imageView
                    .sd_setImage(
                        with: url,
                        placeholderImage: UIImage(named: "placeholder")
                    )
            }
        }
    }
}

class AnimationViewController: UIViewController {
    var timer: Timer?

    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private var views: [UIView] = []
    private let dataSource =  [
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/loanMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/loanMax.png",
            "jumpLink": "跳转链接一",
            "title": "借款指南"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/problemMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/problemMax.png",
            "jumpLink": "跳转链接二",
            "title": "常见问题"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/repayMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/repayMax.png",
            "jumpLink": "跳转链接三",
            "title": "还款指南"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/riskMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/riskMax.png",
            "jumpLink": "跳转链接四",
            "title": "风险检测"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/loanMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/loanMax.png",
            "jumpLink": "跳转链接五",
            "title": "借款指南"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/problemMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/problemMax.png",
            "jumpLink": "跳转链接六",
            "title": "常见问题"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/repayMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/repayMax.png",
            "jumpLink": "跳转链接七",
            "title": "还款指南"
        ],
        [
            "minUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/riskMin.png",
            "maxUrl": "https://common-dev-test.iqingnian.cn/webapp/slideshow/riskMax.png",
            "jumpLink": "跳转链接八",
            "title": "风险检测"
        ]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupContentView()
        setupViews()
        startAutoScroll()
    }

    func startAutoScroll() {
        timer = Timer
            .scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
                self?.scrollNextItem()
            }
        RunLoop.main.add(timer!, forMode: .common)
    }
        
    func scrollNextItem() {
        let currentOffset = scrollView.contentOffset
            
        // 检查是否需要重置位置
        if currentOffset.x + 120.0 >= 480 {
            scrollView.contentOffset = .zero
            updateViewAppearance()
            scrollNextItem()
        } else {
            UIView.animate(withDuration: 1) { [weak self] in
                self?.scrollView.contentOffset = CGPoint(x: currentOffset.x + 120.0, y: 0)
            } completion: { [weak self] _ in
                self?.updateViewAppearance()
            }
        }

    }
        
    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = false
        scrollView.delegate = self
        view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    private func setupContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)

        contentView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }

    private func setupViews() {
        var last = contentView.snp.left
        for item in dataSource {
            let tempView = AnimationView()
            tempView.setModel(model: item)
            contentView.addSubview(tempView)
            views.append(tempView)

            let isLast = dataSource.last == item

            tempView.snp.makeConstraints { make in
                make.left.equalTo(last)
                make.centerY.equalToSuperview()
                make.top.bottom.equalToSuperview()
                make.width.equalTo(100)
                if isLast {
                    make.right.equalToSuperview()
                }
            }
                
            last = tempView.snp.right

            if !isLast {
                let view = UIView()
                //                    view.backgroundColor = .yellow
                contentView.addSubview(view)
                views.append(view)

                view.snp.makeConstraints { make in
                    make.left.equalTo(tempView.snp.right)
                    make.width.equalTo(20)
                    make.height.equalTo(100)
                }
                    
                last = view.snp.right
            }
        }
            
        guard let animationView = views.first as? AnimationView else { return }
        animationView.updateWidth(to: 200)
        animationView.changeImage(withUrl: true)
    }

    private func updateViewAppearance() {
        for view in views {
            let viewCenterX = view.frame.origin.x - scrollView.contentOffset.x
            if let animationView = view as? AnimationView {
                let shouldExpand = viewCenterX < 120 && viewCenterX >= 0
                    
                let targetWidth = shouldExpand ? 200 : 100
                animationView.updateWidth(to: CGFloat(targetWidth))

                let shouldChangeImage = shouldExpand != animationView.isMaxUrl
                if shouldChangeImage {
                    animationView.changeImage(withUrl: shouldExpand)
                }
            }
        }
            
        correctionOffset()
    }
        
    private func correctionOffset() {
        var animationView: AnimationView?
            
        for view in views {
            if view.bounds.size.width > 100.0 {
                animationView = view as! AnimationView
                break
            }
        }
            
//        if animationView != nil {
//            var offsetX: CGFloat = 0.0
//            while offsetX + 120.0 < animationView?.frame.origin.x ?? 0 {
//                offsetX += 120.0
//            }
//            scrollView
//                .setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
//        }
    }
}

extension AnimationViewController: UIScrollViewDelegate {

    func scrollViewDidEndDragging(
        _ scrollView: UIScrollView,
        willDecelerate decelerate: Bool
    ) {
        if decelerate {
            // 如果滚动结束后还会减速，在减速结束的代理方法中处理
        } else {
            // 滚动直接结束，立即更新视图外观
            updateViewAppearance()
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // 滚动减速结束，更新视图外观
        updateViewAppearance()
    }
}

//
//  BannerView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 3/11/2567 BE.
//

import UIKit
import SwiftUI
import Kingfisher

/// Carousel banner view from UIPageViewController converted to SwiftUI by UIViewControllerRepresentable
struct BannerView: UIViewControllerRepresentable {
    let banners: [Banner]

    func makeUIViewController(context: Context) -> BannerViewController {
        BannerViewController(items: banners)
    }

    func updateUIViewController(_ uiViewController: BannerViewController, context: Context) {}
}

// MARK: - 

final class BannerPageViewController: UIViewController {
    let item: Banner

    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let emptyView = UIView()

    init(item: Banner) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        start()
    }

    private func setupLayout() {
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emptyView)
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.bottomAnchor.constraint(equalTo: imageView.topAnchor, constant: 1),
            emptyView.widthAnchor.constraint(equalTo: view.widthAnchor),
            emptyView.heightAnchor.constraint(equalToConstant: 112),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func start() {
        if let hexColor = item.backgroundColor {
            emptyView.backgroundColor = UIColor(hexString: hexColor)
        }

        guard let url = item.imageUrl,
              let imageUrl = URL(string: url)
        else { return }
        imageView.kf.setImage(with: imageUrl)
    }
}

final class BannerViewController: UIViewController {
    let bannersItem: [Banner]

    private lazy var carousel: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.delegate = self
        pageViewController.dataSource = self
        return pageViewController
    }()

    private lazy var banners: [BannerPageViewController] = {
        bannersItem.map { banner in
            BannerPageViewController(item: banner)
        }
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = banners.count
        return pageControl
    }()
    
    init(items: [Banner]) {
        self.bannersItem = items
        super.init(nibName: nil, bundle: nil)
        carousel.setViewControllers(
            [banners[0]],
            direction: .forward,
            animated: true
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(carousel.view)
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            carousel.view.topAnchor.constraint(equalTo: view.topAnchor),
            carousel.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carousel.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            carousel.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
}

extension BannerViewController: UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController)
    -> UIViewController? {
        guard let bannerViewController = viewController as? BannerPageViewController,
            let currentIndex = banners.firstIndex(of: bannerViewController) else { return nil }
        return currentIndex == 0 ? banners.last : banners[currentIndex - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController)
    -> UIViewController? {
        guard let bannerViewController = viewController as? BannerPageViewController,
            let currentIndex = banners.firstIndex(of: bannerViewController) else { return nil }
        return currentIndex == banners.count - 1 ? banners.first : banners[currentIndex + 1]
    }
}

extension BannerViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
            guard let currentViewController = pageViewController.viewControllers?.first as? BannerPageViewController,
                  let currentIndex = banners.firstIndex(of: currentViewController)
            else { return }
            pageControl.currentPage = currentIndex
        }
}

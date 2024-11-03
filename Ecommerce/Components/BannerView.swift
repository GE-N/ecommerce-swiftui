//
//  BannerView.swift
//  Ecommerce
//
//  Created by Jerapong Nampetch on 3/11/2567 BE.
//

import UIKit
import SwiftUI

/// Carousel banner view from UIPageViewController converted to SwiftUI by UIViewControllerRepresentable
struct BannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> BannerViewController {
        BannerViewController()
    }
    
    func updateUIViewController(_ uiViewController: BannerViewController, context: Context) {}
}

// MARK: - 

final class BannerViewController: UIViewController {
    private lazy var carousel: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        pageViewController.delegate = self
        pageViewController.dataSource = self
        return pageViewController
    }()
    
    private var banner1: UIViewController {
        let banner = UIViewController()
        banner.view.backgroundColor = .systemOrange
        // TODO: Image content and tap to navigate to full page banner content
        return banner
    }
    
    private var banner2: UIViewController {
        let banner = UIViewController()
        banner.view.backgroundColor = .systemPink
        // TODO: Image content and tap to navigate to full page banner content
        return banner
    }
    
    private var banner3: UIViewController {
        let banner = UIViewController()
        banner.view.backgroundColor = .systemMint
        // TODO: Image content and tap to navigate to full page banner content
        return banner
    }
    
    private lazy var banners: [UIViewController] = {
        [banner1, banner2, banner3]
    }()
    
    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = banners.count
        return pageControl
    }()
    
    init() {
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
        guard let currentIndex = banners.firstIndex(of: viewController) else { return nil }
        return currentIndex == 0 ? banners.last : banners[currentIndex - 1]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController)
    -> UIViewController? {
        guard let currentIndex = banners.firstIndex(of: viewController) else { return nil }
        return currentIndex == banners.count - 1 ? banners.first : banners[currentIndex + 1]
    }
}

extension BannerViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool) {
            guard let currentViewController = pageViewController.viewControllers?.first,
                  let currentIndex = banners.firstIndex(of: currentViewController)
            else { return }
            pageControl.currentPage = currentIndex
        }
}

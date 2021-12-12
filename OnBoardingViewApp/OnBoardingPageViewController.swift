//
//  OnBoardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by Hope on 2021/12/12.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {

    var pages: [UIViewController] = [UIViewController]()

    var bottomButtonMargin: NSLayoutConstraint?

    var pageControl = UIPageControl()

    let START_INDEX = 0

    var CURRENT_INDEX = 0 {
        didSet {
            pageControl.currentPage = CURRENT_INDEX
        }
    }

    override
    func viewDidLoad() {
        super.viewDidLoad()
        let itemVC1 = createOnBoardingItem(
                mainText: "MZ에게 꼭 맞는 취업 방법은 따로 있다!",
                subText: "개개인의 업무성향을 그래버가 진단하고, 업무성향 일치도가 높은 기업의 포지션을 추천하는 방식! 그래버가 취업의 정확한 방향을 찾아 제시해드립니다.",
                topImageName: "onboarding1"
        )

        let itemVC2 = createOnBoardingItem(
                mainText: "취업도 코칭이 필요해!",
                subText: "AI 코치와 전문가 코치가 뭉쳤다! 전문가의 진로 및 목표설정, 이력서 면접 클리닉 AI 코치가 진단, 추천, 관리를 통해 취업 목표 달성을 돕습니다.",
                topImageName: "onboarding2"
        )


        let itemVC3 = createOnBoardingItem(
                mainText: "한눈에 다 보이는 다이내믹  채용공고!",
                subText: "대표 취업포털 채용공고, 기업 단독 채용공고 모든 채용공고들을 한눈에 볼 수 있고 국내 최초 합격률을 예측해볼 수 있습니다.",
                topImageName: "onboarding3"
        )

        let itemVC4 = createOnBoardingItem(
                mainText: "취업의 가치를 더하는 오리지널 콘텐츠",
                subText: "어디에서도 찾아볼 수 없는 취업과 진로의 참신하고 독창적인 콘텐츠들로 읽는 즐거음에 대한 습관을 만들어 드립니다.",
                topImageName: "onboarding4"
        )


        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        pages.append(itemVC4)

        /**
         처음 시작 시 보일 뷰 컨트롤러
         */
        setViewControllers([itemVC1], direction: .forward, animated: true)
        makeBottomButton()
        makePageControl()

        dataSource = self
        delegate = self
    }

    private func makeBottomButton() {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .purple

        /**
         for - touchUpInside : 눌러서 놔둘 경우
         */
        button.addTarget(self, action: #selector(dismissPageVC), for: .touchUpInside)

        view.addSubview(button)
        /**
         Auto Layout 설정을 하려면 기본적으로 false 로 들어가 있어야 한다.
         */
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true

        bottomButtonMargin = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomButtonMargin?.isActive = true
        hideButton()
    }


    private func makePageControl() {
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        /**
         선택된 페이지 색
         */
        pageControl.currentPageIndicatorTintColor = .purple
        /**
         나머지 페이지 색
         */
        pageControl.pageIndicatorTintColor = .lightGray
        /**
         총 페이지 갯수
         */
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = START_INDEX

        /**
         constraints 설정
         */
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

//        pageControl.isUserInteractionEnabled = false

        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)

    }

    @objc
    func pageControlTapped(_ sender: UIPageControl) {

        let currentIndex = sender.currentPage
        let direction: NavigationDirection = currentIndex > CURRENT_INDEX ? .forward : .reverse
        setViewControllers([pages[currentIndex]], direction: direction, animated: true)
        CURRENT_INDEX = currentIndex
        buttonPresentationStyle()
    }

    private func buttonPresentationStyle() {
        isLastIndex() ? showButton() : hideButton()
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.455, delay: 0, options: [.curveEaseInOut]) {
            self.view.layoutIfNeeded()
        }
    }


    @objc
    func dismissPageVC() {
        dismiss(animated: true)
    }


    private func createOnBoardingItem(mainText: String, subText: String, topImageName: String) -> OnBoardingItemViewController {
        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.mainText = mainText
        itemVC1.subText = subText
        itemVC1.topImage = UIImage(named: topImageName)
        return itemVC1
    }
}


extension OnBoardingPageViewController: UIPageViewControllerDataSource {
    /**
     현재 페이지에서 이전 페이지
     - Parameters:
       - pageViewController:
       - viewController:
     - Returns:
     */
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex: Int = pages.firstIndex(of: viewController) else {
            return nil
        }

        CURRENT_INDEX = currentIndex
        if isFirstIndex() {
            return pages.last
        }

        return pages[CURRENT_INDEX - 1]
    }


    /**
     현재 페이지에서 다음 페이지
     - Parameters:
       - pageViewController:
       - viewController:
     - Returns:
     */
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let currentIndex: Int = pages.firstIndex(of: viewController) else {
            return nil
        }

        CURRENT_INDEX = currentIndex
        if isLastIndex() {
            return pages.first
        }

        return pages[CURRENT_INDEX + 1]
    }

    private func isFirstIndex() -> Bool {
        CURRENT_INDEX == 0
    }

    private func isLastIndex() -> Bool {
        CURRENT_INDEX == pages.count - 1
    }
}


extension OnBoardingPageViewController: UIPageViewControllerDelegate {


    public func pageViewController(_ pageViewController: UIPageViewController,
                                   didFinishAnimating finished: Bool,
                                   previousViewControllers: [UIViewController],
                                   transitionCompleted completed: Bool) {

        guard let currentViewController = pageViewController.viewControllers?.first else {
            return
        }
        guard let currentIndex = pages.firstIndex(of: currentViewController) else {
            return
        }

        CURRENT_INDEX = currentIndex
        buttonPresentationStyle()
    }

    private func hideButton() {
        bottomButtonMargin?.constant = 100
    }

    private func showButton() {
        bottomButtonMargin?.constant = -50
    }


}

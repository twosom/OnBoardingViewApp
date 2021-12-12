//
//  OnBoardingPageViewController.swift
//  OnBoardingViewApp
//
//  Created by Hope on 2021/12/12.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {

    var pages: [UIViewController] = [UIViewController]()


    override
    func viewDidLoad() {
        super.viewDidLoad()

        let itemVC1 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC1.mainText = "MZ에게 꽃 맞는 취업 방법은 따로 있다!"
        itemVC1.subText = "개개인의 업무성향을 그래버가 진단하고, 업무성향 일치도가 높은 기업의 포지션을 추천하는 방식! 그래버가 취업의 정확한 방향을 찾아 제시해드립니다."
        itemVC1.topImage = UIImage(named: "onboarding1")

        let itemVC2 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC2.mainText = "취업도 코칭이 필요해!"
        itemVC2.subText = "AI 코치와 전문가 코치가 뭉쳤다! 전문가의 진로 및 목표설정, 이력서 면접 클리닉 AI 코치가 진단, 추천, 관리를 통해 취업 목표 달성을 돕습니다."
        itemVC2.topImage = UIImage(named: "onboarding2")

        let itemVC3 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC3.mainText = "한눈에 다 보이는 다이내믹  채용공고!"
        itemVC3.subText = "대표 취업포털 채용공고, 기업 단독 채용공고 모든 채용공고들을 한눈에 볼 수 있고 국내 최초 합격률을 예측해볼 수 있습니다."
        itemVC3.topImage = UIImage(named: "onboarding3")

        let itemVC4 = OnBoardingItemViewController.init(nibName: "OnBoardingItemViewController", bundle: nil)
        itemVC4.mainText = "취업의 가치를 더하는 오리지널 콘텐츠"
        itemVC4.subText = "어디에서도 찾아볼 수 없는 취업과 진로의 참신하고 독창적인 콘텐츠들로 읽는 즐거음에 대한 습관을 만들어 드립니다."
        itemVC4.topImage = UIImage(named: "onboarding4")


        pages.append(itemVC1)
        pages.append(itemVC2)
        pages.append(itemVC3)
        pages.append(itemVC4)

        setViewControllers([itemVC1], direction: .forward, animated: true)

        dataSource = self
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
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)
            -> UIViewController? {
        guard let currentIndex: Int = pages.firstIndex(of: viewController) else {
            return nil
        }

        if currentIndex == 0 {
            return pages.last
        }


        return pages[currentIndex - 1]
    }

    /**
     현재 페이지에서 다음 페이지
     - Parameters:
       - pageViewController:
       - viewController:
     - Returns:
     */
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)
            -> UIViewController? {

        guard let currentIndex: Int = pages.firstIndex(of: viewController) else {
            return nil
        }

        if currentIndex == pages.count - 1 {
            return pages.first
        }

        return pages[currentIndex + 1]
    }


}

//
//  SceneDelegate.swift
//  testode
//
//  Created by Андрей Матлах on 13.06.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // 1. Сцена подключается к приложению (настройка главного экрана)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        print("SceneDelegate: willConnectTo — Сцена подключается. Здесь настраивается базовое окно (window).")
        guard let windowScene  = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()

    }

    // 2. Сцена отключена от приложения (освобождение ресурсов)
    func sceneDidDisconnect(_ scene: UIScene) {
        print("sceneDidDisconnect — Сцена отключена. Скоро она может быть не активна .")
    }

    // 3. Сцена переходит в активное состояние (в фокусе, принимает касания)
    func sceneDidBecomeActive(_ scene: UIScene) {
        print("sceneDidBecomeActive — Сцена активна. Приложение готово к работе.")
    }

    // 4. Сцена теряет фокус (например, потянули шторку уведомлений)
    func sceneWillResignActive(_ scene: UIScene) {
        print(" sceneWillResignActive — Сцена теряет фокус. Приостановка  задач.")
    }

    // 5. Сцена возвращается на передний план из фонового режима
    func sceneWillEnterForeground(_ scene: UIScene) {
        print("sceneWillEnterForeground — Сцена возвращается на экран.")
    }

    // 6. Сцена полностью ушла в фоновый режим (приложение свернули)
    func sceneDidEnterBackground(_ scene: UIScene) {
        print("sceneDidEnterBackground — Сцена в фоне. Сохраняйте данные здесь.")
    }
}




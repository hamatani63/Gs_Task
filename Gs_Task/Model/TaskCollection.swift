//
//  TaskCollection.swift
//  Gs_Task
//
//  Created by 浜谷 光吉 on 2017/09/23.
//  Copyright © 2017年 luckyblaze. All rights reserved.
//

import UIKit
import RealmSwift

class TaskCollection: NSObject {
    
    // シングルトンインスタンス
    static let sharedInstance = TaskCollection()
    
    var realmTasks = List<Task>()
    
    func addTaskCollection(_ task: Task){
        self.realmTasks.append(task)
        // Realmのインスタンスを取得
        let realm = try! Realm()
        // データを追加
        try! realm.write() {
            realm.add(realmTasks)
        }
    }
    
    func fetchTasks() {
        let realm = try! Realm()
        // Realmに保存されてるDog型のオブジェクトを全て取得
        let realmTasks = realm.objects(Task.self)
        
        // ためしに名前を表示
        for realmTask in realmTasks {
            self.realmTasks.append(realmTask)
            print("name: \(realmTask.title)")
        }
    }
}

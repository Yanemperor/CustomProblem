//
//  ZLGlobalTimer.swift
//  QuestionBank
//
//  Created by 周子龙 on 2019/12/13.
//  Copyright © 2019 zhouzilong. All rights reserved.
//

import UIKit

class ZLGlobalTimer: NSObject {
    static var shared = ZLGlobalTimer()
    
    var timer: DispatchSourceTimer?
    
    var isClick: Bool = false
    
    // 倒计时
    var countdown: Int = 10
    
    func waitingClick() {
        if isClick {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: ZLAdNotification.isClickAd), object: true)
        }
    }
    
    func initClick() {
        isClick = true
    }
    
    func openTimer(end: @escaping () -> ()) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ZLAdNotification.isClickAd), object: false)
        isClick = false
        /**
         wallDeadline: 什么时候开始
         leeway: 调用频率,即多久调用一次
         */
        //循环执行，马上开始，间隔为1s,误差允许10微秒
        if timer == nil {
            timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.global())
        }
        timer?.schedule(deadline: DispatchTime.now(), repeating: .seconds(1), leeway: .milliseconds(10))
        ///执行timer
        self.timer?.setEventHandler(handler: {
            self.countdown -= 1
            print(self.countdown)
            if self.countdown <= 0 {
                DispatchQueue.main.sync {
                    self.stopTimer()
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: ZLAdNotification.isClickAd), object: true)
                    self.isClick = true
                    end()
                }
            }
        })
        self.timer?.resume()
    }
    
    func stopTimer() {
        self.countdown = 10
        self.timer?.cancel()
        self.timer = nil
    }
}

//
//  Earnings.swift 收益计算
//  Example
//
//  Created by 吕连勇 on 16/8/7.
//  Copyright © 2016年 leo. All rights reserved.
//

import Foundation

// 公式：投资金额×预期收益率+一年天数*投资期限(投资金额×10%÷365×30=预期收益)

var investmentAmount: Double = 3000 // 投资金额
var expectedRateOfReturn: Double = 0.01 // 预期收益率
var dateMode: Double = 365 // 一年天数
var investmentHorizon: Double = 30 // 投资期限

print(investmentAmount*expectedRateOfReturn/dateMode*investmentHorizon)



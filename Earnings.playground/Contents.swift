//: Playground - noun: a place where people can play

import Cocoa

// 公式：投资金额×预期收益率+一年天数*投资期限(投资金额×10%÷365×30=预期收益)

var investmentAmount: Double = 2000 // 投资金额
var expectedRateOfReturn: Double = 0.1// 预期收益率
var dateMode: Double = 365 // 一年天数
var investmentHorizon: Double = 30 // 投资期限

print(investmentAmount*expectedRateOfReturn/dateMode*investmentHorizon)

// ====================================================================

func alipay(iAmt: Double, _ iHon: Double) -> Double {
    return formula(iAmt, 0.24, iHon)
}

/*
 * 公式
 * parameter iAmt 投资金额
 * parameter eRrn 预期收益率
 * parameter iHon 投资期限
 */
func formula(iAmt: Double, _ eRrn: Double, _ iHon: Double) -> Double {
    return investmentAmount*expectedRateOfReturn/365*investmentHorizon
}

let a = alipay(3000, 12)
print(a)

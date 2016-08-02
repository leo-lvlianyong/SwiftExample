/**
 * @Description 文件， 文件夹操作
 * @author leo_lvlianyong
 * @date 2016-06-09
 */

import UIKit

/* 1，遍历一个目录下的所有文件 */
// ####################################################################################

//假设用户文档下有如下文件和文件夹[test1.txt,fold1/test2.txt]
let manager = NSFileManager.defaultManager()
let urlForDocument = manager.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)

let url = urlForDocument[0] as NSURL

//（1）对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
let contentsOfPath = try? manager.contentsOfDirectoryAtPath(url.path!)
//contentsOfPath：Optional([fold1, test1.txt])
print("contentsOfPath: \(contentsOfPath)")

//（2）类似上面的，对指定路径执行浅搜索，返回指定目录路径下的文件、子目录及符号链接的列表
let contentsOfURL = try? manager.contentsOfDirectoryAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles);
// contentsOfURL：Optional([file://Users/.../Application/.../Documents/fold1/,
// file://Users/.../Application/.../Documents/test1.txt])
print("contentsOfURL: \(contentsOfURL)")

//（3）深度遍历，会递归遍历子文件夹（但不会递归符号链接）
let enumeratorAtPath = manager.enumeratorAtPath(url.path!)
// enumeratorAtPath：Optional([fold1, fold1/test2.txt, test1.txt])
print("enumeratorAtPath: \(enumeratorAtPath?.allObjects)")

//（4）类似上面的，深度遍历，会递归遍历子文件夹（但不会递归符号链接）
let enumeratorAtURL = manager.enumeratorAtURL(url, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions.SkipsHiddenFiles, errorHandler: nil)
print("enumeratorAtURL: \(enumeratorAtURL?.allObjects)")

//（5）深度遍历，会递归遍历子文件夹（包括符号链接，所以要求性能的话用enumeratorAtPath）
let subpaths = manager.subpathsAtPath(url.path!)
print("subpaths: \(subpaths)")

// ####################################################################################

/* 2，判断文件或文件夹是否存在 */
// ####################################################################################
let fileManger = NSFileManager.defaultManager()
let filePath: String = NSHomeDirectory() + "/Document/hangge.txt"
var exist = fileManger.fileExistsAtPath(filePath)

// ####################################################################################

/* 3，创建文件夹  */
// ####################################################################################
let myDirectory:String = NSHomeDirectory() + "/Docment/myFolder/Files"
let fileManger2 = NSFileManager.defaultManager()

//withIntermediateDirectories为ture表示路径中间如果有不存在的文件夹都会创建
try! fileManger2.createDirectoryAtPath(myDirectory, withIntermediateDirectories: true, attributes: nil)
// ####################################################################################

/* 4，将对象写入文件
可以通过writeToFile方法，可以创建文件并将对象写入，对象包括String，NSString，UIImage，NSArray，NSDictionary等。
原文出自：www.hangge.com  转载请保留原文链接：http://www.hangge.com/blog/cache/detail_527.html */
// ####################################################################################

//（1）把String保存到文件
let filePath2:String = NSHomeDirectory() + "/Documents/hangge.txt"
let info = "欢迎来到hange.com"
try! info.writeToFile(filePath2, atomically: true, encoding: NSUTF8StringEncoding)
var exist1 = fileManger.fileExistsAtPath(filePath2)

//（2）把图片保存到文件路径下
//let filePath3:String = NSHomeDirectory() + "/Documents/hangge.png"
//let image = UIImage(named: "hangge.png")
//let data:NSData = UIImagePNGRepresentation(image!)!
//data.writeToFile(filePath3, atomically: true)

//（3）把NSArray保存到文件路径下
let array = NSArray(objects: "aaa","bbb","ccc")
let filePath4:String = NSHomeDirectory() + "/Documents/array.plist"
array.writeToFile(filePath4, atomically: true)

// （4）把NSDictionary保存到文件路径下
let dictionary = NSDictionary(objects: ["111","222"], forKeys: ["aaa","bbb"])
let filePath5:String = NSHomeDirectory() + "/Documents/dictionary.plist"
dictionary.writeToFile(filePath5, atomically: true)
// ####################################################################################

// 5，创建文件
// ####################################################################################
func createFile(name:String, fileBaseUrl: NSURL) {
    let manager = NSFileManager.defaultManager()
    let file = fileBaseUrl.URLByAppendingPathComponent(name)
    print("文件：\(file)")
    let exist = manager.fileExistsAtPath(file.path!)
    if !exist {
        let data = NSData(base64EncodedString:"aGVsbG8gd29ybGQ=", options:.IgnoreUnknownCharacters)
        let createSuccess = manager.createFileAtPath(file.path!, contents: data, attributes: nil)
        print("文件创建结果：\(createSuccess)")
    }
}

let manager1 = NSFileManager.defaultManager()
let urlForDocument1 = manager1.URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)
let url1 = urlForDocument1[0] as NSURL
createFile("test.txt", fileBaseUrl: url1)


// 公共方法：创建 defaultManager
func createDefaultManager() -> NSFileManager{
    return NSFileManager.defaultManager()
}

// 公共方法：判断文件是否存在
func isFileExists(name:String) -> Bool {
    let file = getFileBaseUrl().URLByAppendingPathComponent(name)
    return createDefaultManager().fileExistsAtPath(file.path!)
}

// 公共方法：获取文件路径
func getFileBaseUrl() -> NSURL {
    return createDefaultManager() .URLsForDirectory(NSSearchPathDirectory.DocumentDirectory, inDomains: NSSearchPathDomainMask.UserDomainMask)[0] as NSURL
}

// 调用公共方法判断文件是否存在
isFileExists("test.txt")

// ####################################################################################

// 6，复制文件(复制没有成功，报错！)
// ####################################################################################

//（1）方法1
let homeDirectory = NSHomeDirectory()
let srcUrl = NSHomeDirectory() + "/Documents/hangge.txt"
isFileExists(srcUrl)
let toUrl = NSHomeDirectory() + "/Documents/copyed.txt"
isFileExists(toUrl)
// 下面的方法不知名的报错
// try! createDefaultManager().copyItemAtPath(srcUrl, toPath: toUrl)

//（2）方法2
let srcUrl2 = getFileBaseUrl().URLByAppendingPathComponent("text.txt")
let toUrl2 = getFileBaseUrl().URLByAppendingPathComponent("copyed.txt")
// 下面的方法不知名的报错
// try! createDefaultManager().copyItemAtURL(srcUrl2, toURL: toUrl2)

// 7，移动文件 (移动没有成功，报错！)
// ####################################################################################

//（1）方法1
let srcMoveUrl = homeDirectory + "/Documents/hangge.txt"
let toMoveUrl = homeDirectory + "/Documents/moved"
// try! createDefaultManager().moveItemAtPath(srcMoveUrl, toPath: toMoveUrl)

//（2）方法2
let srcMoveUrl2 = getFileBaseUrl().URLByAppendingPathComponent("text.txt")
let toMoveUrl2 = getFileBaseUrl().URLByAppendingPathComponent("copyed.txt")
// 下面的方法不知名的报错
// try! createDefaultManager().moveItemAtURL(srcMoveUrl2, toURL: toMoveUrl2)

// ####################################################################################









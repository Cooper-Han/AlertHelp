//
//  AlertHelp.h
//  ILiveDemo
//
//  Created by Mr.Han on 2018/6/19.
//  Copyright © 2018年 Mr.Han. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^AlertActionHandle)(UIAlertAction * _Nonnull action);

@interface AlertHelp : NSObject

/**
 获取顶层的控制器
 
 @return 控制器
 */
+ (UIViewController *_Nullable)topViewController;



/**
 只有确认跟取消两个操作选项
 
 @param title 弹框 title
 @param message 弹框描述信息
 @param confirmName 确定按钮的名字
 @param cancelName 取消按钮的名字
 @param alertStyle 弹框风格
 @param confirmAction 确认事件回调
 @param cancelAction 取消事件回调
 @return UIAlertController
 */
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                   confirmName:(NSString *_Nullable)confirmName
                                    cancelName:(NSString *_Nullable)cancelName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                 confirmAction:(AlertActionHandle _Nullable)confirmAction
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction;





/**
 只有一个操作选项 (用取消选项代替)
 
 @param title 弹框 title
 @param message 弹框描述信息
 @param cancelName 取消按钮的名字
 @param alertStyle 弹框风格
 @param cancelAction 取消事件回调
 @return UIAlertController
 */
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                    cancelName:(NSString *_Nullable)cancelName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction;




/**
 有多个操作选项且没有 "特殊" 选项 (特殊选项颜色是带有警告性的红色)
 
 @param title 弹框 title
 @param message 弹框描述信息
 @param items 执行选项合集
 @param cancelName 取消按钮的名字
 @param alertStyle 弹框风格
 @param cancelAction 取消事件回调
 @return UIAlertController
 
 🔆 描述: 参数: "items" 为多个事件的字典集合
 🔆 字典的 key 为事件名; 字典的 value 为 "AlertActionHandle"
 🔆 示例如下:
 📌
 AlertActionHandle block_A = ^(UIAlertAction *_Nonnull action){
 // Do something
 };
 
 AlertActionHandle block_B = ^(UIAlertAction *_Nonnull action){
 // Do something
 };
 
 NSDictionary *items = @{@"功能_1" : block_A, @"功能_2" : block_B};
 📌
 */
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                         items:(NSDictionary *_Nullable)items
                                    cancelName:(NSString *_Nullable)cancelName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction;



/**
 有多个操作选项且有 "特殊" 选项 (特殊选项颜色是带有警告性的红色)
 
 @param title 弹框 title
 @param message 弹框描述信息
 @param items 执行选项合集
 @param cancelName 取消按钮的名字
 @param specialName "特殊"选项的名字
 @param alertStyle 弹框风格
 @param cancelAction 取消事件回调
 @param specialAction "特殊"选项回调
 @return UIAlertController
 
 🔆 描述: 参数: "items" 为多个事件的字典集合
 🔆 字典的 key 为事件名; 字典的 value 为 "AlertActionHandle"
 🔆 示例如下:
 📌
 AlertActionHandle block_A = ^(UIAlertAction *_Nonnull action){
 // Do something
 };
 
 AlertActionHandle block_B = ^(UIAlertAction *_Nonnull action){
 // Do something
 };
 
 NSDictionary *items = @{@"功能_1" : block_A, @"功能_2" : block_B};
 📌
 */
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                         items:(NSDictionary *_Nullable)items
                                    cancelName:(NSString *_Nullable)cancelName
                                   specialName:(NSString *_Nullable)specialName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction
                                 specialAction:(AlertActionHandle _Nullable)specialAction;




@end

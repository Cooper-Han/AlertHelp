//
//  AlertHelp.m
//  ILiveDemo
//
//  Created by Mr.Han on 2018/6/19.
//  Copyright © 2018年 Mr.Han. All rights reserved.
//

#import "AlertHelp.h"

@implementation AlertHelp
#pragma mark - 获取顶部控制器
+ (UIViewController *_Nullable)topViewController
{
    UIViewController *VCForCurrent;
    VCForCurrent = [self selectViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (VCForCurrent.presentedViewController)
    {
        VCForCurrent = [self selectViewController:VCForCurrent.presentedViewController];
    }
    return VCForCurrent;
}




#pragma mark - 当前选中的子控制器
+ (UIViewController *_Nullable)selectViewController:(UIViewController *_Nullable)viewController
{
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        return [self selectViewController:[(UINavigationController *)viewController topViewController]];
    } else if ([viewController isKindOfClass:[UITabBarController class]])
    {
        return [self selectViewController:[(UITabBarController *)viewController selectedViewController]];
    } else
    {
        return viewController;
    }
    return nil;
}




#pragma mark - 只有确认跟取消两个操作选项
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                   confirmName:(NSString *_Nullable)confirmName
                                    cancelName:(NSString *_Nullable)cancelName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                 confirmAction:(AlertActionHandle _Nullable)confirmAction
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction
{
    return [AlertHelp alertWithTitle:title
                             message:message
                               items:@{confirmName : confirmAction}
                          cancelName:cancelName
                         specialName:nil
                          alertStyle:alertStyle
                        cancelAction:cancelAction
                       specialAction:nil];
}




#pragma mark - 只有一个操作选项 (用取消选项代替)
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                    cancelName:(NSString *_Nullable)cancelName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction
{
    return [AlertHelp alertWithTitle:title
                             message:message
                               items:nil
                          cancelName:cancelName
                         specialName:nil
                          alertStyle:alertStyle
                        cancelAction:cancelAction
                       specialAction:nil];
}




#pragma mark - 有多个操作选项且没有 "特殊" 选项 (特殊选项颜色是带有警告性的红色)
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                         items:(NSDictionary *_Nullable)items
                                    cancelName:(NSString *_Nullable)cancelName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction
{
    return [AlertHelp alertWithTitle:title
                             message:message
                               items:items
                          cancelName:cancelName
                         specialName:nil
                          alertStyle:alertStyle
                        cancelAction:cancelAction
                       specialAction:nil];
}




#pragma mark - 有多个操作选项且有 "特殊" 选项 (特殊选项颜色是带有警告性的红色)
+ (UIAlertController *_Nullable)alertWithTitle:(NSString *_Nullable)title
                                       message:(NSString *_Nullable)message
                                         items:(NSDictionary *_Nullable)items
                                    cancelName:(NSString *_Nullable)cancelName
                                   specialName:(NSString *_Nullable)specialName
                                    alertStyle:(UIAlertControllerStyle)alertStyle
                                  cancelAction:(AlertActionHandle _Nullable)cancelAction
                                 specialAction:(AlertActionHandle _Nullable)specialAction
{
    if (alertStyle != UIAlertControllerStyleActionSheet && alertStyle != UIAlertControllerStyleAlert)
    {
        return nil;
    }
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:alertStyle];
    
    
    if (cancelName && cancelName.length > 0)
    {
        [alert addAction:[UIAlertAction actionWithTitle:cancelName style:UIAlertActionStyleCancel handler:cancelAction]];
    }
    
    
    
    for (NSString *key in items.allKeys)
    {
        AlertActionHandle action = [items objectForKey:key];
        [alert addAction:[UIAlertAction actionWithTitle:key style:UIAlertActionStyleDefault handler:action]];
    }
    
    
    if (specialName && specialName.length > 0)
    {
        [alert addAction:[UIAlertAction actionWithTitle:specialName style:UIAlertActionStyleDestructive handler:specialAction]];
    }
    
    
    __block UIViewController *VCForTop = [AlertHelp topViewController];
    
    if ([VCForTop isKindOfClass:[UIAlertController class]])
    {
        [VCForTop dismissViewControllerAnimated:YES completion:^{
            VCForTop = [AlertHelp topViewController];
            [VCForTop presentViewController:alert animated:YES completion:nil];
        }];
    } else
    {
        [VCForTop presentViewController:alert animated:YES completion:nil];
    }
    
    return alert;
}


@end

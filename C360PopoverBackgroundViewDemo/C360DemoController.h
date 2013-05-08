//
// C360DemoController.h
// 
// Created on 2013-05-08 using NibFree
// 

#import <UIKit/UIKit.h>

@protocol C360DemoControllerDelegate;

@interface C360DemoController : UIViewController

@property (nonatomic, weak) id<C360DemoControllerDelegate> delegate;

@end

@protocol C360DemoControllerDelegate <NSObject>

@end


//
// C360DemoContentController.h
// 
// Created on 2013-05-08 using NibFree
// 

#import <UIKit/UIKit.h>

@protocol C360DemoContentControllerDelegate;

@interface C360DemoContentController : UIViewController

@property (nonatomic, weak) id<C360DemoContentControllerDelegate> delegate;

@end

@protocol C360DemoContentControllerDelegate <NSObject>

@end


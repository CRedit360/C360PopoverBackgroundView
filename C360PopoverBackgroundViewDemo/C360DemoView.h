//
// C360DemoView.h
// 
// Created on 2013-05-08 using NibFree
// 

#import <UIKit/UIKit.h>

@protocol C360DemoViewDataSource;
@protocol C360DemoViewDelegate;

@interface C360DemoView : UIView

@property (nonatomic, weak) id<C360DemoViewDataSource> dataSource;
@property (nonatomic, weak) id<C360DemoViewDelegate> delegate;

- (void)reloadData;

@end

@protocol C360DemoViewDataSource <NSObject>

- (UIColor *)demoViewCurrentColor:(C360DemoView *)demoView;
- (BOOL)demoViewIsDefaultColor:(C360DemoView *)demoView;
- (BOOL)demoViewNavigationBarShown:(C360DemoView *)demoView;

@end

@protocol C360DemoViewDelegate <NSObject>

- (void)demoView:(C360DemoView *)demoView didChangeColor:(UIColor *)color;
- (void)demoView:(C360DemoView *)demoView didChangeIsDefaultColor:(BOOL)isDefaultColor;
- (void)demoView:(C360DemoView *)demoView didChangeNavigationBarShown:(BOOL)shown;
- (void)demoView:(C360DemoView *)demoView buttonTapped:(id)sender;

@end


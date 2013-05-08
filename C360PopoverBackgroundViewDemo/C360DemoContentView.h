//
// C360DemoContentView.h
// 
// Created on 2013-05-08 using NibFree
// 

#import <UIKit/UIKit.h>

@protocol C360DemoContentViewDelegate;

@interface C360DemoContentView : UIView

@property (nonatomic, weak) id<C360DemoContentViewDelegate> delegate;

@end

@protocol C360DemoContentViewDelegate <NSObject>

- (void)contentView:(C360DemoContentView *)contentView verticalGrowButtonTapped:(id)sender;
- (void)contentView:(C360DemoContentView *)contentView verticalShrinkButtonTapped:(id)sender;
- (void)contentView:(C360DemoContentView *)contentView horizontalGrowButtonTapped:(id)sender;
- (void)contentView:(C360DemoContentView *)contentView horizontalShrinkButtonTapped:(id)sender;

@end


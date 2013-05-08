//
// C360DemoContentView.m
// 
// Created on 2013-05-08 using NibFree
// 

#import "C360DemoContentView.h"

@interface C360DemoContentView ()

@property (nonatomic, strong, readonly) UIButton *topGrowButton;
@property (nonatomic, strong, readonly) UIButton *topShrinkButton;
@property (nonatomic, strong, readonly) UIButton *leftGrowButton;
@property (nonatomic, strong, readonly) UIButton *leftShrinkButton;
@property (nonatomic, strong, readonly) UIButton *rightGrowButton;
@property (nonatomic, strong, readonly) UIButton *rightShrinkButton;
@property (nonatomic, strong, readonly) UIButton *bottomGrowButton;
@property (nonatomic, strong, readonly) UIButton *bottomShrinkButton;

@end

@implementation C360DemoContentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.opaque = YES;
        self.backgroundColor = [UIColor whiteColor];
        
        _topGrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _topGrowButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [_topGrowButton setTitle:@"+" forState:UIControlStateNormal];
        [_topGrowButton addTarget:self action:@selector(verticalGrowButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_topGrowButton];
        
        _topShrinkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _topShrinkButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [_topShrinkButton setTitle:@"-" forState:UIControlStateNormal];
        [_topShrinkButton addTarget:self action:@selector(verticalShrinkButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_topShrinkButton];
        
        _leftGrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _leftGrowButton.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_leftGrowButton setTitle:@"+" forState:UIControlStateNormal];
        [_leftGrowButton addTarget:self action:@selector(horizontalGrowButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftGrowButton];
        
        _leftShrinkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _leftShrinkButton.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        [_leftShrinkButton setTitle:@"-" forState:UIControlStateNormal];
        [_leftShrinkButton addTarget:self action:@selector(horizontalShrinkButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftShrinkButton];
        
        _rightGrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _rightGrowButton.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
        [_rightGrowButton setTitle:@"+" forState:UIControlStateNormal];
        [_rightGrowButton addTarget:self action:@selector(horizontalGrowButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightGrowButton];
        
        _rightShrinkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _rightShrinkButton.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin;
        [_rightShrinkButton setTitle:@"-" forState:UIControlStateNormal];
        [_rightShrinkButton addTarget:self action:@selector(horizontalShrinkButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightShrinkButton];
        
        _bottomGrowButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _bottomGrowButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [_bottomGrowButton setTitle:@"+" forState:UIControlStateNormal];
        [_bottomGrowButton addTarget:self action:@selector(verticalGrowButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bottomGrowButton];
        
        _bottomShrinkButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _bottomShrinkButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [_bottomShrinkButton setTitle:@"-" forState:UIControlStateNormal];
        [_bottomShrinkButton addTarget:self action:@selector(verticalShrinkButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bottomShrinkButton];
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat width = self.bounds.size.width, height = self.bounds.size.height;
    
    self.topGrowButton.frame =      CGRectMake(118, 10, width - 236, 44);
    self.topShrinkButton.frame =    CGRectMake(118, 64, width - 236, 44);
    self.leftGrowButton.frame =     CGRectMake(10, 118, 44, height - 236);
    self.leftShrinkButton.frame =   CGRectMake(64, 118, 44, height - 236);
    self.rightGrowButton.frame =    CGRectMake(width - 64, 118, 44, height - 236);
    self.rightShrinkButton.frame =  CGRectMake(width - 118, 118, 44, height - 236);
    self.bottomGrowButton.frame =   CGRectMake(118, height - 64, width - 236, 44);
    self.bottomShrinkButton.frame = CGRectMake(118, height - 118, width - 236, 44);
}

- (void)verticalGrowButtonTapped:(id)sender
{
    [self.delegate contentView:self verticalGrowButtonTapped:sender];
}

- (void)verticalShrinkButtonTapped:(id)sender
{
    [self.delegate contentView:self verticalShrinkButtonTapped:sender];
}

- (void)horizontalGrowButtonTapped:(id)sender
{
    [self.delegate contentView:self horizontalGrowButtonTapped:sender];
}

- (void)horizontalShrinkButtonTapped:(id)sender
{
    [self.delegate contentView:self horizontalShrinkButtonTapped:sender];
}

@end


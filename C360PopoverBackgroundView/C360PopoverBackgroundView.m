//
//  C360PopoverBackgroundView.m
//
//  Created by Simon Booth on 29/04/2013.
//  Copyright (c) 2013 CRedit360. All rights reserved.
//

#import "C360PopoverBackgroundView.h"
#import <QuartzCore/QuartzCore.h>

@interface C360PopoverBackgroundView () {
    BOOL _needsImageUpdate;
}

@property (nonatomic, assign, readonly) CGFloat cornerRadius;
@property (nonatomic, assign, readonly) CGFloat highlightDepth;

@property (nonatomic, strong) UIImageView *fillView;
@property (nonatomic, strong) UIImageView *topLeftCornerView;
@property (nonatomic, strong) UIImageView *topLeftEdgeView;
@property (nonatomic, strong) UIImageView *topArrowView;
@property (nonatomic, strong) UIImageView *topRightEdgeView;
@property (nonatomic, strong) UIImageView *topRightCornerView;
@property (nonatomic, strong) UIImageView *upperRightEdgeView;
@property (nonatomic, strong) UIImageView *rightArrowView;
@property (nonatomic, strong) UIImageView *lowerRightEdgeView;
@property (nonatomic, strong) UIImageView *bottomRightCornerView;
@property (nonatomic, strong) UIImageView *bottomRightEdgeView;
@property (nonatomic, strong) UIImageView *bottomArrowView;
@property (nonatomic, strong) UIImageView *bottomLeftEdgeView;
@property (nonatomic, strong) UIImageView *bottomLeftCornerView;
@property (nonatomic, strong) UIImageView *upperLeftEdgeView;
@property (nonatomic, strong) UIImageView *leftArrowView;
@property (nonatomic, strong) UIImageView *lowerLeftEdgeView;

@end

@implementation C360PopoverBackgroundView

+ (CGFloat)arrowHeight
{
    return 19;
}

+ (CGFloat)arrowBase
{
    return 38;
}

+ (UIEdgeInsets)contentViewInsets
{
    return UIEdgeInsetsMake(8, 8, 8, 8);
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _fillView = [[UIImageView alloc] init]; [self addSubview:_fillView];
        _topLeftCornerView = [[UIImageView alloc] init]; [self addSubview:_topLeftCornerView];
        _topLeftEdgeView = [[UIImageView alloc] init]; [self addSubview:_topLeftEdgeView];
        _topArrowView = [[UIImageView alloc] init]; [self addSubview:_topArrowView];
        _topRightEdgeView = [[UIImageView alloc] init]; [self addSubview:_topRightEdgeView];
        _topRightCornerView = [[UIImageView alloc] init]; [self addSubview:_topRightCornerView];
        _upperRightEdgeView = [[UIImageView alloc] init]; [self addSubview:_upperRightEdgeView];
        _rightArrowView = [[UIImageView alloc] init]; [self addSubview:_rightArrowView];
        _lowerRightEdgeView = [[UIImageView alloc] init]; [self addSubview:_lowerRightEdgeView];
        _bottomRightCornerView = [[UIImageView alloc] init]; [self addSubview:_bottomRightCornerView];
        _bottomRightEdgeView = [[UIImageView alloc] init]; [self addSubview:_bottomRightEdgeView];
        _bottomArrowView = [[UIImageView alloc] init]; [self addSubview:_bottomArrowView];
        _bottomLeftEdgeView = [[UIImageView alloc] init]; [self addSubview:_bottomLeftEdgeView];
        _bottomLeftCornerView = [[UIImageView alloc] init]; [self addSubview:_bottomLeftCornerView];
        _upperLeftEdgeView = [[UIImageView alloc] init]; [self addSubview:_upperLeftEdgeView];
        _leftArrowView = [[UIImageView alloc] init]; [self addSubview:_leftArrowView];
        _lowerLeftEdgeView = [[UIImageView alloc] init]; [self addSubview:_lowerLeftEdgeView];
        
        _topRightEdgeView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _topRightCornerView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        _upperRightEdgeView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        _rightArrowView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        _lowerRightEdgeView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
        _bottomRightCornerView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        _bottomRightEdgeView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
        _bottomArrowView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        _bottomLeftEdgeView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        _bottomLeftCornerView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
        _lowerLeftEdgeView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
        for (UIView *subview in self.subviews)
        {
            subview.alpha = 0.95;
        }
        
        [self setNeedsImageUpdate];
    }
    return self;
}

- (void)dealloc
{
    [[NSRunLoop mainRunLoop] cancelPerformSelectorsWithTarget:self];
}

- (CGFloat)arrowOffset
{
    CGFloat arrowOffset = _arrowOffset;
    CGFloat arrowHalfBase = [[self class] arrowBase] / 2;
    
    switch (self.arrowDirection)
    {
        case UIPopoverArrowDirectionUp:
        case UIPopoverArrowDirectionDown:
        {
            CGFloat width = self.bounds.size.width;
            
            CGFloat maxOffset = (width/2) - (arrowHalfBase + self.cornerRadius);
            if (arrowOffset > maxOffset) return maxOffset;
            if (arrowOffset < -maxOffset) return -maxOffset;
            
            break;
        }
            
        case UIPopoverArrowDirectionLeft:
        case UIPopoverArrowDirectionRight:
        {
            CGFloat height = self.bounds.size.height;
            
            CGFloat maxOffset = (height/2) - (arrowHalfBase + self.cornerRadius);
            if (arrowOffset > maxOffset) return maxOffset;
            
            CGFloat minOffset = (arrowHalfBase + self.highlightDepth) - (height/2);
            if (arrowOffset < minOffset) return minOffset;
            
            break;
        }
            
        default:
            break;
    }
    
    return arrowOffset;
}

- (void)setArrowOffset:(CGFloat)arrowOffset
{
    _arrowOffset = arrowOffset;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (UIPopoverArrowDirection)arrowDirection
{
    return _arrowDirection;
}

- (void)setArrowDirection:(UIPopoverArrowDirection)arrowDirection
{
    _arrowDirection = arrowDirection;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)setTintColor:(UIColor *)tintColor
{
    _tintColor = tintColor;
    [self setNeedsImageUpdate];
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    [self setNeedsImageUpdate];
}

- (void)setGlowColor:(UIColor *)glowColor
{
    _glowColor = glowColor;
    [self setNeedsImageUpdate];
}

- (CGFloat)cornerRadius
{
    return 10;
}

- (CGFloat)highlightDepth
{
    return 24;
}

- (void)layoutSubviews
{
    CGFloat width = self.bounds.size.width, height = self.bounds.size.height;
    CGFloat cornerRadius = self.cornerRadius;
    CGFloat highlightDepth = self.highlightDepth;
    
    CGFloat x0 = 0, x1 = 0, x2 = cornerRadius,
            tx3 = width/2, tx5 = width/2,
            bx3 = width/2, bx5 = width/2,
            x6 = width-cornerRadius, x7 = width, x8 = width;
    
    CGFloat y0 = 0, y1 = 0, y2 = highlightDepth,
            ly3 = height/2, ly5 = height/2,
            ry3 = height/2, ry5 = height/2,
            y6 = height-cornerRadius, y7 = height, y8 = height;
    
    CGFloat arrowHeight = [[self class] arrowHeight], arrowHalfHeight = arrowHeight/2;
    CGFloat arrowBase = [[self class] arrowBase], arrowHalfBase = arrowBase/2;
    
    CGFloat arrowOffset = self.arrowOffset;
    
    switch (self.arrowDirection)
    {
        case UIPopoverArrowDirectionUp:
            
            y1 += arrowHeight;
            y2 += arrowHeight;
            ly3 += arrowHalfHeight;
            ly5 += arrowHalfHeight;
            ry3 += arrowHalfHeight;
            ry5 += arrowHalfHeight;
            
            tx3 += arrowOffset - arrowHalfBase;
            tx5 += arrowOffset + arrowHalfBase;
            
            break;
            
        case UIPopoverArrowDirectionLeft:
            
            x1 += arrowHeight;
            x2 += arrowHeight;
            tx3 += arrowHalfHeight;
            tx5 += arrowHalfHeight;
            bx3 += arrowHalfHeight;
            bx5 += arrowHalfHeight;
            
            ly3 += arrowOffset - arrowHalfBase;
            ly5 += arrowOffset + arrowHalfBase;
            
            break;
            
        case UIPopoverArrowDirectionDown:
            
            ly3 -= arrowHalfHeight;
            ly5 -= arrowHalfHeight;
            ry3 -= arrowHalfHeight;
            ry5 -= arrowHalfHeight;
            y6 -= arrowHeight;
            y7 -= arrowHeight;
            
            bx3 += arrowOffset - arrowHalfBase;
            bx5 += arrowOffset + arrowHalfBase;
            
            break;
            
        case UIPopoverArrowDirectionRight:
            
            tx3 -= arrowHalfHeight;
            tx5 -= arrowHalfHeight;
            bx3 -= arrowHalfHeight;
            bx5 -= arrowHalfHeight;
            x6 -= arrowHeight;
            x7 -= arrowHeight;
            
            ry3 += arrowOffset - arrowHalfBase;
            ry5 += arrowOffset + arrowHalfBase;
            
            break;
            
        default:
            break;
    }
    
    self.fillView.frame =               CGRectMake(x2,      y2,     x6-x2,      y6-y2);
    self.topLeftCornerView.frame =      CGRectMake(x1,      y1,     x2-x1,      y2-y1);
    self.topLeftEdgeView.frame =        CGRectMake(x2,      y1,     tx3-x2,     y2-y1);
    self.topArrowView.frame =           CGRectMake(tx3,     y0,     tx5-tx3,    y2-y0);
    self.topRightEdgeView.frame =       CGRectMake(tx5,     y1,     x6-tx5,     y2-y1);
    self.topRightCornerView.frame =     CGRectMake(x6,      y1,     x7-x6,      y2-y1);
    self.upperRightEdgeView.frame =     CGRectMake(x6,      y2,     x7-x6,      ry3-y2);
    self.rightArrowView.frame =         CGRectMake(x6,      ry3,    x8-x6,      ry5-ry3);
    self.lowerRightEdgeView.frame =     CGRectMake(x6,      ry5,    x7-x6,      y6-ry5);
    self.bottomRightCornerView.frame =  CGRectMake(x6,      y6,     x7-x6,      y7-y6);
    self.bottomRightEdgeView.frame =    CGRectMake(bx5,     y6,     x6-bx5,     y7-y6);
    self.bottomArrowView.frame =        CGRectMake(bx3,     y6,     bx5-bx3,    y8-y6);
    self.bottomLeftEdgeView.frame =     CGRectMake(x2,      y6,     bx3-x2,     y7-y6);
    self.bottomLeftCornerView.frame =   CGRectMake(x1,      y6,     x2-x1,      y7-y6);
    self.lowerLeftEdgeView.frame =      CGRectMake(x1,      ly5,    x2-x1,      y6-ly5);
    self.leftArrowView.frame =          CGRectMake(x0,      ly3,    x2-x0,      ly5-ly3);
    self.upperLeftEdgeView.frame =      CGRectMake(x1,      y2,     x2-x1,      ly3-y2);
}

- (void)didMoveToWindow
{
    if (self.window && _needsImageUpdate)
    {
        [self updateImagesIfNeeded];
    }
}

- (void)setNeedsImageUpdate
{
    _needsImageUpdate = YES;

    if (self.window)
    {
        [[NSRunLoop mainRunLoop] performSelector:@selector(updateImagesIfNeeded) target:self argument:nil order:0 modes:@[NSDefaultRunLoopMode]];
    }
}


- (void)updateImagesIfNeeded
{
    if (!_needsImageUpdate) return;
    _needsImageUpdate = NO;

    UIColor *tintColor = self.tintColor;
    if (!tintColor) tintColor = [UIColor colorWithRed:0 green:0.06 blue:0.18 alpha:1];
    
    UIColor *glowColor = self.glowColor;
    if (!glowColor) glowColor = [UIColor colorWithWhite:1 alpha:0.2];
    
    UIColor *borderColor = self.borderColor;
    if (!borderColor) borderColor = [UIColor colorWithWhite:0 alpha:1];
    
    CGFloat cornerRadius = self.cornerRadius;
    CGFloat highlightDepth = self.highlightDepth;
    CGFloat arrowHeight = [[self class] arrowHeight];
    CGFloat arrowBase = [[self class] arrowBase], arrowHalfBase = arrowBase/2;
    
    self.fillView.image = [self drawImageWithWidth:1 height:1 block:^(CGContextRef context) {
       
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
        
    }];
    
    self.topLeftCornerView.image = [self drawImageWithWidth:cornerRadius height:highlightDepth block:^(CGContextRef context) {
       
        // Create a colour space
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        // Draw the outer glow
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, 0);
        CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius, M_PI + M_PI_2, M_PI, 1);
        CGContextAddLineToPoint(context, 0, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, 0);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the border
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, 1);
        CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius - 1, M_PI + M_PI_2, M_PI, 1);
        CGContextAddLineToPoint(context, 1, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, 1);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the background
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, 2);
        CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius - 2, M_PI + M_PI_2, M_PI, 1);
        CGContextAddLineToPoint(context, 2, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, 2);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight fill
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, 2);
        CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius - 2, M_PI + M_PI_2, M_PI, 1);
        CGContextAddLineToPoint(context, 2, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, highlightDepth);
        CGContextAddLineToPoint(context, cornerRadius, 2);
        CGContextClip(context);
        
        size_t fillGradientNumberOfLocations = 2;
        CGFloat fillGradientLocations[2] = { 0.0, 1.0 };
        CGFloat fillGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
                                              1, 1, 1, 0.15 };  // End color
        
        CGGradientRef fillGradient = CGGradientCreateWithColorComponents (colorspace, fillGradientComponents, fillGradientLocations, fillGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, fillGradient, CGPointMake(0, 2), CGPointMake(0, highlightDepth), 0);
        CGGradientRelease(fillGradient);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight line
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, 2);
        CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius - 2, M_PI + M_PI_2, M_PI, 1);
        CGContextAddLineToPoint(context, 3, cornerRadius);
        CGContextAddArc(context, cornerRadius, cornerRadius, cornerRadius - 3, M_PI, M_PI + M_PI_2, 0);
        CGContextAddLineToPoint(context, cornerRadius, 2);
        CGContextClip(context);
        
        size_t lineGradientNumberOfLocations = 2;
        CGFloat lineGradientLocations[2] = { 0.0, 1.0 };
        CGFloat lineGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
                                              1, 1, 1, 0.0 };  // End color
        
        CGGradientRef lineGradient = CGGradientCreateWithColorComponents (colorspace, lineGradientComponents, lineGradientLocations, lineGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, lineGradient, CGPointMake(0, 2), CGPointMake(0, cornerRadius), 0);
        CGGradientRelease(lineGradient);
        
        CGContextRestoreGState(context);
        
        // Release the colour space
        
        CGColorSpaceRelease(colorspace);
        
    }];
    
    self.topLeftEdgeView.image = self.topRightEdgeView.image = [self drawImageWithWidth:1 height:highlightDepth block:^(CGContextRef context) {
        
        // Create a colour space
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        // Draw the outer glow
        
        CGContextSaveGState(context);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, 1, highlightDepth));
        
        CGContextRestoreGState(context);
        
        // Draw the border
        
        CGContextSaveGState(context);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 1, 1, highlightDepth - 1));
        
        CGContextRestoreGState(context);
        
        // Draw the background
        
        CGContextSaveGState(context);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 2, 1, highlightDepth - 2));
        
        CGContextRestoreGState(context);
        
        // Draw the highlight fill
        
        CGContextSaveGState(context);
        
        size_t fillGradientNumberOfLocations = 2;
        CGFloat fillGradientLocations[2] = { 0.0, 1.0 };
        CGFloat fillGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
            1, 1, 1, 0.15 };  // End color
        
        CGGradientRef fillGradient = CGGradientCreateWithColorComponents (colorspace, fillGradientComponents, fillGradientLocations, fillGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, fillGradient, CGPointMake(0, 2), CGPointMake(0, highlightDepth), 0);
        CGGradientRelease(fillGradient);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight line
        
        CGContextSaveGState(context);
        
        CGContextAddRect(context, CGRectMake(0, 2, 1, 1));
        CGContextClip(context);
        
        size_t lineGradientNumberOfLocations = 2;
        CGFloat lineGradientLocations[2] = { 0.0, 1.0 };
        CGFloat lineGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
            1, 1, 1, 0.0 };  // End color
        
        CGGradientRef lineGradient = CGGradientCreateWithColorComponents (colorspace, lineGradientComponents, lineGradientLocations, lineGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, lineGradient, CGPointMake(0, 2), CGPointMake(0, cornerRadius), 0);
        CGGradientRelease(lineGradient);
        
        CGContextRestoreGState(context);
        
        // Release the colour space
        
        CGColorSpaceRelease(colorspace);
        
    }];
    
    self.topArrowView.image = [self drawImageWithWidth:arrowBase height:arrowHeight + highlightDepth block:^(CGContextRef context) {
        
        // Create a colour space
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        // Draw the outer glow
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, arrowHeight);
        CGContextAddLineToPoint(context, arrowHalfBase, 0);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the border
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, arrowHeight + 1);
        CGContextAddLineToPoint(context, arrowHalfBase, 1);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + 1);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the background
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, arrowHeight + 2);
        CGContextAddLineToPoint(context, arrowHalfBase, 2);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + 2);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight fill
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, arrowHeight + 2);
        CGContextAddLineToPoint(context, arrowHalfBase, 2);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + 2);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight + highlightDepth);
        CGContextAddLineToPoint(context, 0, arrowHeight);
        CGContextClip(context);
        
        size_t fillGradientNumberOfLocations = 2;
        CGFloat fillGradientLocations[2] = { 0.0, 1.0 };
        CGFloat fillGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
            1, 1, 1, 0.15 };  // End color
        
        CGGradientRef fillGradient = CGGradientCreateWithColorComponents (colorspace, fillGradientComponents, fillGradientLocations, fillGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, fillGradient, CGPointMake(0, arrowHeight + 2), CGPointMake(0, arrowHeight + highlightDepth), kCGGradientDrawsBeforeStartLocation);
        CGGradientRelease(fillGradient);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight line
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, arrowHeight + 2);
        CGContextAddLineToPoint(context, arrowHalfBase, 2);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + 2);
        CGContextAddLineToPoint(context, arrowBase, arrowHeight + 3);
        CGContextAddLineToPoint(context, arrowHalfBase, 3);
        CGContextAddLineToPoint(context, 0, arrowHeight + 3);
        CGContextAddLineToPoint(context, 0, arrowHeight + 2);
        CGContextClip(context);
        
        size_t lineGradientNumberOfLocations = 2;
        CGFloat lineGradientLocations[2] = { 0.0, 1.0 };
        CGFloat lineGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
            1, 1, 1, 0.0 };  // End color
        
        CGGradientRef lineGradient = CGGradientCreateWithColorComponents (colorspace, lineGradientComponents, lineGradientLocations, lineGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, lineGradient, CGPointMake(0, arrowHeight + 2), CGPointMake(0, arrowHeight + cornerRadius), kCGGradientDrawsBeforeStartLocation);
        CGGradientRelease(lineGradient);
        
        CGContextRestoreGState(context);
        
        // Release the colour space
        
        CGColorSpaceRelease(colorspace);
        
    }];
    
    self.topRightCornerView.image = [self drawImageWithWidth:cornerRadius height:highlightDepth block:^(CGContextRef context) {
        
        // Create a colour space
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        
        // Draw the outer glow
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddArc(context, 0, cornerRadius, cornerRadius, M_PI + M_PI_2, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius, highlightDepth);
        CGContextAddLineToPoint(context, 0, highlightDepth);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the border
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, 1);
        CGContextAddArc(context, 0, cornerRadius, cornerRadius - 1, M_PI + M_PI_2, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 1, highlightDepth);
        CGContextAddLineToPoint(context, 0, highlightDepth);
        CGContextAddLineToPoint(context, 0, 1);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the background
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, 2);
        CGContextAddArc(context, 0, cornerRadius, cornerRadius - 2, M_PI + M_PI_2, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 2, highlightDepth);
        CGContextAddLineToPoint(context, 0, highlightDepth);
        CGContextAddLineToPoint(context, 0, 2);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight fill
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, 2);
        CGContextAddArc(context, 0, cornerRadius, cornerRadius - 2, M_PI + M_PI_2, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 2, highlightDepth);
        CGContextAddLineToPoint(context, 0, highlightDepth);
        CGContextAddLineToPoint(context, 0, 2);
        CGContextClip(context);
        
        size_t fillGradientNumberOfLocations = 2;
        CGFloat fillGradientLocations[2] = { 0.0, 1.0 };
        CGFloat fillGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
            1, 1, 1, 0.15 };  // End color
        
        CGGradientRef fillGradient = CGGradientCreateWithColorComponents (colorspace, fillGradientComponents, fillGradientLocations, fillGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, fillGradient, CGPointMake(0, 2), CGPointMake(0, highlightDepth), 0);
        CGGradientRelease(fillGradient);
        
        CGContextRestoreGState(context);
        
        // Draw the highlight line
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, 0, 2);
        CGContextAddArc(context, 0, cornerRadius, cornerRadius - 2, M_PI + M_PI_2, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 3, cornerRadius);
        CGContextAddArc(context, 0, cornerRadius, cornerRadius - 3, 0, M_PI + M_PI_2, 1);
        CGContextAddLineToPoint(context, 0, 2);
        CGContextClip(context);
        
        size_t lineGradientNumberOfLocations = 2;
        CGFloat lineGradientLocations[2] = { 0.0, 1.0 };
        CGFloat lineGradientComponents[8] = { 1, 1, 1, 0.5,     // Start color
            1, 1, 1, 0.0 };  // End color
        
        CGGradientRef lineGradient = CGGradientCreateWithColorComponents (colorspace, lineGradientComponents, lineGradientLocations, lineGradientNumberOfLocations);
        CGContextDrawLinearGradient(context, lineGradient, CGPointMake(0, 2), CGPointMake(0, cornerRadius), 0);
        CGGradientRelease(lineGradient);
        
        CGContextRestoreGState(context);
        
        // Release the colour space
        
        CGColorSpaceRelease(colorspace);
        
    }];
    
    self.upperRightEdgeView.image = self.lowerRightEdgeView.image = [self drawImageWithWidth:cornerRadius height:1 block:^(CGContextRef context) {
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, cornerRadius, 1));
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, cornerRadius - 1, 1));
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, cornerRadius - 2, 1));
        
    }];
    
    self.rightArrowView.image = [self drawImageWithWidth:cornerRadius + arrowHeight height:arrowBase block:^(CGContextRef context) {
        
        // Draw the outer glow
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius, 0);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, arrowHalfBase);
        CGContextAddLineToPoint(context, cornerRadius, arrowBase);
        CGContextAddLineToPoint(context, 0, arrowBase);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        // Draw the border
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 1, 0);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight - 1, arrowHalfBase);
        CGContextAddLineToPoint(context, cornerRadius - 1, arrowBase);
        CGContextAddLineToPoint(context, 0, arrowBase);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        // Draw the background
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 2, 0);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight - 2, arrowHalfBase);
        CGContextAddLineToPoint(context, cornerRadius - 2, arrowBase);
        CGContextAddLineToPoint(context, 0, arrowBase);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
    }];
    
    self.bottomRightCornerView.image = [self drawImageWithWidth:cornerRadius height:cornerRadius block:^(CGContextRef context) {
       
        // Draw the outer glow
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, 0);
        CGContextAddArc(context, 0, 0, cornerRadius, 0, M_PI_2, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius, 0);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the border
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius - 1, 0);
        CGContextAddArc(context, 0, 0, cornerRadius - 1, 0, M_PI_2, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 1, 0);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the background
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius - 2, 0);
        CGContextAddArc(context, 0, 0, cornerRadius - 2, 0, M_PI_2, 0);
        CGContextAddLineToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, cornerRadius - 2, 0);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
    }];
    
    self.bottomRightEdgeView.image = self.bottomLeftEdgeView.image = [self drawImageWithWidth:1 height:cornerRadius block:^(CGContextRef context) {
       
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, 1, cornerRadius));
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, 1, cornerRadius - 1));
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, 1, cornerRadius - 2));
        
    }];
    
    self.bottomArrowView.image = [self drawImageWithWidth:arrowBase height:cornerRadius + arrowHeight block:^(CGContextRef context) {
        
        // Draw the outer glow
        
        CGContextMoveToPoint(context, 0, 0);
        CGContextAddLineToPoint(context, arrowBase, 0);
        CGContextAddLineToPoint(context, arrowBase, cornerRadius);
        CGContextAddLineToPoint(context, arrowHalfBase, cornerRadius + arrowHeight);
        CGContextAddLineToPoint(context, 0, cornerRadius);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        // Draw the border
        
        CGContextMoveToPoint(context, cornerRadius + arrowHeight, 0);
        CGContextAddLineToPoint(context, arrowBase, 0);
        CGContextAddLineToPoint(context, arrowBase, cornerRadius - 1);
        CGContextAddLineToPoint(context, arrowHalfBase, cornerRadius + arrowHeight - 1);
        CGContextAddLineToPoint(context, 0, cornerRadius - 1);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        // Draw the background
        
        CGContextMoveToPoint(context, cornerRadius + arrowHeight, 0);
        CGContextAddLineToPoint(context, arrowBase, 0);
        CGContextAddLineToPoint(context, arrowBase, cornerRadius - 2);
        CGContextAddLineToPoint(context, arrowHalfBase, cornerRadius + arrowHeight - 2);
        CGContextAddLineToPoint(context, 0, cornerRadius - 2);
        CGContextAddLineToPoint(context, 0, 0);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
    }];
    
    self.bottomLeftCornerView.image = [self drawImageWithWidth:cornerRadius height:cornerRadius block:^(CGContextRef context) {
        
        // Draw the outer glow
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, cornerRadius);
        CGContextAddArc(context, cornerRadius, 0, cornerRadius, M_PI_2, M_PI, 0);
        CGContextAddLineToPoint(context, cornerRadius, 0);
        CGContextAddLineToPoint(context, cornerRadius, cornerRadius);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the border
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, cornerRadius - 1);
        CGContextAddArc(context, cornerRadius, 0, cornerRadius - 1, M_PI_2, M_PI, 0);
        CGContextAddLineToPoint(context, cornerRadius, 0);
        CGContextAddLineToPoint(context, cornerRadius, cornerRadius - 1);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
        // Draw the background
        
        CGContextSaveGState(context);
        
        CGContextMoveToPoint(context, cornerRadius, cornerRadius - 2);
        CGContextAddArc(context, cornerRadius, 0, cornerRadius - 2, M_PI_2, M_PI, 0);
        CGContextAddLineToPoint(context, cornerRadius, 0);
        CGContextAddLineToPoint(context, cornerRadius, cornerRadius - 2);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
        CGContextRestoreGState(context);
        
    }];
    
    self.upperLeftEdgeView.image = self.lowerLeftEdgeView.image = [self drawImageWithWidth:cornerRadius height:1 block:^(CGContextRef context) {
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillRect(context, CGRectMake(0, 0, cornerRadius, 1));
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillRect(context, CGRectMake(1, 0, cornerRadius - 1, 1));
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillRect(context, CGRectMake(2, 0, cornerRadius - 2, 1));
        
    }];
    
    self.leftArrowView.image = [self drawImageWithWidth:cornerRadius + arrowHeight height:arrowBase block:^(CGContextRef context) {
        
        // Draw the outer glow
        
        CGContextMoveToPoint(context, cornerRadius + arrowHeight, 0);
        CGContextAddLineToPoint(context, arrowHeight, 0);
        CGContextAddLineToPoint(context, 0, arrowHalfBase);
        CGContextAddLineToPoint(context, arrowHeight, arrowBase);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, arrowBase);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, 0);
        
        CGContextSetFillColorWithColor(context, glowColor.CGColor);
        CGContextFillPath(context);
        
        // Draw the border
        
        CGContextMoveToPoint(context, cornerRadius + arrowHeight, 0);
        CGContextAddLineToPoint(context, arrowHeight + 1, 0);
        CGContextAddLineToPoint(context, 1, arrowHalfBase);
        CGContextAddLineToPoint(context, arrowHeight + 1, arrowBase);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, arrowBase);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, 0);
        
        CGContextSetFillColorWithColor(context, borderColor.CGColor);
        CGContextFillPath(context);
        
        // Draw the background
        
        CGContextMoveToPoint(context, cornerRadius + arrowHeight, 0);
        CGContextAddLineToPoint(context, arrowHeight + 2, 0);
        CGContextAddLineToPoint(context, 2, arrowHalfBase);
        CGContextAddLineToPoint(context, arrowHeight + 2, arrowBase);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, arrowBase);
        CGContextAddLineToPoint(context, cornerRadius + arrowHeight, 0);
        
        CGContextSetFillColorWithColor(context, tintColor.CGColor);
        CGContextFillPath(context);
        
    }];
    
}

- (UIImage *)drawImageWithWidth:(CGFloat)width height:(CGFloat)height block:(void(^)(CGContextRef context))block
{
    CGSize size = CGSizeMake(width, height);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (block) block(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end

//
// C360DemoContentController.m
// 
// Created on 2013-05-08 using NibFree
// 

#import "C360DemoContentController.h"
#import "C360DemoContentView.h"

@interface C360DemoContentController () <C360DemoContentViewDelegate>

@property (nonatomic, strong, readonly) C360DemoContentView *contentView;

@end

@implementation C360DemoContentController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"Popover";
        self.contentSizeForViewInPopover = CGSizeMake(512, 512);
    }
    return self;
}

- (void)loadView
{
    self.view = [[C360DemoContentView  alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.contentView.delegate = self;
}

- (C360DemoContentView *)contentView
{
    return (C360DemoContentView *)self.view;
}

- (void)contentView:(C360DemoContentView *)contentView horizontalGrowButtonTapped:(id)sender
{
    CGSize size = self.contentSizeForViewInPopover;
    if (size.width < 896) size.width += 256;
    self.contentSizeForViewInPopover = size;
}

- (void)contentView:(C360DemoContentView *)contentView horizontalShrinkButtonTapped:(id)sender
{
    CGSize size = self.contentSizeForViewInPopover;
    if (size.width > 384) size.width -= 256;
    self.contentSizeForViewInPopover = size;
}

- (void)contentView:(C360DemoContentView *)contentView verticalGrowButtonTapped:(id)sender
{
    CGSize size = self.contentSizeForViewInPopover;
    if (size.height < 896) size.height += 256;
    self.contentSizeForViewInPopover = size;
}

- (void)contentView:(C360DemoContentView *)contentView verticalShrinkButtonTapped:(id)sender
{
    CGSize size = self.contentSizeForViewInPopover;
    if (size.height > 384) size.height -= 256;
    self.contentSizeForViewInPopover = size;
}

@end


//
// C360DemoController.m
// 
// Created on 2013-05-08 using NibFree
// 

#import "C360PopoverBackgroundView.h"
#import "C360DemoController.h"
#import "C360DemoContentController.h"
#import "C360DemoView.h"

@interface C360DemoController () <C360DemoViewDataSource, C360DemoViewDelegate>

@property (nonatomic, strong, readonly) C360DemoView *demoView;

@property (nonatomic, assign) BOOL isDefaultColor;
@property (nonatomic, strong) UIColor *currentColor;

@property (nonatomic, strong) UIPopoverController *presentedPopoverController;
@property (nonatomic, assign) BOOL navigationBarShown;

@end

@implementation C360DemoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = @"C360PopoverBackgroundController Demo";
        self.isDefaultColor = YES;
        self.navigationBarShown = YES;
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Show!" style:UIBarButtonItemStyleBordered target:self action:@selector(showPopoverFromBarButtonItem:)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Show!" style:UIBarButtonItemStyleBordered target:self action:@selector(showPopoverFromBarButtonItem:)];
        
        self.toolbarItems = @[
            [[UIBarButtonItem alloc] initWithTitle:@"Show!" style:UIBarButtonItemStyleBordered target:self action:@selector(showPopoverFromBarButtonItem:)],
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
            [[UIBarButtonItem alloc] initWithTitle:@"Show!" style:UIBarButtonItemStyleBordered target:self action:@selector(showPopoverFromBarButtonItem:)],
            [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
            [[UIBarButtonItem alloc] initWithTitle:@"Show!" style:UIBarButtonItemStyleBordered target:self action:@selector(showPopoverFromBarButtonItem:)]
        ];
    }
    return self;
}

- (void)loadView
{
    self.view = [[C360DemoView  alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.demoView.dataSource = self;
    self.demoView.delegate = self;
    [self.demoView reloadData];
}

#pragma mark - Demo view

- (C360DemoView *)demoView
{
    return (C360DemoView *)self.view;
}

- (BOOL)demoViewIsDefaultColor:(C360DemoView *)demoView
{
    return self.isDefaultColor;
}

- (void)demoView:(C360DemoView *)demoView didChangeIsDefaultColor:(BOOL)isDefaultColor
{
    self.isDefaultColor = isDefaultColor;
    
    if (isDefaultColor) [[C360PopoverBackgroundView appearance] setTintColor:nil];
    else [[C360PopoverBackgroundView appearance] setTintColor:self.currentColor];
}

- (UIColor *)demoViewCurrentColor:(C360DemoView *)demoView
{
    return self.currentColor;
}

- (void)demoView:(C360DemoView *)demoView didChangeColor:(UIColor *)color
{
    self.currentColor = color;
    if (!self.isDefaultColor) [[C360PopoverBackgroundView appearance] setTintColor:color];
}

- (BOOL)demoViewNavigationBarShown:(C360DemoView *)demoView
{
    return self.navigationBarShown;
}

- (void)demoView:(C360DemoView *)demoView didChangeNavigationBarShown:(BOOL)shown
{
    self.navigationBarShown = shown;
}

- (void)demoView:(C360DemoView *)demoView buttonTapped:(id)sender
{
    [self showPopoverFromView:sender];
}

#pragma mark - Popover

- (void)createPopoverController
{
    UIViewController *contentController = [[C360DemoContentController alloc] init];
    
    if (self.navigationBarShown)
    {
        contentController = [[UINavigationController alloc] initWithRootViewController:contentController];
    }
    
    self.presentedPopoverController = [[UIPopoverController alloc] initWithContentViewController:contentController];
    self.presentedPopoverController.popoverBackgroundViewClass = [C360PopoverBackgroundView class];
}

- (void)showPopoverFromBarButtonItem:(UIBarButtonItem *)sender
{
    [self.presentedPopoverController dismissPopoverAnimated:YES];
    [self createPopoverController];
    [self.presentedPopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)showPopoverFromView:(UIView *)sender
{
    [self.presentedPopoverController dismissPopoverAnimated:YES];
    [self createPopoverController];
    [self.presentedPopoverController presentPopoverFromRect:sender.frame inView:sender.superview permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end


//
// C360DemoView.m
// 
// Created on 2013-05-08 using NibFree
// 

#import "C360DemoView.h"

@interface C360DemoView ()

@property (nonatomic, strong) UIColor *currentColor;

@property (nonatomic, strong, readonly) UILabel *defaultLabel;
@property (nonatomic, strong, readonly) UISwitch *defaultSwitch;
@property (nonatomic, strong, readonly) UILabel *redLabel;
@property (nonatomic, strong, readonly) UISlider *redSlider;
@property (nonatomic, strong, readonly) UILabel *greenLabel;
@property (nonatomic, strong, readonly) UISlider *greenSlider;
@property (nonatomic, strong, readonly) UILabel *blueLabel;
@property (nonatomic, strong, readonly) UISlider *blueSlider;
@property (nonatomic, strong, readonly) UILabel *navigationLabel;
@property (nonatomic, strong, readonly) UISwitch *navigationSwitch;
@property (nonatomic, strong, readonly) UIButton *topButton;
@property (nonatomic, strong, readonly) UIButton *leftButton;
@property (nonatomic, strong, readonly) UIButton *rightButton;
@property (nonatomic, strong, readonly) UIButton *bottomButton;

@end

@implementation C360DemoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.opaque = YES;
        self.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
        
        UIViewAutoresizing autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
        
        _defaultLabel = [[UILabel alloc] init];
        _defaultLabel.autoresizingMask = autoresizingMask;
        _defaultLabel.backgroundColor = [UIColor clearColor];
        _defaultLabel.font = [UIFont boldSystemFontOfSize:22];
        _defaultLabel.shadowColor = [UIColor lightGrayColor];
        _defaultLabel.shadowOffset = CGSizeMake(0, 1);
        _defaultLabel.textColor = [UIColor blackColor];
        _defaultLabel.text = @"Default:";
        [self addSubview:_defaultLabel];
        
        _defaultSwitch = [[UISwitch alloc] init];
        _defaultSwitch.autoresizingMask = autoresizingMask;
        [_defaultSwitch addTarget:self action:@selector(defaultSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_defaultSwitch];
        
        _navigationLabel = [[UILabel alloc] init];
        _navigationLabel.autoresizingMask = autoresizingMask;
        _navigationLabel.backgroundColor = [UIColor clearColor];
        _navigationLabel.font = [UIFont boldSystemFontOfSize:22];
        _navigationLabel.shadowColor = [UIColor lightGrayColor];
        _navigationLabel.shadowOffset = CGSizeMake(0, 1);
        _navigationLabel.textColor = [UIColor blackColor];
        _navigationLabel.text = @"Navigation:";
        [self addSubview:_navigationLabel];
        
        _navigationSwitch = [[UISwitch alloc] init];
        _navigationSwitch.autoresizingMask = autoresizingMask;
        [_navigationSwitch addTarget:self action:@selector(navigationSwitchChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_navigationSwitch];
        
        _redLabel = [[UILabel alloc] init];
        _redLabel.autoresizingMask = autoresizingMask;
        _redLabel.backgroundColor = [UIColor clearColor];
        _redLabel.font = [UIFont boldSystemFontOfSize:22];
        _redLabel.shadowColor = [UIColor lightGrayColor];
        _redLabel.shadowOffset = CGSizeMake(0, 1);
        _redLabel.text = @"Red:";
        _redLabel.textColor = [UIColor blackColor];
        [self addSubview:_redLabel];
        
        _redSlider = [[UISlider alloc] init];
        _redSlider.autoresizingMask = autoresizingMask;
        [_redSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_redSlider];
        
        _greenLabel = [[UILabel alloc] init];
        _greenLabel.autoresizingMask = autoresizingMask;
        _greenLabel.backgroundColor = [UIColor clearColor];
        _greenLabel.font = [UIFont boldSystemFontOfSize:22];
        _greenLabel.shadowColor = [UIColor lightGrayColor];
        _greenLabel.shadowOffset = CGSizeMake(0, 1);
        _greenLabel.text = @"Green:";
        _greenLabel.textColor = [UIColor blackColor];
        [self addSubview:_greenLabel];
        
        _greenSlider = [[UISlider alloc] init];
        _greenSlider.autoresizingMask = autoresizingMask;
        [_greenSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_greenSlider];
        
        _blueLabel = [[UILabel alloc] init];
        _blueLabel.autoresizingMask = autoresizingMask;
        _blueLabel.backgroundColor = [UIColor clearColor];
        _blueLabel.font = [UIFont boldSystemFontOfSize:22];
        _blueLabel.shadowColor = [UIColor lightGrayColor];
        _blueLabel.shadowOffset = CGSizeMake(0, 1);
        _blueLabel.textColor = [UIColor blackColor];
        _blueLabel.text = @"Blue:";
        [self addSubview:_blueLabel];
        
        _blueSlider = [[UISlider alloc] init];
        _blueSlider.autoresizingMask = autoresizingMask;
        [_blueSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_blueSlider];
        
        _topButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_topButton setTitle:@"Show!" forState:UIControlStateNormal];
        [_topButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_topButton];
        
        _leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_leftButton setTitle:@"Show!" forState:UIControlStateNormal];
        [_leftButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftButton];
        
        _rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_rightButton setTitle:@"Show!" forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightButton];
        
        _bottomButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [_bottomButton setTitle:@"Show!" forState:UIControlStateNormal];
        [_bottomButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_bottomButton];
    }
    return self;
}

- (void)layoutSubviews
{
    CGFloat width = self.bounds.size.width, height = self.bounds.size.height;
    CGFloat top = height/2 - 88;
    
    self.defaultLabel.frame = CGRectMake(width/2 - 220, top, 100, 27);
    self.defaultSwitch.frame = CGRectMake(width/2 - 120, top, 79, 27);
    
    self.navigationLabel.frame = CGRectMake(width/2 + 5, top, 136, 27);
    self.navigationSwitch.frame = CGRectMake(width/2 + 141, top, 79, 27);
    
    top += 44;
    self.redLabel.frame = CGRectMake(width/2 - 220, top, 80, 27);
    self.redSlider.frame = CGRectMake(width/2 - 120, top, 340, 27);
    
    top += 44;
    self.greenLabel.frame = CGRectMake(width/2 - 220, top, 80, 27);
    self.greenSlider.frame = CGRectMake(width/2 - 120, top, 340, 27);
    
    top += 44;
    self.blueLabel.frame = CGRectMake(width/2 - 220, top, 80, 27);
    self.blueSlider.frame = CGRectMake(width/2 - 120, top, 340, 27);
    
    self.topButton.frame = CGRectMake(width/2 - 55, 44, 110, 44);
    self.leftButton.frame = CGRectMake(44, height/2 - 22, 110, 44);
    self.rightButton.frame = CGRectMake(width - 154, height/2 - 22, 110, 44);
    self.bottomButton.frame = CGRectMake(width/2 - 55, height - 88, 110, 44);
}

- (void)reloadData
{
    self.navigationSwitch.on = [self.dataSource demoViewNavigationBarShown:self];
    
    BOOL isDefault = [self.dataSource demoViewIsDefaultColor:self];
    self.defaultSwitch.on = isDefault;
    
    if (isDefault)
    {
        self.redSlider.enabled = self.greenSlider.enabled = self.blueSlider.enabled = NO;
    }
    else
    {
        self.redSlider.enabled = self.greenSlider.enabled = self.blueSlider.enabled = YES;
        
        UIColor *color = [self.dataSource demoViewCurrentColor:self];
        CGFloat red = 0, green = 0, blue = 0;
        
        if (![color getRed:&red green:&green blue:&blue alpha:nil])
        {
            // greyscale colour
            [color getWhite:&red alpha:nil];
            green = blue = red;
        }
        
        self.redSlider.value = red;
        self.greenSlider.value = green;
        self.blueSlider.value = blue;
    }
    
    [self updateSliderColors];
}

- (void)updateSliderColors
{
    CGFloat red = self.redSlider.value;
    CGFloat green = self.greenSlider.value;
    CGFloat blue = self.blueSlider.value;
    
    self.redSlider.minimumTrackTintColor = [UIColor colorWithRed:red/2 green:green blue:blue alpha:1];
    self.redSlider.maximumTrackTintColor = [UIColor colorWithRed:1-((1-red)/2) green:green blue:blue alpha:1];
    
    self.greenSlider.minimumTrackTintColor = [UIColor colorWithRed:red green:green/2 blue:blue alpha:1];
    self.greenSlider.maximumTrackTintColor = [UIColor colorWithRed:red green:1-((1-green)/2) blue:blue alpha:1];
    
    self.blueSlider.minimumTrackTintColor = [UIColor colorWithRed:red green:green blue:blue/2 alpha:1];
    self.blueSlider.maximumTrackTintColor = [UIColor colorWithRed:red green:green blue:1-((1-blue)/2) alpha:1];
    
    self.defaultSwitch.onTintColor = self.navigationSwitch.onTintColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

- (void)defaultSwitchChanged:(id)sender
{
    [self.delegate demoView:self didChangeIsDefaultColor:self.defaultSwitch.on];
    [self reloadData];
}

- (void)navigationSwitchChanged:(id)sender
{
    [self.delegate demoView:self didChangeNavigationBarShown:self.navigationSwitch.on];
    [self reloadData];
}

- (void)sliderChanged:(id)sender
{
    CGFloat red = self.redSlider.value, green = self.greenSlider.value, blue = self.blueSlider.value;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    [self.delegate demoView:self didChangeColor:color];
    [self updateSliderColors];
}

- (void)buttonTapped:(id)sender
{
    [self.delegate demoView:self buttonTapped:sender];
}

@end


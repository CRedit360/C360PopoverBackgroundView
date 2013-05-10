C360PopoverBackgroundView
=========================

C360PopoverBackgroundView is a tintable UIPopoverBackgroundView subclass which mimics the system popover appearance.

To use C360PopoverBackgroundView in your project, add this line to your podfile:

```ruby
pod 'C360PopoverBackgroundView', '~> 1.0.0'
```

and then run: 

```sh
$ pod install
```

for more information about pods and podfiles, visit the [CocoaPods](http://cocoapods.org) website.

Once C360PopoverBackgroundView is installed, you can use it wherever you create a UIPopoverController by setting the popoverBackgroundViewClass property, like so:

```ObjC
#import "C360PopoverBackgroundView.h"

- (void)myExampleMethod
{   
    UIViewController *contentController [[UIViewController alloc] init];
    UIPopoverController *popoverController = [[UIPopoverController alloc] initWithContentViewController:contentController];
    popoverController.popoverBackgroundViewClass = [C360PopoverBackgroundView class];
    
    ...

```

To change the tint, use the appearance delegate for the class:

```ObjC
#import "C360PopoverBackgroundView.h"

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[C360PopoverBackgroundView appearance] setTintColor:[UIColor greenColor]];
    
    ...

```

or you can use [UISS](https://github.com/robertwijas/UISS):

```JSON
{
    "C360PopoverBackgroundView" : {
        "tintColor" : "green"
    },

    ...
```

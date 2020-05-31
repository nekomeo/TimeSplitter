//
//  TimerViewController.m
//  SplitTimer
//
//  Created by Elle Ti on 2020-05-24.
//  Copyright © 2020 Elle Ti. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"Timer"];
     [navbar setBarTintColor:[UIColor lightGrayColor]];
    
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                               target:self
                                                                               action:@selector(onTapCancel:)];
    navItem.leftBarButtonItem = cancelBtn;
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause
                                                                              target:self
                                                                              action:@selector(onTapStop:)];
    navItem.rightBarButtonItem = rightBtn;
    
//    UIBarButtonItem* doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onTapDone:)];
//    navItem.rightBarButtonItem = doneBtn;
    
    [navbar setItems:@[navItem]];
    [self.view addSubview:navbar];
    [self displayBoxViewProperties];
    [self tableBoxViewProperties];
}

- (void)displayBoxViewProperties
{
    UIView *mainDisplayView = [[UIView alloc] initWithFrame:CGRectZero];
    mainDisplayView.translatesAutoresizingMaskIntoConstraints = NO;
    mainDisplayView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:mainDisplayView];
    
    NSLayoutConstraint *displayViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:mainDisplayView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    
    NSLayoutConstraint *displayViewTopConstraint = [NSLayoutConstraint constraintWithItem:mainDisplayView
                                                                                attribute:NSLayoutAttributeTop
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeTop
                                                                               multiplier:1.0
                                                                                 constant:50.0];
    
    NSLayoutConstraint *displayViewHeightConstraint = [NSLayoutConstraint constraintWithItem:mainDisplayView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:self.view.frame.size.height * 0.65];
    
    NSLayoutConstraint *displayViewWidthConstraint = [NSLayoutConstraint constraintWithItem:mainDisplayView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:self.view.frame.size.width];
    
    [NSLayoutConstraint activateConstraints:@[displayViewCenterXConstraint, displayViewTopConstraint, displayViewHeightConstraint, displayViewWidthConstraint]];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)onTapCancel:(UIBarButtonItem*)item{
    NSLog(@"Cancel button pushed");
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)onTapStop:(UIBarButtonItem*)item{
    NSLog(@"Stop button pushed");
}

- (void)tableBoxViewProperties
{
    self.lapTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.lapTableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.lapTableView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.lapTableView];
    
    NSLayoutConstraint *tableViewCenterXConstraint = [NSLayoutConstraint constraintWithItem:self.lapTableView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.view
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];
    
    NSLayoutConstraint *tableViewTopConstraint = [NSLayoutConstraint constraintWithItem:self.lapTableView
                                                                                attribute:NSLayoutAttributeBottom
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeBottom
                                                                               multiplier:1.0
                                                                                 constant:0.0];

    
    NSLayoutConstraint *tableViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self.lapTableView
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:self.view.frame.size.height * 0.30];
    
    NSLayoutConstraint *tableViewWidthConstraint = [NSLayoutConstraint constraintWithItem:self.lapTableView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:self.view.frame.size.width];
    
    [NSLayoutConstraint activateConstraints:@[tableViewCenterXConstraint, tableViewTopConstraint, tableViewHeightConstraint, tableViewWidthConstraint]];
}

@end

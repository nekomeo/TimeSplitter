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
    
    //    running = NO;
    //    timeInSeconds = 0;
    //    timerLabel.text = @"00:00.00";
    //    lapTimes = @[@"0:00.34", @"0:02.45"];
    
    //    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
    //                                                                              action:@selector(tap:)];
    //    gesture.delegate = self;
    //    [self tap:gesture];
    
    /* From startBtnPushed r*/
    //    if (running == NO) {
    //        running = YES;
    //        [startButton setTitle:@"Stop" forState:UIControlStateNormal];
    //
    //        if (timer == nil) {
    //            timer = [NSTimer scheduledTimerWithTimeInterval:0.01
    //                                                     target:self
    //                                                   selector:@selector(timerTicking)
    //                                                   userInfo:nil
    //                                                    repeats:YES];
    //        }
    //    } else {
    //        [self stopTimer];
    //    }
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

- (void)stopBtnPushed:(id)sender {
    running = NO;
    [timer invalidate];
    timer = nil;
}

- (void)splitTimeBtnPushed:(id)sender {
    //    NSLog(@"Split button pushed");
    
}
- (void)resetBtnPushed:(id)sender {
    //    NSLog(@"Reset button pushed");
    [self resetTimer];
}

- (void)timerTicking {
    //    timeInSeconds++;
    //
    //    int min = floor(timeInSeconds / 100 / 60);
    //    int sec = floor(timeInSeconds / 100);
    //    int mSec = timeInSeconds % 100;
    //
    //    if (sec >= 60) {
    //        sec = sec % 60;
    //    }
    
    //    timerLabel.text = [NSString stringWithFormat:@"%02d:%02d.%02d", min, sec, mSec];
}

- (void)stopTimer {
    //    running = NO;
    //    [timer invalidate];
    //    timer = nil;
    //    [startButton setTitle:@"Start" forState:UIControlStateNormal];
}

- (void)resetTimer {
    //    [self stopTimer];
    //    timer = 0;
    //    timerLabel.text = @"00:00.00";
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

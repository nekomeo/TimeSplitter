//
//  ViewController.m
//  SplitTimer
//
//  Created by Elle Ti on 2020-03-28.
//  Copyright © 2020 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//@synthesize timerLabel, startButton, resetButton, lapTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tblView = [[UITableView alloc]initWithFrame:self.displayView.frame];
    [self.displayView addSubview:tblView];
    self.recordstableView.delegate = self;
    self.recordstableView.dataSource = self;

    
    // Set up your views and constraints here
    [self levelTitleBoxProperties];
    [self displayBoxViewProperties];
    [self tableViewBoxProperties];

    
//    running = NO;
//    timeInSeconds = 0;
//    timerLabel.text = @"00:00.00";
//    lapTimes = @[@"0:00.34", @"0:02.45"];
    
//    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                              action:@selector(tap:)];
//    gesture.delegate = self;
//    [self tap:gesture];
}

- (void)startBtnPushed:(id)sender {
    NSLog(@"Start button pushed");
    TimerViewController *timerVC = [[TimerViewController alloc] init];
    [self presentViewController:timerVC animated:YES completion:nil];
    
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

- (void)splitTimeBtnPushed:(id)sender {
//    NSLog(@"Split button pushed");
    
}

- (void)stopBtnPushed:(id)sender {
    running = NO;
    [timer invalidate];
    timer = nil;
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

- (void)tap:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"Tapped");
}

- (void)levelTitleBoxProperties
{
    UIView *levelTitle = [[UIView alloc] initWithFrame:CGRectZero];
    levelTitle.translatesAutoresizingMaskIntoConstraints = NO;
    levelTitle.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:levelTitle];
    self.levelTitleView = levelTitle;
    
    NSLayoutConstraint *levelTitleCenterXConstraint = [NSLayoutConstraint constraintWithItem:levelTitle
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.view
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier:1.0
                                                                           constant:0.0];
    
    NSLayoutConstraint *levelTitleTopConstraint = [NSLayoutConstraint constraintWithItem:levelTitle
                                                                        attribute:NSLayoutAttributeTop
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.view
                                                                        attribute:NSLayoutAttributeTop
                                                                       multiplier:1.0
                                                                         constant:20.0];
    
    NSLayoutConstraint *levelTitleWidthConstraint = [NSLayoutConstraint constraintWithItem:levelTitle
                                                                          attribute:NSLayoutAttributeWidth
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:nil
                                                                          attribute:NSLayoutAttributeNotAnAttribute
                                                                         multiplier:1.0
                                                                           constant:self.view.frame.size.width];
    
    NSLayoutConstraint *levelTitleHeightConstraint = [NSLayoutConstraint constraintWithItem:levelTitle
                                                                           attribute:NSLayoutAttributeHeight
                                                                           relatedBy:NSLayoutRelationEqual
                                                                              toItem:nil
                                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                                          multiplier:1.0
                                                                            constant:40.0];
    
    [NSLayoutConstraint activateConstraints:@[levelTitleCenterXConstraint, levelTitleTopConstraint, levelTitleWidthConstraint, levelTitleHeightConstraint]];
}

- (void)displayBoxViewProperties
{
    UIView *mainDisplayView = [[UIView alloc] initWithFrame:CGRectZero];
    mainDisplayView.translatesAutoresizingMaskIntoConstraints = NO;
    mainDisplayView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:mainDisplayView];
    self.displayView = mainDisplayView;
    
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
                                                                                    constant:self.view.frame.size.height * 0.70];

    NSLayoutConstraint *displayViewWidthConstraint = [NSLayoutConstraint constraintWithItem:mainDisplayView
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:self.view.frame.size.width];

    [NSLayoutConstraint activateConstraints:@[displayViewCenterXConstraint, displayViewTopConstraint, displayViewHeightConstraint, displayViewWidthConstraint]];
    
    [self buttonProperties];
}

- (void)tableViewBoxProperties
{
    self.recordstableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.recordstableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.recordstableView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:self.recordstableView];

    NSLayoutConstraint *tableViewBoxTopConstraint = [NSLayoutConstraint constraintWithItem:self.recordstableView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.displayView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1.0
                                                                              constant:0.0];

    NSLayoutConstraint *tableViewBoxBottomConstraint = [NSLayoutConstraint constraintWithItem:self.recordstableView
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.0
                                                                               constant:0.0];

    NSLayoutConstraint *tableViewBoxWidthConstraint = [NSLayoutConstraint constraintWithItem:self.recordstableView
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeWidth
                                                                            multiplier:1.0
                                                                              constant:self.view.frame.size.width];

    NSLayoutConstraint *tableViewBoxHeightConstraint = [NSLayoutConstraint constraintWithItem:self.recordstableView
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:self.view.frame.size.height * 0.30];

    [NSLayoutConstraint activateConstraints:@[tableViewBoxTopConstraint, tableViewBoxBottomConstraint, tableViewBoxWidthConstraint, tableViewBoxHeightConstraint]];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return lapTimes.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";

    UITableViewCell *cell = [self.recordstableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    self.timeLabel.text =  [lapTimes objectAtIndex:indexPath.row];
    return cell;
}

- (void)buttonProperties
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [button setTitle:@"Start" forState:UIControlStateNormal];
    [button sizeToFit];
    button.center = CGPointMake(self.displayView.frame.origin.x/2, self.displayView.frame.origin.y/2);
    [button addTarget:self action:@selector(startBtnPushed:) forControlEvents:UIControlEventTouchUpInside];
    [self.displayView addSubview:button];
    
    NSLayoutConstraint *buttonCenterXConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                    relatedBy:NSLayoutRelationEqual
                                                                                       toItem:self.displayView
                                                                                    attribute:NSLayoutAttributeCenterX
                                                                                   multiplier:1.0
                                                                                     constant:0.0];

    NSLayoutConstraint *buttonCenterYConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.displayView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:-20.0];

    NSLayoutConstraint *buttonHeightConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                                   attribute:NSLayoutAttributeHeight
                                                                                   relatedBy:NSLayoutRelationEqual
                                                                                      toItem:nil
                                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                                  multiplier:1.0
                                                                                    constant:self.view.frame.size.height];

    NSLayoutConstraint *buttonWidthConstraint = [NSLayoutConstraint constraintWithItem:button
                                                                                  attribute:NSLayoutAttributeWidth
                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                     toItem:nil
                                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                                 multiplier:1.0
                                                                                   constant:self.view.frame.size.width];

    [NSLayoutConstraint activateConstraints:@[buttonCenterXConstraint, buttonCenterYConstraint, buttonHeightConstraint, buttonWidthConstraint]];
}

@end

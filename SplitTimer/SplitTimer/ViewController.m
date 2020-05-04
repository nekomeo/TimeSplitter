//
//  ViewController.m
//  SplitTimer
//
//  Created by Elle Ti on 2020-03-28.
//  Copyright © 2020 Elle Ti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController
//@synthesize timerLabel, startButton, resetButton, lapTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    
    NSString *buttonsHorizontalConstraintsFormat = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    NSArray *buttonsHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraintsFormat
                                                                   options:NSLayoutFormatAlignAllCenterY
                                                                    metrics:nil
                                                                    views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)];
    [NSLayoutConstraint activateConstraints:buttonsHorizontalConstraints];
    
    NSLayoutConstraint *squareButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0];
    squareButtonBottomConstraint.active = YES;
    
    UITableView *tblView = [[UITableView alloc]initWithFrame:self.displayView.frame];
    [self.displayView addSubview:tblView];
    tblView.delegate = self;
    tblView.dataSource = self;

    
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
    UIView *tableViewBox = [[UIView alloc] initWithFrame:CGRectZero];
    tableViewBox.translatesAutoresizingMaskIntoConstraints = NO;
    tableViewBox.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tableViewBox];

    NSLayoutConstraint *tableViewBoxTopConstraint = [NSLayoutConstraint constraintWithItem:tableViewBox
                                                                             attribute:NSLayoutAttributeCenterX
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.displayView
                                                                             attribute:NSLayoutAttributeCenterX
                                                                            multiplier:1.0
                                                                              constant:0.0];

    NSLayoutConstraint *tableViewBoxBottomConstraint = [NSLayoutConstraint constraintWithItem:tableViewBox
                                                                              attribute:NSLayoutAttributeBottom
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:self.view
                                                                              attribute:NSLayoutAttributeBottom
                                                                             multiplier:1.0
                                                                               constant:0.0];

    NSLayoutConstraint *tableViewBoxWidthConstraint = [NSLayoutConstraint constraintWithItem:tableViewBox
                                                                             attribute:NSLayoutAttributeWidth
                                                                             relatedBy:NSLayoutRelationEqual
                                                                                toItem:self.view
                                                                             attribute:NSLayoutAttributeWidth
                                                                            multiplier:1.0
                                                                              constant:self.view.frame.size.width];

    NSLayoutConstraint *tableViewBoxHeightConstraint = [NSLayoutConstraint constraintWithItem:tableViewBox
                                                                              attribute:NSLayoutAttributeHeight
                                                                              relatedBy:NSLayoutRelationEqual
                                                                                 toItem:nil
                                                                              attribute:NSLayoutAttributeNotAnAttribute
                                                                             multiplier:1.0
                                                                               constant:self.view.frame.size.height * 0.30];

    [NSLayoutConstraint activateConstraints:@[tableViewBoxTopConstraint, tableViewBoxBottomConstraint, tableViewBoxWidthConstraint, tableViewBoxHeightConstraint]];
    
    //    [self.view addSubview:self.tableView];
    //    self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32.0).isActive = true
    //    self.tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120.0).isActive = true
    //    self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32.0).isActive = true
    //    self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32.0).isActive = true
        
//        self.tableView=[[UITableView alloc]init];
//        self.tableView.frame = CGRectMake(10,30,320,400);
//        self.tableView.dataSource=self;
//        self.tableView.delegate=self;
//        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//        [self.tableView reloadData];
//        [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return lapTimes.count;
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";

    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    self.timeLabel.text =  [lapTimes objectAtIndex:indexPath.row];
    return cell;
}

/**
 Resize the frame of the framing view depending on which button was pressed.
 */
- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeightConstraint.constant = newHeight;
        self.framingViewWidthConstraint.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
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

//
//  ViewController.h
//  SplitTimer
//
//  Created by Elle Ti on 2020-03-28.
//  Copyright © 2020 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
    BOOL running;
    int timeInSeconds;
    NSArray *lapTimes;
}

@property (nonatomic, weak) UIButton *squareButton;
@property (nonatomic, weak) UIButton *portraitButton;
@property (nonatomic, weak) UIButton *landscapeButton;

@property (nonatomic, weak) UIView *levelTitleView;
@property (nonatomic, weak) UIView *displayView;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) NSLayoutConstraint *framingViewHeightConstraint;
@property (nonatomic, weak) NSLayoutConstraint *framingViewWidthConstraint;

- (void)timerTicking;

@end


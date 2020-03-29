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

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *splitTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
@property (weak, nonatomic) IBOutlet UIButton *stopButton;
@property (weak, nonatomic) IBOutlet UITableView *lapTable;
@property (weak, nonatomic) IBOutlet UILabel *lapLabel;

- (IBAction)startBtnPushed:(id)sender;
- (IBAction)resetBtnPushed:(id)sender;
- (IBAction)splitTimeBtnPushed:(id)sender;
- (IBAction)stopBtnPushed:(id)sender;

- (void)timerTicking;

@end


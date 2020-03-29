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
}

@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@property (weak, nonatomic) IBOutlet UIButton *splitTimeButton;
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

- (IBAction)startBtnPushed:(id)sender;
- (IBAction)resetBtnPushed:(id)sender;
- (IBAction)splitTimeBtnPushed:(id)sender;

- (void)timerTicking;

@end


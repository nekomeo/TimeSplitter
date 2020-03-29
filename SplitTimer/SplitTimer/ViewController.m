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
@synthesize timerLabel, startButton, resetButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    running = NO;
    timeInSeconds = 0;
    timerLabel.text = @"00:00:00";
}

- (IBAction)startBtnPushed:(id)sender {
    NSLog(@"Start button pushed");
    
    if (!timeInSeconds) {
        timeInSeconds = 0;
    }
    
    if (!timer) {
        timer = [self creatTimer];
    }
}

- (IBAction)splitTimeBtnPushed:(id)sender {
    NSLog(@"Split button pushed");
}

- (NSTimer *) creatTimer {
    return [NSTimer scheduledTimerWithTimeInterval:1.0
                                            target:self
                                          selector:@selector(timerTicking)
                                          userInfo:nil
                                           repeats:YES];
}

- (void)timerTicking {
    timeInSeconds++;
    self.timerLabel.text = [self formattedTime:timeInSeconds];
}

- (NSString *)formattedTime:(int)totalSeconds {
    int minute = totalSeconds / 600;
    int minuteRemainder = totalSeconds % 600;
    int second = minuteRemainder / 10;
    int secondRemainder = minuteRemainder % 10;
    
    NSString *minString = [NSString stringWithFormat:@"%d", minute];
    NSString *secString = [NSString stringWithFormat:@"%d", second];
    
    if (second < 10){
        secString = [NSString stringWithFormat:@"0%@",secString];
    }
    NSString *secRemainderString = [NSString stringWithFormat:@"%d",secondRemainder];
    
    return [NSString stringWithFormat:@"%@:%@.%@", minString,secString,secRemainderString];
}

@end

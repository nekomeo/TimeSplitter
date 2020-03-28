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
    count = 0;
    timerLabel.text = @"00:00:00";
}

- (IBAction)startBtnPushed:(id)sender {
    NSLog(@"Start button pushed");
}

- (IBAction)splitTimeBtnPushed:(id)sender {
    NSLog(@"Split button pushed");
}
@end

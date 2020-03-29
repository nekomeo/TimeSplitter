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
@synthesize timerLabel, startButton, resetButton, lapTable, lapLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    running = NO;
    timeInSeconds = 0;
    timerLabel.text = @"00:00.00";
    lapTimes = @[@"0:00.34", @"0:02.45"];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(tap:)];
    gesture.delegate = self;
    [self tap:gesture];
}

- (IBAction)startBtnPushed:(id)sender {
//    NSLog(@"Start button pushed");
    
    if (running == NO) {
        running = YES;
        [startButton setTitle:@"Stop" forState:UIControlStateNormal];
        
        if (timer == nil) {
            timer = [NSTimer scheduledTimerWithTimeInterval:0.01
                                                     target:self
                                                   selector:@selector(timerTicking)
                                                   userInfo:nil
                                                    repeats:YES];
        }
    } else {
        [self stopTimer];
    }
}

- (IBAction)splitTimeBtnPushed:(id)sender {
//    NSLog(@"Split button pushed");
}

- (IBAction)stopBtnPushed:(id)sender {
    running = NO;
    [timer invalidate];
    timer = nil;
}

- (IBAction)resetBtnPushed:(id)sender {
//    NSLog(@"Reset button pushed");
    [self resetTimer];
}

- (void)timerTicking {
    timeInSeconds++;
    
    int min = floor(timeInSeconds / 100 / 60);
    int sec = floor(timeInSeconds / 100);
    int mSec = timeInSeconds % 100;
    
    if (sec >= 60) {
        sec = sec % 60;
    }
    
    timerLabel.text = [NSString stringWithFormat:@"%02d:%02d.%02d", min, sec, mSec];
}

- (void)stopTimer {
    running = NO;
    [timer invalidate];
    timer = nil;
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
}

- (void)resetTimer {
    [self stopTimer];
    timer = 0;
    timerLabel.text = @"00:00.00";
}

- (void)tap:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"Tapped");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return lapTimes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [self.lapTable dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text =  [lapTimes objectAtIndex:indexPath.row];
    return cell;
}

@end

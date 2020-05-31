//
//  TimerViewController.h
//  SplitTimer
//
//  Created by Elle Ti on 2020-05-24.
//  Copyright © 2020 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TimerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UIView *mainTimerView;
@property (nonatomic, strong) UITableView *lapTableView;

@end

NS_ASSUME_NONNULL_END

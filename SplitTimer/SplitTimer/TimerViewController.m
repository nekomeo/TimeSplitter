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
    
    UINavigationBar* navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60)];
    
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:@"Timer"];
     [navbar setBarTintColor:[UIColor lightGrayColor]];
    UIBarButtonItem* cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onTapCancel:)];
    navItem.leftBarButtonItem = cancelBtn;
    
//    UIBarButtonItem* doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onTapDone:)];
//    navItem.rightBarButtonItem = doneBtn;
    
    [navbar setItems:@[navItem]];
    [self.view addSubview:navbar];
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

@end

//
//  DatePickerViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 28/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

-(IBAction)cancelButtonPresed:(id)sender;
-(IBAction)okButtonPresed:(id)sender;

@property (strong,nonatomic) IBOutlet UIDatePicker *picker;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.picker setDatePickerMode:UIDatePickerModeDate];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancelButtonPresed:(id)sender {
    
  
    
    [UIView animateWithDuration:.4 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setAlpha:0];
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self.view.superview layoutIfNeeded];
        [self removeFromParentViewController];
    }];


}


-(void)okButtonPresed:(id)sender
{
    [UIView animateWithDuration:.4 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        [self.view setAlpha:0];
    } completion:^(BOOL finished) {
        [self.view removeFromSuperview];
        [self.view.superview layoutIfNeeded];
        [self removeFromParentViewController];
    }];
    

    
    [self.delagate getPickedDate:self.picker.date];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

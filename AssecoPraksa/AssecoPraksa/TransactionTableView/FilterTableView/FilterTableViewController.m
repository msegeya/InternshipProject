//
//  FilterTableViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 28/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "FilterTableViewController.h"
#import "DatePickerViewController.h"
#import "TableListPickerController.h"

@interface FilterTableViewController ()
{
    BOOL isStartDate;
    BOOL isEndDate;
    BOOL keyboardIsShown;
}



@property (strong, nonatomic) IBOutlet UILabel *startDateLabel;
@property (strong, nonatomic) IBOutlet UILabel *endDateLabel;
@property (strong, nonatomic)  NSDate *startDate;
@property (strong, nonatomic)  NSDate *endDate;


@property (strong, nonatomic) IBOutlet UITextField *minAmount;
@property (strong, nonatomic) IBOutlet UITextField *maxAmount;

@property (strong, nonatomic) IBOutlet UILabel *accNumberLabel;

@property (strong, nonatomic) IBOutlet UISwitch *minSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *maxSwitch;
- (IBAction)confirmButton:(id)sender;
@end

@implementation FilterTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    isEndDate = NO;
    isStartDate = NO;
    
    /*
     // register for keyboard notifications
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(keyboardWillShow:)
     name:UIKeyboardWillShowNotification
     object:self.view.window];
     // register for keyboard notifications
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(keyboardWillHide:)
     name:UIKeyboardWillHideNotification
     object:self.view.window];
     keyboardIsShown = NO;
     */
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    gestureRecognizer.cancelsTouchesInView = NO;
    [self.tableView addGestureRecognizer:gestureRecognizer];
    
    
    
}

- (void) hideKeyboard {
    [self.maxAmount resignFirstResponder];
    [self.minAmount resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0){
        DatePickerViewController *filterVc = [DatePickerViewController new];//nib is the same name so i can use New
        filterVc.delagate = self;
        [filterVc.view setAlpha:0];
        [filterVc.view setFrame:self.view.bounds];
        
        [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionTransitionCurlDown animations:^{
            [self.view addSubview:filterVc.view];
            [self addChildViewController:filterVc];
            [filterVc.view setAlpha:1];
            [self.view layoutIfNeeded];
        } completion:nil];
        
        
        if(indexPath.row == 0){
            
            isStartDate = YES;
        }
        else if( indexPath.row == 1){
            isEndDate = YES;
            
        }
    }
    
    
    if(indexPath.section == 2){
        if(indexPath.row == 0){
            
            TableListPickerController *tlpVc = [TableListPickerController new];//nib is the same name so i can use New
            tlpVc.delagate = self;
            tlpVc.dataSource = self.accNumbers;
            [tlpVc.view setAlpha:0];
            [tlpVc.view setFrame:self.view.bounds];
            
            [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionTransitionCurlDown animations:^{
                [self.view addSubview:tlpVc.view];
                [self addChildViewController:tlpVc];
                [tlpVc.view setAlpha:1];
                [self.view layoutIfNeeded];
            } completion:nil];
            
        }
    }
    
    
}



-(void)getPickedDate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    NSString *theDate = [dateFormat stringFromDate:date];
    
    
    
    if(isStartDate)
    {
        isStartDate=NO;
        self.startDateLabel.text = theDate;
        self.startDate = date;
        
    }
    else if(isEndDate)
    {
        isEndDate = NO;
        self.endDateLabel.text = theDate;
        self.endDate = date;
    }
    
    [self.tableView reloadData];
}

-(void)getPickedAccountNumber:(NSString *)accNUmber
{
    self.accNumberLabel.text =accNUmber;
    [self.tableView reloadData];
}



- (void)keyboardWillHide:(NSNotification *)n
{
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize the scrollview
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height += (keyboardSize.height - 20);
    [self.view setFrame:viewFrame];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    [self.view.superview layoutIfNeeded];
    [UIView commitAnimations];
    
    keyboardIsShown = NO;
}

- (void)keyboardWillShow:(NSNotification *)n
{
    if (keyboardIsShown) {
        return;
    }
    
    NSDictionary* userInfo = [n userInfo];
    
    // get the size of the keyboard
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    // resize the noteView
    CGRect viewFrame = self.view.frame;
    viewFrame.size.height -= (keyboardSize.height - 20);
    [self.view setFrame:viewFrame];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [self.view.superview layoutIfNeeded];
    [UIView commitAnimations];
    keyboardIsShown = YES;
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]init];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleDone target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    
    textField.inputAccessoryView = numberToolbar;
    return YES;
}

-(void)cancelNumberPad
{
    self.maxAmount.text = @"";
    self.minAmount.text = @"";
    [self.maxAmount resignFirstResponder];
    [self.minAmount resignFirstResponder];
    
}

-(void)doneWithNumberPad
{
    [self.maxAmount resignFirstResponder];
    [self.minAmount resignFirstResponder];
}

- (IBAction)confirmButton:(id)sender {
    
    FilterData *fData = [[FilterData alloc]init];
    NSInteger min = self.minSwitch.isOn ? [self.minAmount.text integerValue]  : -1;
    NSInteger max = self.maxSwitch.isOn ? [self.maxAmount.text integerValue]  : -1;
    [fData setMax:max];
    [fData setMin:min];
    [fData setAccNumber: [self.accNumberLabel.text isEqualToString:@"..." ] ? nil : self.accNumberLabel.text ];
    [fData setStartDate:self.startDate];
    [fData setEndDate:self.endDate];
        
    
    [self.delegate returnFilteredData:fData];
    [self.navigationController popViewControllerAnimated:YES];

}
@end

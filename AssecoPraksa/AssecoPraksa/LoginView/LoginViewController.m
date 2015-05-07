//
//  LoginViewController.m
//  AssecoPraksa
//
//  Created by MTLab on 08/04/15.
//  Copyright (c) 2015 asseco. All rights reserved.
//

#import "LoginViewController.h"



NSString *const SUIT_NAME_USERDEFAULTS = @"AssecoPraksa";
NSString *const USERDATA_USERDEFAULTS = @"UserDataKey";
NSString *const ISCHECKED_USERDEFAULTS = @"isChecked";

NSString *const KEYCHAIN_EMAIL = @"assecoUserEmail";
NSString *const KEYCHAIN_PASSWORD = @"assecoPassword";

@interface LoginViewController ()
{
    //Private iVars
    BOOL isChecked;
    BOOL keyboardIsShown;
}

@property (strong, nonatomic) IBOutlet UITextField *emailxtField;

@property (strong, nonatomic) IBOutlet UITextField *paswordTxtField;

@property (strong, nonatomic) IBOutlet UISwitch *rememberMeSwitch;

- (IBAction)loginPressed:(id)sender;

//Labels
@property (strong, nonatomic) IBOutlet UILabel *emailLabel;
@property (strong, nonatomic) IBOutlet UILabel *passwordLabel;
@property (strong, nonatomic) IBOutlet UILabel *rememberMeLabel;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUILocaliztionString];
    
    isChecked = NO;
    
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
    
    //check if "remember me" was checked
    //if yes, then get email and password form keychain
    
    NSUserDefaults  *userDef = [[NSUserDefaults alloc]initWithSuiteName:SUIT_NAME_USERDEFAULTS];
    
    self.rememberMeSwitch.transform = CGAffineTransformMakeScale(0.75, 0.75);
    
    if([userDef boolForKey:ISCHECKED_USERDEFAULTS]){
        
        self.paswordTxtField.text =  [JNKeychain loadValueForKey:KEYCHAIN_PASSWORD];
        self.emailxtField.text =  [JNKeychain loadValueForKey:KEYCHAIN_EMAIL];
        //[self.checkBoxButton setImage:[UIImage imageNamed:@"checkBoxMarked"] forState:UIControlStateNormal];
        [self.rememberMeSwitch setOn:YES animated:YES];
    }
    
    
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
 #pragma mark - Navigation
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 }
 */

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)loginPressed:(id)sender {
    
    APILayer *apiCall = [[APILayer alloc]initWithView:self.view];
    [apiCall setDelegate:self];
    
    [apiCall loginRequestWithEmail: self.emailxtField.text andPaswword:self.paswordTxtField.text];
    
    // [apiCall loginRequestWithEmail: @"demo@banka.com" andPaswword:@"demo123"];

    
}


-(void)responseLoginRecivedWithData:(ResponseData *)data
{
    DLog(@"Msg: %@",data.message);
    if(data.status)
    {
        DLog(@"OK");
        
        // if remember me is checked store email and password to KeyChain
        if(self.rememberMeSwitch.isOn)
        {
            NSString *uValue = self.emailxtField.text;
            
            if ( [JNKeychain saveValue:uValue  forKey:KEYCHAIN_EMAIL])
            {
                DLog(@"Correctly saved value '%@' for key '%@'", uValue, KEYCHAIN_EMAIL);
            } else {
                DLog(@"Failed to save!");
            }
            uValue = self.paswordTxtField.text;
            
            if ( [JNKeychain saveValue:uValue  forKey:KEYCHAIN_PASSWORD])
            {
                ILog(@"Correctly saved value '%@' for key '%@'", uValue, KEYCHAIN_PASSWORD);
            } else
            {
                DLog(@"Failed to save!");
            }
            
        }
        else
        {
            [JNKeychain deleteValueForKey:KEYCHAIN_PASSWORD];
            [JNKeychain deleteValueForKey:KEYCHAIN_EMAIL];
        }
        
        NSUserDefaults *userDf = [[NSUserDefaults alloc]initWithSuiteName:SUIT_NAME_USERDEFAULTS];
        [userDf setBool:self.rememberMeSwitch.isOn forKey:ISCHECKED_USERDEFAULTS];
        
        UserData *user = [UserData sharedManager];
        
        [user setUserWithName:data.name withToken:data.token andUserAccount:data.account];
        
        [self performSegueWithIdentifier:@"idLoginPush" sender:self];
        
        
        
    }
    else {
        DLog(@"NOT OK");
        
        
        
    }
    
}

-(void)setUILocaliztionString
{
    self.emailLabel.text = NSLocalizedString(@"loginViewEmailLabel", @"comment");
    self.passwordLabel.text = NSLocalizedString(@"loginViewPasswordLabel", @"comment");
    self.rememberMeLabel.text = NSLocalizedString(@"loginViewRememberMeLabel", @"comment");
    [self.loginButton setTitle:NSLocalizedString(@"loginViewLoginButton", @"comment") forState:UIControlStateNormal];
    
}

@end

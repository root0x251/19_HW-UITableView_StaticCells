//
//  SettingsTableViewController.m
//  test
//
//  Created by Slava on 12.06.17.
//  Copyright © 2017 Vyacheslav Bortnichenko. All rights reserved.
//

#import "SettingsTableViewController.h"

@interface SettingsTableViewController ()
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@property (weak, nonatomic) IBOutlet UISwitch *accountInfoSwitch;           // switch

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;           // photo


@end
#pragma mark - Key
static NSString *keyUserDataLogin           = @"Login";
static NSString *keyUserDataPassword        = @"Password";
static NSString *keyUserDataFirstName       = @"FirstName";
static NSString *keyUserDataLastName        = @"LastName";
static NSString *keyUserDataAge             = @"Age";
static NSString *keyUserDataPhoneNumber     = @"PhoneNumber";
static NSString *keyUserDataEmail           = @"Email";
static NSString *keyUserDataAccountSwitch   = @"AccountSwitch";
static NSString *keyUserDataPhotoImage      = @"PhotoImage";

typedef enum{
    loginTextField,
    passwordTextField,
    firstNameTextField,
    lastNameTextField,
    ageTextField,
    phoneNumberTextField,
    emailTextField
}TextField;

@implementation SettingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    // margin top tableView
//    UIEdgeInsets inset = UIEdgeInsetsMake(20, 0, 0, 0);
//    self.tableView.contentInset = inset;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Save Data
- (void)saveData {
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];                       // obj
    [userData setObject:self.loginTextField.text forKey:keyUserDataLogin];                  // obj
    [userData setObject:self.passwordTextField.text forKey:keyUserDataPassword];            // obj
    [userData setObject:self.firstNameTextField.text forKey:keyUserDataFirstName];          // obj
    [userData setObject:self.lastNameTextField.text forKey:keyUserDataLastName];            // obj
    [userData setObject:self.emailTextField.text forKey:keyUserDataEmail];                  // obj

    [userData setObject:self.ageTextField.text forKey:keyUserDataAge];
    [userData setObject:self.phoneNumberTextField.text forKey:keyUserDataPhoneNumber];
    
    [userData setBool:self.accountInfoSwitch.isOn forKey:keyUserDataAccountSwitch];         // switch
  

    
    
//    [userData setObject:UIImagePNGRepresentation(self.photoImageView) forKey:keyUserDataPhotoImage];                  // photo
    
    [userData synchronize];
}
#pragma mark - Load Data
- (void)loadData {
    NSUserDefaults *userData = [NSUserDefaults standardUserDefaults];
    
    self.loginTextField.text = [userData objectForKey:keyUserDataLogin];
    self.passwordTextField.text = [userData objectForKey:keyUserDataPassword];
    self.firstNameTextField.text = [userData objectForKey:keyUserDataFirstName];
    self.lastNameTextField.text = [userData objectForKey:keyUserDataLastName];
    self.emailTextField.text = [userData objectForKey:keyUserDataEmail];

    self.ageTextField.text = [userData objectForKey:keyUserDataAge];
    self.phoneNumberTextField.text = [userData objectForKey:keyUserDataPhoneNumber];
    
    self.accountInfoSwitch.on = [userData boolForKey:keyUserDataAccountSwitch];
}
#pragma mark - Switch Sender
- (IBAction)switchUserInfoAction:(UISwitch *)sender {
    [self saveData];
}

#pragma mark - Editing textField changet
- (IBAction)editingChangetTextFieldAction:(UITextField *)sender {
    [self saveData];
}

- (IBAction)addPhoto:(UIButton *)sender {
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    if ([textField isEqual:self.loginTextField]) {
//        [self.passwordTextField becomeFirstResponder];
//    } else {
//        [textField resignFirstResponder];
//    }
    switch (textField.tag) {
        case loginTextField:
            [self.passwordTextField becomeFirstResponder];
            break;
        case passwordTextField:
            [self.firstNameTextField becomeFirstResponder];
            break;
        case firstNameTextField:
            [self.lastNameTextField becomeFirstResponder];
            break;
        case lastNameTextField:
            [self.ageTextField becomeFirstResponder];
            break;
        case ageTextField:
            [self.phoneNumberTextField becomeFirstResponder];
            break;
        case phoneNumberTextField:
            [self.emailTextField becomeFirstResponder];
            break;
        case emailTextField:
            [self.emailTextField resignFirstResponder];
            break;
        default:
            break;
    }
    return NO;
}



@end

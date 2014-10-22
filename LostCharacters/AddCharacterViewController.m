//
//  AddCharacterViewController.m
//  LostCharacters
//
//  Created by S on 10/21/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "AddCharacterViewController.h"

@interface AddCharacterViewController () <UITextFieldDelegate>

@end

@implementation AddCharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.actorTextField.delegate = self;
    self.passengerTextField.delegate = self;
    // Do any additional setup after loading the view.
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField becomeFirstResponder];
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 1)
    {
        self.actorTextField.text = textField.text;
        [textField resignFirstResponder];
        NSLog(@"actor: %@", self.actorTextField.text);
    }
    else if (textField.tag == 2)
    {
        self.passengerTextField.text = textField.text;
        [textField resignFirstResponder];
        NSLog(@"passenger: %@", self.passengerTextField.text);
    }
    return YES;
}

@end

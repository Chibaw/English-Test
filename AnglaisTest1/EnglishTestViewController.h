//
//  EnglishTestViewController.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 16/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnglishTestViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldMail;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;
- (IBAction)buttonStart:(id)sender;
- (BOOL)ValidationSuccessful;

@end

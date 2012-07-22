//
//  GeneralConditionsViewController.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 17/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralConditionsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *validationChecker;
- (IBAction)startToeic:(id)sender;

@end

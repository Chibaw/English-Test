//
//  GeneralConditionsViewControllerViewController.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 17/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GeneralConditionsViewControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *validationChecker;
- (IBAction)startTOEIC:(id)sender;

@end

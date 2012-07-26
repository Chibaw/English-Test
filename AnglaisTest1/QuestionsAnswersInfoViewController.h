//
//  Phase1ViewController.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 23/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionsAnswersInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *validationChecker;
- (IBAction)nextQuestions:(id)sender;
@end

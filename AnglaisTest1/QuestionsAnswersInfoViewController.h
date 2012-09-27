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
@property (weak, nonatomic) IBOutlet UITextView *infoSection;

@property (nonatomic) NSInteger section;
@property (nonatomic, strong) NSDictionary *dic;
@property (weak, nonatomic) NSMutableString *answers;

- (IBAction)nextQuestions:(id)sender;
@end

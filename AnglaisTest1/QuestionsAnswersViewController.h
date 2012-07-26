//
//  QuestionsAnswersViewController.h
//  AnglaisTest1
//
//  Created by Franck Lavisse on 24/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionsAnswersViewController : UIViewController
@property (nonatomic) NSArray *questionsArray;
- (void)showNextAnswers;
@property (weak, nonatomic) IBOutlet UITextField *answerA;
@property (weak, nonatomic) IBOutlet UITextField *answerB;
@property (weak, nonatomic) IBOutlet UITextField *answerC;
- (IBAction)nextQuestion:(id)sender;
@property (nonatomic) NSEnumerator *it;
@property (nonatomic) NSDictionary *dic;
@end

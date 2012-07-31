//
//  QuestionsAnswersViewController.h
//  AnglaisTest1
//
//  Created by Franck Lavisse on 24/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <Foundation/Foundation.h>

@interface QuestionsAnswersViewController : UIViewController

- (void)showNextAnswers;
- (IBAction)nextQuestion:(id)sender;
- (void)playQuestionSound:(NSString*)name;

@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic) NSArray *questionsArray;
@property (weak, nonatomic) IBOutlet UITextField *answerA;
@property (weak, nonatomic) IBOutlet UITextField *answerB;
@property (weak, nonatomic) IBOutlet UITextField *answerC;
@property (nonatomic) NSEnumerator *it;
@property (nonatomic) NSDictionary *dic;
@property (nonatomic, strong) NSArray *sectionsArray;
@end

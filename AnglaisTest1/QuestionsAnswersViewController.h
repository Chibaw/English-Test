/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

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

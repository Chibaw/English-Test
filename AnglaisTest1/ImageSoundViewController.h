/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface ImageSoundViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UITextField *questionText;
@property (weak, nonatomic) IBOutlet UITextField *answerA;
@property (weak, nonatomic) IBOutlet UITextField *answerB;
@property (weak, nonatomic) IBOutlet UITextField *answerC;
@property (weak, nonatomic) IBOutlet UITextField *answerD;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectAnswer;

@property (nonatomic, strong) NSArray *section;
@property (nonatomic) NSInteger sectionNum;
@property (nonatomic) NSEnumerator *it;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, strong) NSMutableString *answers;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *mail;

- (IBAction)nextQuestion:(id)sender;
- (IBAction)replaySound:(id)sender;

@end

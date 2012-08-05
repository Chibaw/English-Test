/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface MTDetailViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UISegmentedControl *answerCheck;

@property (weak, nonatomic) IBOutlet UILabel *questionNumber;

@property (weak, nonatomic) IBOutlet UITextField *audioPath;
@property (weak, nonatomic) IBOutlet UITextField *imagePath;
@property (weak, nonatomic) IBOutlet UITextField *questionText;
@property (weak, nonatomic) IBOutlet UITextField *AText;
@property (weak, nonatomic) IBOutlet UITextField *BText;
@property (weak, nonatomic) IBOutlet UITextField *CText;
@property (weak, nonatomic) IBOutlet UITextField *DText;

- (IBAction)ListenAudio:(id)sender;
- (IBAction)ShowImage:(id)sender;

@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) NSMutableDictionary *dic;
@property (nonatomic, strong) NSIndexPath *num;

@property (nonatomic) NSUInteger indexSections;
@property (nonatomic) NSUInteger index;
@end

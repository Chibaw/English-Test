/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface QuestionsAnswersInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *validationChecker;
@property (weak, nonatomic) IBOutlet UITextView *infoSection;

@property (nonatomic) NSInteger section;
@property (nonatomic, strong) NSDictionary *dic;
@property (weak, nonatomic) NSMutableString *answers;

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *lastName;
@property (nonatomic) NSString *mail;

- (IBAction)nextQuestions:(id)sender;
@end

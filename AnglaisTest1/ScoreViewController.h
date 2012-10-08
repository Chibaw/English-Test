/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *scoreBox;

@property (nonatomic) NSString *answers;
@property (nonatomic, strong) NSMutableString *verify;

@property (nonatomic, strong) NSMutableArray *catSizes;

- (IBAction)goodBye:(id)sender;

//-(void)sendEmail;
@end

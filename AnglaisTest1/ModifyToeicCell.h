/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface ModifyToeicCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *questionNumber;
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet UILabel *questionAnswer;

@property (weak, nonatomic) IBOutlet UILabel *answerA;
@property (weak, nonatomic) IBOutlet UILabel *answerB;
@property (weak, nonatomic) IBOutlet UILabel *answerC;
@property (weak, nonatomic) IBOutlet UILabel *answerD;

@end

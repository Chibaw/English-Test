/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface ModifyToeicViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *questionNumbers;
@property (nonatomic, strong) NSMutableArray *questionTexts;
@property (nonatomic, strong) NSMutableArray *questionAnswers;

@property (nonatomic, strong) NSMutableArray *answerAs;
@property (nonatomic, strong) NSMutableArray *answerBs;
@property (nonatomic, strong) NSMutableArray *answerCs;
@property (nonatomic, strong) NSMutableArray *answerDs;

@property (nonatomic, strong) NSArray *sectionsArray;
@end

/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <UIKit/UIKit.h>

@interface AdminUsersViewController : UITableViewController

@property (nonatomic, strong) NSArray *userFirstNames;
@property (nonatomic, strong) NSArray *userLastNames;
@property (nonatomic, strong) NSArray *userMails;
@end

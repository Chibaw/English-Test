/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, Users;

@interface Toeic : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Users *users;
@property (nonatomic, retain) Question *questions;

@end

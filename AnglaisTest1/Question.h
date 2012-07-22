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


@interface Question : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * media;
@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSManagedObject *toeic;

@end

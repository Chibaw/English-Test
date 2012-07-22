//
//  Toeic.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 17/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, Users;

@interface Toeic : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) Users *users;
@property (nonatomic, retain) Question *questions;

@end

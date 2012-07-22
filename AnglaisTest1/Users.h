//
//  Users.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 17/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * mail;
@property (nonatomic, retain) NSManagedObject *toeic;

@end

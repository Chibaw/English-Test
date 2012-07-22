//
//  Question.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 17/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Question : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSString * media;
@property (nonatomic, retain) NSString * answer;
@property (nonatomic, retain) NSManagedObject *toeic;

@end

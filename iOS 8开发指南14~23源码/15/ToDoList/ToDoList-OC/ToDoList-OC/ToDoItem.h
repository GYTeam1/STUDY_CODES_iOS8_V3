//
//  ToDoItem.h
//  ToDoList-OC
//
//  Created by Theraphy on 14/6/10.
//  Copyright (c) 2014年 lyudonghui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end

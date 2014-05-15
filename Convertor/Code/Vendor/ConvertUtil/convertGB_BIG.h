//
//  convertGB_BIG.h
//  myTest
//
//  Created by sffofn on 11-8-17.
//  Copyright 2011 keke.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface convertGB_BIG : NSObject {
	NSString*	_string_GB;
	NSString*	_string_BIG5;
    NSString *_string_Hot;
    NSString *_sub;
}

@property(nonatomic, strong) NSString*	string_GB;
@property(nonatomic, strong) NSString*	string_BIG5;
@property(nonatomic, strong) NSString*	string_Hot;
@property(nonatomic, strong) NSString*	sub;
-(NSString*)gbToBig5:(NSString*)srcString;
-(NSString*)big5ToGb:(NSString*)srcString;

-(NSString*)gbToHot:(NSString*)srcString;
-(NSString*)hotToGb:(NSString*)srcString;

-(NSString*)subTo:(NSString*)srcString;
@end

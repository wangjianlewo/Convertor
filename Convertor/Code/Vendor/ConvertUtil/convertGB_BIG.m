//
//  convertGB_BIG.m
//  myTest
//
//  Created by sffofn on 11-8-17.
//  Copyright 2011 keke.com. All rights reserved.
//

#import "convertGB_BIG.h"

@implementation convertGB_BIG
@synthesize string_GB = _string_GB;
@synthesize string_BIG5 = _string_BIG5;
@synthesize string_Hot = _string_Hot;
@synthesize  sub=_sub;

-(id)init
{
	if(self = [super init])
	{
		NSError *error;
		NSString *resourcePath = [ [NSBundle mainBundle] resourcePath];
		self.string_GB = [NSString stringWithContentsOfFile:[resourcePath stringByAppendingPathComponent:@"gb.txt"]
												   encoding:NSUTF8StringEncoding
													  error:&error];
		self.string_BIG5 = [NSString stringWithContentsOfFile:[resourcePath stringByAppendingPathComponent:@"big5.txt"]
												   encoding:NSUTF8StringEncoding
													  error:&error];

        self.string_Hot = [NSString stringWithContentsOfFile:[resourcePath stringByAppendingPathComponent:@"hot.txt"]
                                                     encoding:NSUTF8StringEncoding
                                                        error:&error];
        self.sub=[NSString stringWithContentsOfFile:[resourcePath stringByAppendingPathComponent:@"split.txt"]
                                            encoding:NSUTF8StringEncoding
                                               error:&error] ;

	}
	
	return self;
}
//nomal to  sub
-(NSString*)subTo:(NSString*)srcString{
    NSInteger length=[srcString length];
    NSMutableString *changeText=[NSMutableString string];
    
    for (NSInteger i =0; i<length; i++) {
        NSString *string =[srcString substringWithRange:NSMakeRange(i, 1)] ;
        NSRange subRange=[ _sub rangeOfString:string];
        
        if (subRange.location==0||(subRange.location%3)==0) {
            NSString *subbed=[_sub substringWithRange:NSMakeRange(subRange.location+1, 2)];
            [changeText appendString:subbed];
           
        }else{
            [changeText appendString:string];
        }
    }
    return changeText;
}
//nomal to hot string
-(NSString*)gbToHot:(NSString*)srcString
{
	NSInteger length = [srcString length];
	for (NSInteger i = 0; i< length; i++)
	{
		NSString *string = [srcString substringWithRange:NSMakeRange(i, 1)];
		NSRange gbRange = [_string_GB rangeOfString:string];
       
		if(gbRange.location != NSNotFound)
		{
			NSString *big5String = [_string_Hot substringWithRange:gbRange];
          
			srcString = [srcString stringByReplacingCharactersInRange:NSMakeRange(i, 1)
                                                           withString:big5String];
           
		}
	}
	
	return srcString;
}

//hot string to nomal
-(NSString*)hotToGb:(NSString*)srcString
{
	NSInteger length = [srcString length];
	for (NSInteger i = 0; i< length; i++)
	{
		NSString *string = [srcString substringWithRange:NSMakeRange(i, 1)];
		NSRange big5Range = [_string_Hot rangeOfString:string];
		if(big5Range.location != NSNotFound)
		{
			NSString *gbString = [_string_GB substringWithRange:big5Range];
			srcString = [srcString stringByReplacingCharactersInRange:NSMakeRange(i, 1)
                                                           withString:gbString];
		}
	}
	
	return srcString;
}
//nomal to complex
-(NSString*)gbToBig5:(NSString*)srcString
{
	NSInteger length = [srcString length];
	for (NSInteger i = 0; i< length; i++)
	{
		NSString *string = [srcString substringWithRange:NSMakeRange(i, 1)];
		NSRange gbRange = [_string_GB rangeOfString:string];
        //先从gb中找出他的位置range，如果存在，就从big5里面从对应的range中读取到那个字符串，就将srcstring对应的字符用big5里面的替换
       
		if(gbRange.location != NSNotFound)
		{
			NSString *big5String = [_string_BIG5 substringWithRange:gbRange];
          
			srcString = [srcString stringByReplacingCharactersInRange:NSMakeRange(i, 1)
											   withString:big5String];
            }
	}
	
	return srcString;
}

//繁体转简体
-(NSString*)big5ToGb:(NSString*)srcString
{
	NSInteger length = [srcString length];
	for (NSInteger i = 0; i< length; i++)
	{
		NSString *string = [srcString substringWithRange:NSMakeRange(i, 1)];
		NSRange big5Range = [_string_BIG5 rangeOfString:string];
		if(big5Range.location != NSNotFound)
		{
			NSString *gbString = [_string_GB substringWithRange:big5Range];
			srcString = [srcString stringByReplacingCharactersInRange:NSMakeRange(i, 1)
											   withString:gbString];
		}
	}
	
	return srcString;
}

@end

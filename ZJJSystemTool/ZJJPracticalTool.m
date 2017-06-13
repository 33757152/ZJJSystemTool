//
//  ZJJPracticalTool.m
//  ZJJPracticalTool
//
//  Created by 张锦江 on 2017/3/22.
//  Copyright © 2017年 张锦江. All rights reserved.
//

#import "ZJJPracticalTool.h"

@implementation ZJJPracticalTool

#pragma mark - 十进制---->>十六进制
+ (NSString *)zjjTurnToSixteenWithTen:(int)ten {
    return [[self alloc] zjjInitToSixteenWithTen:ten];
}
- (NSString *)zjjInitToSixteenWithTen:(int)ten {
    
    static NSString *result = @"";
    
    int a = ten%16;
    
    NSString *aStr = [NSString stringWithFormat:@"%d",a];
    
    switch (a) {
        case 10:
            aStr = @"a";
            break;
            
        case 11:
            aStr = @"b";
            break;
            
        case 12:
            aStr = @"c";
            break;
            
        case 13:
            aStr = @"d";
            break;
            
        case 14:
            aStr = @"e";
            break;
            
        case 15:
            aStr = @"f";
            break;
            
        default:
            break;
    }
    
    
    result = [NSString stringWithFormat:@"%@%@",aStr,result];
    
    int b = ten/16;
    
    if (b == 0) {
        return result;
    }
    
    return [self zjjInitToSixteenWithTen:b];
    
}

#pragma mark - 十进制---->>八进制
+ (NSString *)zjjTurnToEightWithTen:(int)ten {
    return [[self alloc] zjjInitToEightWithTen:ten];
}
- (NSString *)zjjInitToEightWithTen:(int)ten {
    
    static NSString *result = @"";
    
    int a = ten%8;
    
    NSString *aStr = [NSString stringWithFormat:@"%d",a];
    
    result = [NSString stringWithFormat:@"%@%@",aStr,result];
    
    int b = ten/8;
    
    if (b == 0) {
        return result;
    }
    
    return [self zjjInitToEightWithTen:b];
}


#pragma mark - 十进制---->>二进制
+ (NSString *)zjjTurnToTwoWithTen:(int)ten {
    return [[self alloc] zjjInitToTwoWithTen:ten];
}
- (NSString *)zjjInitToTwoWithTen:(int)ten {
    
    static NSString *result = @"";
    
    int a = ten%2;
    
    NSString *aStr = [NSString stringWithFormat:@"%d",a];
    
    result = [NSString stringWithFormat:@"%@%@",aStr,result];
    
    int b = ten/2;
    
    if (b == 0) {
        return result;
    }
    
    return [self zjjInitToTwoWithTen:b];
    
}

#pragma mark - 十六进制---->>十进制
+ (NSString *)zjjTurnToTenWithSixteen:(NSString *)sixteen {
    NSString *lower = [sixteen lowercaseString];
    return [[self alloc] zjjInitToTenWithSixteen:lower];
}
- (NSString *)zjjInitToTenWithSixteen:(NSString *)sixteen {
    
    static NSMutableArray *result;
    
    if (!result) {
        result = [NSMutableArray arrayWithCapacity:0];
    }
    
    NSInteger length = sixteen.length;
    
    if (length>1) {
        
        NSString *end = [sixteen substringFromIndex:length-1];
        
        NSString *first = [sixteen substringToIndex:length-1];
        
        [result insertObject:end atIndex:0];
        
        return [self zjjInitToTenWithSixteen:first];
    }else {
        
        [result insertObject:sixteen atIndex:0];
        
        int total = 0;
        
        for (NSInteger i = 0; i<result.count; i++) {
            
            NSString *last = result[result.count-1-i];
            
            int a = [last intValue];
            
            if ([last isEqualToString:@"a"]) {
                a = 10;
            }else if ([last isEqualToString:@"b"]) {
                a = 11;
            }else if ([last isEqualToString:@"c"]) {
                a = 12;
            }else if ([last isEqualToString:@"d"]) {
                a = 13;
            }else if ([last isEqualToString:@"e"]) {
                a = 14;
            }else if ([last isEqualToString:@"f"]) {
                a = 15;
            }
            
            int b = 1;
            
            for (int j = 0; j<i; j++) {
                b = 16*b;
            }
            
            total += a * b;
            
        }
        
        NSString *totalStr = [NSString stringWithFormat:@"%d",total];
        
        return totalStr;
        
    }
    
}

#pragma mark - 计算总价格的简单封装
+ (float)zjjCalculateTotalPriceWithCountArray:(NSArray *)countArray withPriceArray:(NSArray *)priceArray {
    
    return [[self alloc] zjjCalculateTotalPriceInitWithCountArray:countArray withPriceArray:priceArray];
}

- (float)zjjCalculateTotalPriceInitWithCountArray:(NSArray *)countArray withPriceArray:(NSArray *)priceArray {
    
    NSInteger countNum = countArray.count;
    NSInteger priceCount = priceArray.count;
    
    if (countNum != priceCount) {
        return 0.0f;
    }
    
    float sum = 0.0f;
    
    for (NSInteger i = 0; i<priceCount; i++) {
        
        int countFloat = [countArray[i] intValue];
        
        float priceFloat = [priceArray[i] floatValue];
        
        sum += countFloat*priceFloat;
    }
    
    return sum;
}


@end

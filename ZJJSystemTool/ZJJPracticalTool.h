//
//  ZJJPracticalTool.h
//  ZJJPracticalTool
//
//  Created by 张锦江 on 2017/3/22.
//  Copyright © 2017年 张锦江. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJJPracticalTool : NSObject

/**
 十进制转成十六进制
 */
+ (NSString *)zjjTurnToSixteenWithTen:(int)ten;
- (NSString *)zjjInitToSixteenWithTen:(int)ten;

/**
 十进制转成八进制
 */
+ (NSString *)zjjTurnToEightWithTen:(int)ten;
- (NSString *)zjjInitToEightWithTen:(int)ten;

/**
 十进制转成二进制
 */
+ (NSString *)zjjTurnToTwoWithTen:(int)ten;
- (NSString *)zjjInitToTwoWithTen:(int)ten;

/**
 十六进制转成十进制
 */
+ (NSString *)zjjTurnToTenWithSixteen:(NSString *)sixteen;
- (NSString *)zjjInitToTenWithSixteen:(NSString *)sixteen;

/**
 
 计算总价格的简单封装
 第一个数组传每件商品的数量，第二个数组传该商品对应的单价
 
 */
+ (float)zjjCalculateTotalPriceWithCountArray:(NSArray *)countArray withPriceArray:(NSArray *)priceArray;
- (float)zjjCalculateTotalPriceInitWithCountArray:(NSArray *)countArray withPriceArray:(NSArray *)priceArray;




@end

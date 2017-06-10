//
//  Syntax.m
//  ObjcDemo
//
//  Created by lieon on 2017/6/10.
//  Copyright © 2017年 ChangHongCloudTechService. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LENGTH 10
#define WIDTH 5
#define NEWLINE '\n'

int main1() {
    int a, b;
    int c;
    float f;
    a = 10;
    b = 20;
    c = a + b;
    NSLog(@"value of c: %d \n", c);
    f = 30.0 / 3.0;
    NSLog(@"value of f : %f \n", f);
    int area = LENGTH * WIDTH;
    NSLog(@"value if  area: %d", area);
    const int length = 10;
    const int width = 5;
    area = length * width;
    return  0;
}

@interface TestMehtod : NSObject
- (int) max: (int) num1 secondNum: (int) num2;
- (NSNumber *) multiplyA: (NSNumber *) a withB: (NSNumber *) b;
- (void) performActionWithCompletion:(void(^)(void)) completion;

@end

@implementation TestMehtod : NSObject 
- (int) max: (int) num1 secondNum: (int) num2 {
    int result;
    if (num1 > num2) {
        result = num1;
    } else {
        result = num2;
    }
    return  result;
}

- (void) performActionWithCompletion:(void(^)(void)) completion {
    completion();
}

- (NSNumber *) multiplyA: (NSNumber *) a withB: (NSNumber *) b {
    float num1 = [a floatValue];
    float num2 = [b floatValue];
    float prodcut = num2 * num1;
    NSNumber * result = [NSNumber numberWithFloat:prodcut];
    return  result;
}
@end

int test() {
    TestMehtod * test = [[TestMehtod alloc]init];
    [test max:2 secondNum:3];
    double (^mutltiplyVlues)(double, double) = ^(double fiststValue, double secondValue){
        return fiststValue * secondValue;
    };
    double resilt = mutltiplyVlues(1.0, 2.0);
    NSLog(@"reslut: %f", resilt);
    int n[10];
    int i, j;
    for (i = 0; i < 10; i ++) {
        n[i] = i + 100;
    }
    for (j = 0; j < 10; j++) {
        NSLog(@"Element[%d] = %d\n", j, n[j]);
    }
    int var = 20;
    int *ip;
    ip = &var;
    
    NSLog(@"Address of var variable: %x \n", &var);
     /* address stored in pointer variable */
    NSLog(@"Address stored in ip variavle: %x\n", ip);
     /* access the value using the pointer */
    NSLog(@"Value of *ip variable: %d\n", *ip );
    return 0;
}

/* String */

int testString() {
    NSString * str1 = @"hello";
    NSString * str2 = @"world";
    NSString * str3;
    NSUInteger len;
    /** uppercase string*/
    str3 = [str2 uppercaseString];
    /* concatenates str1 and str2 */
    str3 = [str2 stringByAppendingFormat:@"word"];
    str3 = [str1 stringByAppendingString:@"wword"];
    len = str3.length;
    str3 = [NSString stringWithFormat:@"%@%@", str1, str2];
    return 0;
}

struct Books {
    __unsafe_unretained NSString * title;
    __unsafe_unretained NSString * author;
    __unsafe_unretained NSString * subject;
};

void testStruct() {
    struct Books book1;
    book1.title = @"title";
    book1.author = @"author";
    book1.subject = @"sd";
}

@interface Box : NSObject
{
    double length;
    double breadth;
    double height;
}
@property(nonatomic, unsafe_unretained) double height;
- (double) volume;
@end
@implementation Box
@synthesize height;
- (instancetype)init
{
    self = [super init];
    if (self) {
        length = 1.0;
        breadth = 1.0;
        self.height = 0.0;
    }
    return self;
}

-(double)volume {
    return  length * breadth * height;
}

@end

@interface Person: NSObject
{
    NSString * personsName;
    NSInteger personAge;
}

- (id)initWithName: (NSString *)name andAge: (NSInteger) age;
- (void) print;
@end

@implementation Person
- (id)initWithName: (NSString *)name andAge: (NSInteger) age {
    self = [super init];
    personsName = name;
    personAge = age;
    return self;
}

- (void) print {
    NSLog(@"Name: %@", personsName);
    NSLog(@"Age: %ld", personAge);
}

@end

@interface Employee : Person
{
    NSString *employeeEducation;
}

- (id)initWithName:(NSString *)name andAge:(NSInteger)age
      andEducation:(NSString *)education;
- (void)print;
@end

@implementation Employee
- (id)initWithName:(NSString *)name andAge:(NSInteger)age
      andEducation: (NSString *)education
{
    personsName = name;
    personAge = age;
    employeeEducation = education;
    return self;
}

- (void)print
{
    NSLog(@"Name: %@", personsName);
    NSLog(@"Age: %ld", personAge);
    NSLog(@"Education: %@", employeeEducation);
}
@end


@protocol Caculate <NSObject>
@required
@property(nonatomic, readonly)  float num1;
@property(nonatomic, readonly) float num2;
@required
- (double) caculateNum1: (float) num1 andNum2: (float) num2;
@end

@interface Caculator : NSObject<Caculate>

@end

static Caculator * _instance;
@implementation Caculator

@dynamic num1;
@dynamic num2;
- (double)caculateNum1:(float)num1 andNum2:(float)num2 {
    return 0.0;
}


- (float)getNum1 {
    return 0;
}

- (float) getNum2 {
    return 0;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype) share {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}
@end

@interface Myobj : NSObject<NSCopying, NSMutableCopying>

@end

@implementation Myobj

- (id)copyWithZone:(NSZone *)zone {
    Myobj * obj = [[Myobj allocWithZone:zone]init];
    return obj;
}
- (id)mutableCopyWithZone:(NSZone *)zone {
    Myobj * obj = [[Myobj allocWithZone:zone] init];
    return  obj;
}

@end


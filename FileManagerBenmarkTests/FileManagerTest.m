//
//  FileOPTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import "FileManagerTest.h"

@implementation FileManagerTest


- (void)setUp
{
    [super setUp];
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    self.libPath = paths[0];
    self.fileManager = [NSFileManager defaultManager];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//- (void)testCheckFileExist
//{
////    NSTimeInterval startTime = [[NSDate date] timeIntervalSince1970];
//    NSString *filesPath = [self.libPath stringByAppendingPathComponent:@"Files"];
//    BOOL isExist = NO;
//    for (NSInteger i = 0; i < 10000; i++) {
//        NSString * fileName = [NSString stringWithFormat:@"%d.png", i];
//        NSString *path = [filesPath stringByAppendingPathComponent:fileName];
//        isExist = [BFileUtils checkFileExists:path];
//    }
////    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970];
////    NSTimeInterval costTime = endTime - startTime;
////    NSLog(@"cost time : %f", costTime);
//    XCTAssert(isExist, @"File %@ is not exists.", filesPath);
//}

- (void)testCheckFileExist
{
    NSString *path = [self.libPath stringByAppendingPathComponent:@"Files/1.png"];
    BOOL isExist = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        isExist = [self.fileManager fileExistsAtPath:path];
    }
    XCTAssert(isExist, @"File %@ is not exists.", path);
}



- (void)testCheckDirExist
{    NSString *path = [self.libPath stringByAppendingPathComponent:@"Files/1.png"];
    BOOL isExist = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        BOOL isDir = NO;
        isExist = [self.fileManager fileExistsAtPath:path isDirectory:&isDir];
    }
    XCTAssert(isExist, @"File %@ is not exists.", path);
}


- (void)testCheckFileIsNotExist
{
    NSString *path = [self.libPath stringByAppendingPathComponent:@"Files/2.png"];
    BOOL isExist = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        isExist = [self.fileManager fileExistsAtPath:path];
    }
    XCTAssert(isExist, @"File %@ is not exists.", path);
}



@end

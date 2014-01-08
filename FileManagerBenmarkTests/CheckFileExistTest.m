//
//  CheckFileExistTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface CheckFileExistTest : FileManagerTest

@end

@implementation CheckFileExistTest

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}


#pragma mark - Check File Exist


#ifdef TEST_CHECK_FILE_EXIST

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
    NSString *path = [self.testPath stringByAppendingPathComponent:@"Test.data"];
    BOOL isExist = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        isExist = [self.fileManager fileExistsAtPath:path];
    }
    XCTAssert(isExist, @"File %@ is not exists.", path);
}



- (void)testCheckDirExist
{
    NSString *path = self.testPath;
    BOOL isExist = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        BOOL isDir = NO;
        isExist = [self.fileManager fileExistsAtPath:path isDirectory:&isDir];
    }
    XCTAssert(isExist, @"File %@ is not exists.", path);
}


- (void)testCheckFileIsNotExist
{
    NSString *path = [self.testPath stringByAppendingPathComponent:@"3.png"];
    BOOL isExist = NO;
    for (NSInteger i = 0; i < 10000; i++) {
        isExist = [self.fileManager fileExistsAtPath:path];
    }
    XCTAssert(isExist, @"File %@ is not exists.", path);
}

#endif

@end

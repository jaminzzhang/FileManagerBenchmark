//
//  MoveFileTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface MoveFileTest : FileManagerTest

@end

@implementation MoveFileTest

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


#define TEST_MOVE_FILE
#ifdef TEST_MOVE_FILE
- (void)testMoveFileTest
{
    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
    NSString * fromPath = nil;
    NSString * toPath = nil;
    BOOL successfull = NO;
    for (NSInteger i = 0; i < 1000; i++) {
        NSError * error = nil;
        fromPath = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"cp%d.data", i]];
        toPath = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"mv%d.data", i]];
        successfull = [self.fileManager moveItemAtPath:fromPath toPath:toPath error:&error];
//        successfull = [self.fileManager moveItemAtURL:[NSURL fileURLWithPath:fromPath]
//                                                toURL:[NSURL fileURLWithPath:toPath]
//                                                error:&error];
    }

    XCTAssert(successfull, @"move File %@ Failed.", fromPath);
}


//- (void)testMoveBigFileTest
//{
//    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
//    NSString * fromPath = [fatherPath stringByAppendingPathComponent:@"1.rmvb"];
//    NSString * toPath = [fatherPath stringByAppendingPathComponent:@"2.rmvb"];
//    BOOL successfull = NO;
//    for (NSInteger i = 0; i < 10001; i++) {
//        NSError * error = nil;
//        successfull = [self.fileManager moveItemAtPath:fromPath toPath:toPath error:&error];
//        NSString * tempPath = fromPath;
//        fromPath = toPath;
//        toPath = tempPath;
//    }
//
//    XCTAssert(successfull, @"copy File %@ Failed.", fromPath);
//}
//

#endif

@end

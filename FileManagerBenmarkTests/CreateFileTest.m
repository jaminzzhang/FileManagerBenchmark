//
//  CreateFileTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"


@interface CreateFileTest : FileManagerTest


@property (nonatomic) NSData * contentData;

@end

@implementation CreateFileTest

- (void)setUp
{
    [super setUp];

//    [self.fileManager removeItemAtPath:self.testTempPath error:nil];
//    if (![self.fileManager fileExistsAtPath:self.testTempPath]) {
//        NSError * error = nil;
//        [self.fileManager createDirectoryAtPath:self.testTempPath
//                    withIntermediateDirectories:YES
//                                     attributes:nil
//                                          error:&error];
//        if (nil != error) {
//            NSLog(@"Create Directory erorr:%@", error);
//        }
//    }

//    self.contentData = [NSData data];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"data"];
    self.contentData = [NSData dataWithContentsOfFile:filePath];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

#pragma mark - Create File

//#define TEST_CREATE_FILE
#ifdef TEST_CREATE_FILE

//
//- (void)testCreatingDir
//{
//    NSString *fatherPath = self.testTempPath;
//    NSString * path = nil;
//    BOOL successfull = NO;
//    for (NSInteger i = 0; i < 1000; i++) {
//        path = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%d", i]];
//        NSError * error = nil;
//        successfull = [self.fileManager createDirectoryAtPath:path
//                                  withIntermediateDirectories:YES
//                                                   attributes:nil
//                                                        error:&error];
//    }
//
//    XCTAssert(successfull, @"create Dir %@ successfully.", path);
//}


- (void)testCreatingFile
{
    NSString *fatherPath = self.testTempPath;//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
    NSString * path = nil;
    BOOL successfull = NO;
    for (NSInteger i = 0; i < 1000; i++) {
        path = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.data", i]];
        successfull = [self.fileManager createFileAtPath:path contents:self.contentData attributes:nil];
    }

    XCTAssert(successfull, @"create File %@ successfully.", path);
}
//
//- (void)testDataWriteFile
//{
//    NSString *fatherPath = [self.testTempPath stringByExpandingTildeInPath];//[self.testPath stringByAppendingPathComponent:@"TestCreateFile"];
//    NSString * path = nil;
//    BOOL successfull = NO;
//    for (NSInteger i = 0; i < 1000; i++) {
//        path = [fatherPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%d.data", i]];
////        successfull = [self.fileManager createFileAtPath:path contents:[NSData data] attributes:nil];
//        successfull = [self.contentData writeToFile:path atomically:NO];
//    }
//
//    XCTAssert(successfull, @"create File %@ successfully.", path);
//}



#endif


@end

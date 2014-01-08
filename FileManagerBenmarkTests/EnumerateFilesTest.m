//
//  EnumerateFilesTest.m
//  FileManagerBenmark
//
//  Created by Jamin on 1/7/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileManagerTest.h"

@interface EnumerateFilesTest : FileManagerTest

@end

@implementation EnumerateFilesTest

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


#ifdef TEST_FILE_ENUMERATION

- (void)testContentsOfDirectory
{
    NSString * path = self.testTempPath;
    NSError * error = nil;
    NSArray * contentFiles = [self.fileManager contentsOfDirectoryAtPath:path error:nil];
    NSMutableArray * files = [NSMutableArray array];
    for (NSString * file in contentFiles) {
        [files addObject:file];
        //        NSLog(@"%@", fileAttributeDic);
    }

    XCTAssert(nil == error, @"Enumerate File %@ Failed %@.", path, error);
}



- (void)testSubpathsOfDirectory
{
    NSString * path = self.testTempPath;
    NSError * error = nil;
    NSArray * contentFiles = [self.fileManager subpathsOfDirectoryAtPath:path error:&error];
    NSMutableArray * files = [NSMutableArray array];
    for (NSString * file in contentFiles) {
        [files addObject:file];
        //        NSLog(@"%@", fileAttributeDic);
    }

    XCTAssert(nil == error, @"Enumerate %@ Failed %@.", path, error);
}


- (void)testPathEnumerator
{
    NSString * path = self.testTempPath;
//    NSDictionary * fileAttributeDic = nil;
    NSDirectoryEnumerator * enumerator = [self.fileManager enumeratorAtPath:path];
    NSMutableArray * files = [NSMutableArray array];
    for (NSString * file in enumerator) {
        [files addObject:file];
    }

    XCTAssert(nil != enumerator, @"Enumerate %@ Failed.", path);
}



- (void)testEnumeratorAtURL
{
    NSString * path = self.testTempPath;
    NSURL * pathURL = [NSURL fileURLWithPath:path];
    NSError * error = nil;
    NSDirectoryEnumerator * enumerator = [self.fileManager enumeratorAtURL:pathURL
                                                includingPropertiesForKeys:@[NSURLNameKey, NSURLIsDirectoryKey]
                                                                   options:0//NSDirectoryEnumerationSkipsSubdirectoryDescendants
                                                              errorHandler:nil];
    NSMutableArray * files = [NSMutableArray array];
    for (NSURL * fileURL in enumerator) {
        NSString *fileName = nil;
        [fileURL getResourceValue:&fileName forKey:NSURLNameKey error:NULL];
        [files addObject:fileName];

//        NSNumber * fileSizeNum = nil;
//        [fileURL getResourceValue:&fileSizeNum forKey:NSURLFileSizeKey error:NULL];
        //        NSLog(@"%@", fileAttributeDic);
    }

    XCTAssert(nil == error, @"Enumerate %@ Failed %@.", path, error);
}





#endif


@end

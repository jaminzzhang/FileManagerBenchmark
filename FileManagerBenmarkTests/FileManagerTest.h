//
//  FileManagerTest.h
//  FileManagerBenmark
//
//  Created by Jamin on 1/5/14.
//  Copyright (c) 2014 tencent. All rights reserved.
//

#import <XCTest/XCTest.h>



//#define TEST_CREATE_FILE
//#define TEST_CHECK_FILE_EXIST
//#define TEST_COPY_FILE
//#define TEST_MOVE_FILE
//#define TEST_REMOVE_FILE
//#define TEST_LINK_FILE
//#define TEST_FILE_ATTRIBUTES
#define TEST_FILE_ENUMERATION


@interface FileManagerTest : XCTestCase

@property (nonatomic) NSString * libPath;
@property (nonatomic) NSString * testPath;
@property (nonatomic) NSString * testTempPath;

@property (nonatomic) NSFileManager * fileManager;


@end

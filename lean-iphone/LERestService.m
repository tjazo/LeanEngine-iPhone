/*
 * This software is released under the GNU Lesser General Public License v3.
 * For more information see http://www.gnu.org/licenses/lgpl.html
 *
 * Copyright (c) 2011, Peter Knego & Matjaz Tercelj
 * All rights reserved.
 */


#import "LERestService.h"
#import "SBJsonParser.h"
#import "LEManager.h"
#import "LEEntity.h"
#import "JSON.h"


NSMutableData *receivedData;

@implementation LERestService

- (NSArray *)getPrivateEntities:(NSString *)kind {
    LEManager *leanManager = [LEManager getInstance];

    NSMutableString *appUrlString = [[NSMutableString alloc] initWithString:leanManager.hostURL];

    if (kind == nil) {
        [appUrlString appendString:@"/rest/v1/entity?lean_token="];
    } else {
        [appUrlString appendString:@"/rest/v1/entity/"];
        [appUrlString appendString:kind];
        [appUrlString appendString:@"?lean_token="];
    }
    [appUrlString appendString:leanManager.token];

    NSMutableURLRequest *mutableRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:appUrlString]];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Downloading Entities" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125, 50, 30, 30)];
    progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [alert addSubview:progress];
    [progress startAnimating];
    [alert show];

    NSURLResponse *response;
    NSError *error;
    NSData *dataReply = [NSURLConnection sendSynchronousRequest:mutableRequest returningResponse:&response error:&error];
    [alert dismissWithClickedButtonIndex:0 animated:YES];
    return [self getEntitiesFrom:dataReply];
}

- (NSMutableArray *)getEntitiesFrom:(NSData *)responseData {
    NSString *stringReply = (NSString *) [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    NSLog(stringReply);

    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSError *jsonError;

    NSDictionary *jsonResponse = [parser objectWithString:stringReply error:&jsonError];
    NSArray *elementsArray = [jsonResponse objectForKey:@"result"];

    NSMutableArray *entities = [[[NSMutableArray alloc] initWithCapacity:elementsArray.count] autorelease];
    for (NSDictionary *element in elementsArray) {
        LEEntity *entity = [LEEntity new];
        NSMutableDictionary *properties = [NSMutableDictionary new];
        for (id key in [element allKeys]) {
            if ([key isEqualToString:@"_id"]) {
                entity.entityId = (long) [element objectForKey:@"_id"];
            } else if ([key isEqualToString:@"_account"]) {
                entity.accountId = (long) [element objectForKey:@"_account"];
            } else if ([key isEqualToString:@"_kind"]) {
                entity.kind = (long) [element objectForKey:@"_kind"];
            } else {
                [properties setObject:[element objectForKey:key] forKey:key];
            }
            entity.properties = properties;
        }
        [entities addObject:entity];

        [entity release];
        [properties release];
    }
    [parser release];
    return entities;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    [connection release];
    [receivedData release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [connection release];
    [receivedData release];

    NSLog(@"Connection failed! Error - %@ %@",
            [error localizedDescription],
            [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
}

- (void)putPrivateEntityAsync:(LEEntity *)entity {


    NSDictionary *entityData = [entity getEntityData];
    NSString *jsonString = [entityData JSONRepresentation];


    NSMutableString *urlString;
    NSMutableString *httpBodyString;
    httpBodyString = [[NSMutableString alloc] initWithString:jsonString];

    LEManager *leanManager = [LEManager getInstance];

    urlString = [[NSMutableString alloc] initWithString:leanManager.hostURL];
    [urlString appendString:@"/rest/v1/entity/"];
    [urlString appendString:entity.kind];
    [urlString appendString:@"?lean_token="];
    [urlString appendString:leanManager.token];

    NSURL *url;
    url = [[NSURL alloc] initWithString:urlString];
    [urlString release];

    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    [url release];

    [urlRequest setHTTPMethod:@"POST"];
    [urlRequest setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    [urlRequest setHTTPBody:[httpBodyString dataUsingEncoding:NSUTF8StringEncoding]];
    [httpBodyString release];

//    NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Saving Entity" message:@" " delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    UIActivityIndicatorView *progress = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(125, 50, 30, 30)];
    progress.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [alert addSubview:progress];
    [progress startAnimating];
    [alert show];

    NSURLResponse *response;
    NSError *error;
    NSData *dataReply = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    [alert dismissWithClickedButtonIndex:0 animated:YES];

    if (!dataReply) {
        NSLog(@"Failed to submit request");
    }
}

@end
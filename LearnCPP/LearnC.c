//
//  LearnC.c
//  LearnCPP
//
//  Created by yuchen liu on 26/11/2016.
//  Copyright © 2016 rain. All rights reserved.
//

#include <stdio.h>
#include <string.h>
#include <stdarg.h>
#include <errno.h>
#include <stdlib.h>

struct Books {
    char title[50];
    char author[50];
    char subject[100];
    int  book_id;
};

/* define simple structure */
struct {
    unsigned int widthValidated;
    unsigned int heightValidated;
} status1;

/* define a structure with bit fields */
struct {
    unsigned int widthValidated : 1;
    unsigned int heightValidated : 1;
} status2;

/* function declaration */
void printBook( struct Books *book );
double average(int num,...);

int main_c() {
    struct Books Book1;        /* Declare Book1 of type Book */
    struct Books Book2;        /* Declare Book2 of type Book */
    
    /* book 1 specification */
    strcpy( Book1.title, "C Programming");
    strcpy( Book1.author, "Nuha Ali");
    strcpy( Book1.subject, "C Programming Tutorial");
    Book1.book_id = 6495407;
    
    /* book 2 specification */
    strcpy( Book2.title, "Telecom Billing");
    strcpy( Book2.author, "Zara Ali");
    strcpy( Book2.subject, "Telecom Billing Tutorial");
    Book2.book_id = 6495700;
    
    /* print Book1 info by passing address of Book1 */
    printBook( &Book1 );
    
    /* print Book2 info by passing address of Book2 */
    printBook( &Book2 );
    
    printf( "Memory size occupied by status1 : %lu\n", sizeof(status1));
    printf( "Memory size occupied by status2 : %lu\n", sizeof(status2));
    
    char str[100];
    int i;
    
    printf( "Enter a value :");
    scanf("%s %d", str, &i);
    
    printf( "\nYou entered: %s %d ", str, i);
    
    printf("File :%s\n", __FILE__ );
    printf("Date :%s\n", __DATE__ );
    printf("Time :%s\n", __TIME__ );
    printf("Line :%d\n", __LINE__ );
    
    /*  error handle
     Value of errno: 2
     Error printed by perror: No such file or directory
     Error opening file: No such file or directory
     */
    FILE * pf;
    int errnum;
    pf = fopen ("unexist.txt", "rb");
    
    if (pf == NULL) {
        errnum = errno;
        fprintf(stderr, "Value of errno: %d\n", errno);
        perror("Error printed by perror");
        fprintf(stderr, "Error opening file: %s\n", strerror( errnum ));
    }
    else {
        fclose (pf);
    }
    
    // C - Variable Arguments
    printf("Average of 2, 3, 4, 5 = %f\n", average(4, 2,3,4,5));
    printf("Average of 5, 10, 15 = %f\n", average(3, 5,10,15));
    
    // C - Memory Management
    char name[100];
    char *description;
    
    strcpy(name, "Zara Ali");
    
    /* allocate memory dynamically */
    description = malloc( 30 * sizeof(char) );
    
    if( description == NULL ) {
        fprintf(stderr, "Error - unable to allocate required memory\n");
    }
    else {
        strcpy( description, "Zara ali a DPS student.");
    }
    
    /* suppose you want to store bigger description */
    description = realloc( description, 100 * sizeof(char) );
    
    if( description == NULL ) {
        fprintf(stderr, "Error - unable to allocate required memory\n");
    }
    else {
        strcat( description, "She is in class 10th");
    }
    
    printf("Name = %s\n", name );
    printf("Description: %s\n", description );
    
    /* release memory using free() function */
    free(description);
    
    return 0;
}

/* function definition */
void printBook( struct Books *book ) {
    printf( "Book title : %s\n", book->title);
    printf( "Book author : %s\n", book->author);
    printf( "Book subject : %s\n", book->subject);
    printf( "Book book_id : %d\n", book->book_id);
}

/* accept variable number of parameters based on your requirement */
double average(int num,...) {
    
    va_list valist;
    double sum = 0.0;
    int i;
    
    /* initialize valist for num number of arguments */
    va_start(valist, num);
    
    /* access all the arguments assigned to valist */
    for (i = 0; i < num; i++) {
        sum += va_arg(valist, int);
    }
    
    /* clean memory reserved for valist */
    va_end(valist);
    
    return sum/num;
}

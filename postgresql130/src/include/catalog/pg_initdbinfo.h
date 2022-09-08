#ifndef PG_INITDBINFO_H
#define PG_INITDBINFO_H
    
#include "catalog/genbki.h"
#include "catalog/pg_initdbinfo_d.h"
    
    
    CATALOG(pg_initdbinfo,2121,InitdbinfoRelationId)
    {
        Oid      id; 
        NameData username;
        NameData initdbtime;
    } FormData_pg_initdbinfo;
    
    typedef FormData_pg_initdbinfo *Form_pg_initdbinfo;
    
    
#endif                          /* PG_INITDBINFO_H */

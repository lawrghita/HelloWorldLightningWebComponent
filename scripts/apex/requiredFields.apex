Schema.DescribeSObjectResult r = Case.sObjectType.getDescribe();
            Map<String,Schema.SObjectField> M = r.fields.getMap();
            for(String fieldName : M.keySet())
            { 
                Schema.SObjectField field = M.get(fieldName);
                Schema.DescribeFieldResult F = field.getDescribe();
               //A nillable field can have empty content. A isNillable Boolean non-nillable field must have a value for the object to be                       //created or saved. 
              // if F.isNillable() is false then field is mandatory
              if(!F.isNillable())
                  system.debug(fieldName + ' - is Required type:'+F.getType());
           }
package com.throne212.jianzhi8.domain;
// default package



/**
 * TypeId entity. @author MyEclipse Persistence Tools
 */

public class TypeId  implements java.io.Serializable {


    // Fields    

     private String typeCode;
     private String typeName;


    // Constructors

    /** default constructor */
    public TypeId() {
    }

    
    /** full constructor */
    public TypeId(String typeCode, String typeName) {
        this.typeCode = typeCode;
        this.typeName = typeName;
    }

   
    // Property accessors

    public String getTypeCode() {
        return this.typeCode;
    }
    
    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getTypeName() {
        return this.typeName;
    }
    
    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof TypeId) ) return false;
		 TypeId castOther = ( TypeId ) other; 
         
		 return ( (this.getTypeCode()==castOther.getTypeCode()) || ( this.getTypeCode()!=null && castOther.getTypeCode()!=null && this.getTypeCode().equals(castOther.getTypeCode()) ) )
 && ( (this.getTypeName()==castOther.getTypeName()) || ( this.getTypeName()!=null && castOther.getTypeName()!=null && this.getTypeName().equals(castOther.getTypeName()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getTypeCode() == null ? 0 : this.getTypeCode().hashCode() );
         result = 37 * result + ( getTypeName() == null ? 0 : this.getTypeName().hashCode() );
         return result;
   }   





}
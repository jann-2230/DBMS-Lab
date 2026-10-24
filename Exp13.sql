BEGIN
    DBMS_XMLSCHEMA.registerSchema(
        schemaurl => 'my_schema.xsd',
        schemadoc => '
        <xs:schema
        xmlns:xs="http://www.w3.org/2001/XMLSchema"
        elementFormDefault="qualified">

        <xs:element name="shiporder">
        <xs:complexType>
        <xs:sequence>

        <xs:element name="orderperson"
                    type="xs:string"/>

        <xs:element name="shipto">
        <xs:complexType>
        <xs:sequence>
        <xs:element name="name" type="xs:string"/>
        <xs:element name="address" type="xs:string"/>
        <xs:element name="city" type="xs:string"/>
        <xs:element name="country" type="xs:string"/>
        </xs:sequence>
        </xs:complexType>
        </xs:element>

        <xs:element name="item" maxOccurs="unbounded">
        <xs:complexType>
        <xs:sequence>
        <xs:element name="title" type="xs:string"/>
        <xs:element name="note" type="xs:string"
                    minOccurs="0"/>
        <xs:element name="quantity"
                    type="xs:positiveInteger"/>
        <xs:element name="price" type="xs:decimal"/>
        </xs:sequence>
        </xs:complexType>
        </xs:element>

        </xs:sequence>

        <xs:attribute name="orderid"
                      type="xs:string" use="required"/>
        </xs:complexType>
        </xs:element>

        </xs:schema>',
        local => TRUE,
        gentypes => FALSE,
        gentables => FALSE
    );
END;
/

CREATE TABLE t1 (
    id NUMBER,
    xml_doc XMLTYPE
);

INSERT INTO t1 VALUES (
    1,
    XMLTYPE(q'[
    <shiporder orderid="889923">
        <orderperson>John Smith</orderperson>
        <shipto>
            <name>Ola Nordmann</name>
            <address>Langgt 23</address>
            <city>Stavanger</city>
            <country>Norway</country>
        </shipto>
        <item>
            <title>Empire Burlesque</title>
            <note>Special Edition</note>
            <quantity>1</quantity>
            <price>10.90</price>
        </item>
    </shiporder>
    ]')
);

INSERT INTO t1 VALUES (
    2,
    XMLTYPE(q'[
    <shiporder orderid="889923">
        <orderperson>John Smith</orderperson>
        <shipto>
            <name1>Ola Nordmann</name1>
            <address>Langgt 23</address>
            <city>Stavanger</city>
            <country>Norway</country>
        </shipto>
        <item>
            <title>Empire Burlesque</title>
            <quantity>1</quantity>
            <price>10.90</price>
        </item>
    </shiporder>
    ]')
);

COMMIT;

SELECT id,
       xml_doc.isSchemaValid('my_schema.xsd') AS is_valid
FROM t1;
